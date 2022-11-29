"""
    nice_title(raw_title::String)::String

Removes any curly braces in titles
"""
nice_bib(raw_bib::String)::String = replace(raw_bib, '{'=>"", '}'=>"")

"""
    display_bibentry(entry::Bibliography.BibInternal.Entry)::HypertextLiteral.Result

Returns a display for a bibentry.

See also [`display_bibliography`](@ref)
"""
function display_bibentry(entry::Bibliography.BibInternal.Entry)::HypertextLiteral.Result
    @htl (
        """
        <li id="$(entry.id)">
            <b style="cursor:pointer" data-link='$(entry.access.doi)::$(Bibliography.xlink(entry))'>[$(entry.id)]:</b>
            $(isnothing(Bibliography.xyear(entry)) ? "" : "[$(Bibliography.xyear(entry))]")
            <a href="$(Bibliography.xlink(entry))"><span style="font-size: 1.1rem;">$(nice_bib(Bibliography.xtitle(entry)));</span></a>
            <i>$(nice_bib(Bibliography.xnames(entry)))</i>;
            $(isnothing(entry.access.doi) ? "" : "DOI: $(entry.access.doi)")
        </li>
        """
    )
end

"""
    display_bibliography(bibtexpath::String, citations) ::HypertextLiteral.Result

Returns all cited references from a reference BibTex file at `bibtexpath` and `citations`.
It can also be bound to a variable to be used with [`show_abstract`](@ref)

See also [`@cite_str`](@ref), [`References`](@ref)
"""
function display_bibliography(bibtexpath::String, citations)::HypertextLiteral.Result
    if !(citations isa Vector{String})
        return htl"No references yet"
    end
    bibs = import_bibtex(bibtexpath)
    entries = getindex.(Ref(bibs), unique(citations))
    return @htl("""
    <span>
    <script>
    const span = currentScript.parentElement
    Array.from(span.getElementsByTagName('b')).map(el=>{
        el.addEventListener("click", (e)=>{
            span.value = el.getAttribute('data-link')
            span.dispatchEvent(new CustomEvent("input"))
            e.preventDefault()
        })
    })
    currentScript.parentElement.parentElement.parentElement.style.breakInside='auto'
    </script>
    <ol>$(display_bibentry.(values(entries)))</ol>
    </span>
    """)
end


function cite(s::String)::HypertextLiteral.Result
    @htl """
    <script>document.getElementById("refresh_references").click()</script>
    <a class='cite' onclick="document.getElementById('refresh_references').scrollIntoView({block: 'center'})">
    [<span class="reference" data-pl-cite-id="$(first(split(s, "::")))" title="$(last(split(s, "::")))">$(first(split(s, "::")))</span>]
    </a>"""
end

"""
    @cite_str -> HypertextLiteral.Result

Create an inline citation from `string`

# Example

`cite"test1"`

This creates a citation for bibtex entry with id as _test1_

See also [`display_bibliography`](@ref), [`References`](@ref)
"""
macro cite_str(s)
    return cite(s)
end


"""
    CiteStyle

An `Enum` with values By_Number and By_Id to control content
of inline citations.

See also [`style_citations`](@ref)
"""
@enum CiteStyle By_Number By_Id By_AuthorDate

"""
    CiteCSS

An `Enum` with values Superscript and Highlighted to control styling
of inline citations.

See also [`style_citations`](@ref)
"""
@enum CiteCSS Superscript Highlighted JustBold

"""
    style_citations(citations, bibtexpath::String; css::Union{CiteCSS, HypertextLiteral.Result}=Superscript, content::Union{CiteStyle, Function}=By_Id) :: HypertextLiteral.Result

Style inline citations. `citations` is a Bond to [`References`](@ref), `bibtexpath` is path to the bibtex file.
`content` can either be a [`CiteStyle`](@ref) or a Function, that is of the form 
`(citeid::String, bibtexpath::String)::String`, whose output will replace the id in the citations

See also [`CiteStyle`](@ref)

"""
function style_citations(citations, bibtexpath::String; css::Union{CiteCSS, HypertextLiteral.Result}=Superscript, content::Union{CiteStyle, Function}=By_Id) :: HypertextLiteral.Result
    if !(citations isa Vector{String})
        return htl"No references yet"
    end
    csshtl = if css == Superscript
        @htl """
        <style>
        .cite {
            font-weight: bold; font-size: 0.8rem; margin: 0; padding: 0 !important; 
            cursor: pointer; vertical-align: super; line-height: normal;
        } 
        .reference { cursor: pointer !important; }
        </style>
        """
    elseif css == Highlighted
        @htl """
        <style>
        .cite { cursor: pointer; background: #ff830088; color: white; font-weight: bold;
        padding: 4px !important; border-radius: 8px; }
        .reference { cursor: pointer !important; }
        </style>
        """
    elseif css == JustBold
        @htl """ <style> .cite {
            cursor: pointer; font-weight: bold; margin: 0; padding: 0 !important;
        }
        .reference { cursor: pointer !important; }
        </style>"""
    else
        css
    end
    
    function js_replacecontent(ls)
        @htl ("""
            <script>
            var ls = $(ls)
            var ns = Array.from(document.querySelectorAll(".reference"))
            ls.map(k=>{ ns.map(t=>{ if (t.dataset.plCiteId == k[1]) { t.innerHTML = k[0] } }) })
            </script>
        """)
    end
    
    contenthtl = if content == By_Id
        @htl """<script>
        var ns = Array.from(document.querySelectorAll(".reference")).map(t=>{ 
            t.innerHTML = t.dataset.plCiteId 
        })
        </script>"""
    elseif content == By_Number
        ls = collect.(enumerate(unique(citations)))
        js_replacecontent(ls)
    elseif content == By_AuthorDate
        bibs = import_bibtex(bibtexpath)
        ls = map(unique(citations)) do c
            authors = split(Bibliography.xnames(bibs[c], names=:last), ",")
            year = Bibliography.xyear(bibs[c])
            return [authors[1] * (length(authors)>1 ? " et. al, " : ", ") * string(year), c]
        end
        js_replacecontent(ls)
    else
        cs = unique(citations)
        js_replacecontent(collect.(zip(content.(cs, bibtexpath), cs)))
    end
    @htl "$(csshtl)\n$(contenthtl)"
end

"""
    References() :: HypertextLiteral.Result

Returns a PlutoUI widget which updates a Bond with the list of all citations (with repetition) in the report.
Use with [`display_bibliography`](@ref), with this bound to a variable using `@bind`

See also [`display_bibliography`](@ref), [`@cite_str`](@ref)
"""
function References()
    @htl("""
    <span>
    <h1>References</h1>
    <button id="refresh_references" onclick=getcitelist()>Refresh References</button>

    <script>
    function getcitelist() {
        var citelist = Array.from(document.querySelectorAll(".reference")).map(t=>{return t.dataset.plCiteId})
        return citelist
    }
    const span = currentScript.parentElement
    const button = span.querySelector("button")
    button.addEventListener("click", (e)=>{
        span.value = getcitelist()
        span.dispatchEvent(new CustomEvent("input"))
        e.preventDefault()
    })
    </script>
    </span>
    """)
end

