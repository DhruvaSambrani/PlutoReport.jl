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
            <b style="cursor:pointer" data-link='$(Bibliography.xlink(entry))'>[$(entry.id)]:</b>
                [$(Bibliography.xyear(entry))] 
                <a href="$(Bibliography.xlink(entry))"><span style="font-size: 1.1rem;">$(Bibliography.xtitle(entry));</span></a>
                <i>$(Bibliography.xnames(entry))</i>
                <a href="$(entry.access.doi)">$(entry.access.doi)</a>
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
    [<span class="reference">$(s)</span>]
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
        var citelist = Array.from(document.querySelectorAll(".reference")).map( t=>{return t.innerHTML})
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

function arxiv_abstract(link)
    HTML(match(
        r"<blockquote.*?>(.*?)</blockquote>"ms,
        read(download(link), String)
    ).captures[1])
end

function isarxiv(link)
    match()
end

"""
    show_abstract(link; aside=true)

Show the abstract of the link clicked in the [References](@ref) section

See also [`display_bibliography`](@ref), [`@cite_str`](@ref)
"""
function show_abstract(link; aside = true)
    if !(link isa String)
        text = @htl "No citation link clicked"
    elseif isarxiv(link)
        text = arxiv_abstract(link)
    end
    @htl """
    <style>
    .aside {
    	position: fixed;
    	top: 60px;
    	left: 10px;
    	max-width: 275px;
    	max-height: 400px;
    }
    #cite-article-container {
    	background-color: #484848;
    	padding: 12px;
    	border-radius: 4px;
    	z-index: 10000000;
    	display: flex;
    	flex-direction: column;
    }
    #cite-article {
    	overflow: auto;
    }
    .descriptor{
    	font-weight: bolder;
    }
    .article-hide {
    	display: none;
    }
    #cite-article-container h5 {
    	cursor: pointer;
    	color: #669966;
    }
    </style>
    <div id="cite-article-container" class="$(aside ? "aside" : "")">
    	<h5 onclick="document.getElementById('cite-article').classList.toggle('article-hide')">Abstract</h5>
    	<div id="cite-article" class="article-hide">$(text)</div>
    </div>
    """
end