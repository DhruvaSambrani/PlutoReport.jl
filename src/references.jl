"""
    display_bibentry(entry::Bibliography.BibInternal.Entry)::HypertextLiteral.Result

Returns a display for a bibentry.
Must be the last statement in a cell.

See also [`display_bibliography`](@ref)
"""
function display_bibentry(entry::Bibliography.BibInternal.Entry)::HypertextLiteral.Result
    @htl (
        """
        <li id="$(entry.id)">
            <b style="cursor:pointer" data-link='$(entry.access.doi)::$(Bibliography.xlink(entry))'>[$(entry.id)]:</b>
            [$(Bibliography.xyear(entry))] 
            <a href="$(Bibliography.xlink(entry))"><span style="font-size: 1.1rem;">$(Bibliography.xtitle(entry));</span></a>
            <i>$(Bibliography.xnames(entry))</i>;
            DOI:$(entry.access.doi)
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
    </script>
    <ol>$(display_bibentry.(values(entries)))</ol>
    </span>
    """)
end


function cite(s::String)::HypertextLiteral.Result
    @htl """
    <style>
    .cite {
        cursor: pointer;
        background: #ff830088;
        color: white;
        font-weight: bold;
        padding: 4px !important;
        border-radius: 8px;
    }
    </style>
    <script>document.getElementById("refresh_references").click()</script>
    <a class='cite' onclick="document.getElementById('refresh_references').scrollIntoView({block: 'center'})">
    [<span class="reference" data-pl-cite-id="$(first(split(s, "::")))">$(last(split(s, "::")))</span>]
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
    var citelist = Array.from(document.querySelectorAll(".reference")).map( t=>{return t.dataset.plCiteId})
        console.log(citelist)
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

