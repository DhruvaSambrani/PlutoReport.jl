"""
    display_bibentry(entry::Bibliography.BibInternal.Entry)::HypertextLiteral.Result

Returns a display for a bibentry.

See also [`display_bibliography`](@ref)
"""
function display_bibentry(entry::Bibliography.BibInternal.Entry)::HypertextLiteral.Result
    @htl (
        """
        <li id="$(entry.id)">
            <b>[$(entry.id)]:</b>
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

See also [`@cite_str`](@ref), [`References`](@ref)
"""
function display_bibliography(bibtexpath::String, citations)::HypertextLiteral.Result
    if !(citations isa Vector{String})
        return htl"No references yet"
    end
    bibs = import_bibtex(bibtexpath)
    entries = getindex.(Ref(bibs), unique(citations))
    return @htl("""<ol>$(display_bibentry.(values(entries)))</ol>""")
end


function cite(s::String)::HypertextLiteral.Result
    @htl """
    <script>document.getElementById("refresh_references").click()</script>
    <a style="cursor: pointer" onclick="document.getElementById('refresh_references').scrollIntoView({block: 'center'})">
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
Use with [`display_bibliography`](@ref)

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