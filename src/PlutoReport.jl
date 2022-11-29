"""
# `PlutoReport`

A Package to make reports and talks in [Pluto.jl](https://github.com/fonsp/Pluto.jl).

## Usage

    using PlutoReport

    @bind pval presentation_controls(aside=true)

    presentation_ui(pval)

    apply_css_fixes()

    Title("A test title", "some subtitle", "Some person", "Some institution")

    md"## A beautiful Report"

    @bind references References()

    display_bibliography("./bibliography.bibtex", references)
"""
module PlutoReport
using Reexport

@reexport using PlutoUI
@reexport using Bibliography
@reexport using HypertextLiteral

import Downloads
import JSON3

export apply_css_fixes,
    slidebreak, topslidebreak, centerslidebreak,
    Title, make_title,
    PresentationControls, presentation_ui, presentation_controls,
    References, display_bibliography, @cite_str, cite,
    style_citations,
    CiteCSS, Superscript, Highlighted, JustBold,
    CiteStyle, By_Id, By_Number, By_AuthorDate,
    show_abstract

"""
    apply_css_fixes(;helpbox=true, logs=true, footer=true, print=true)

Apply fixes to Pluto's UI to make it better for reports and presentations.
Set any of the parameters to false if you do not want to apply those.
Must be the last statement in a cell.
"""
function apply_css_fixes(;helpbox=true, logs=true, footer=true, print=true)
    printcss = """
    @media print {
        main {max-width: 100%; }
        .markdown {font-size: 10pt;}
        #refresh_references {display: none;}
        pluto-cell { min-height: 0; }
        pluto-output { overflow: hidden; }
        .raw-html-wrapper span ol{ break-inside: unset; }
    }
    """

    return @htl """
<style>
    $(if helpbox "pluto-helpbox { display: none; }" end)
    $(if logs "pluto-logs-container{ display:none; }" end)
    $(if footer "footer {visibility: collapse;}" end)
    .markdown{ font-size: 20px; }
    main { max-width: 80%; }
    pluto-output>div>img { margin: auto; display: block; }
    .toc-row { margin: 0 !important; padding: 0 !important; }
    $(if print printcss end)
</style>
<script>document.body.classList.add("disable_ui")</script>"""
end

"""
    slidebreak

Start a new slide here, slide content is centered.

See also [`centerslidebreak`](@Ref) and [`topslidebreak`](@Ref)
"""
slidebreak=html"<h1></h1>"

"""
    centerslidebreak

Start a new slide here, slide content is centered.

See also [`slidebreak`](@Ref) and [`topslidebreak`](@Ref)
"""
centerslidebreak=html"<h1></h1>"

"""
    topslidebreak

Start a new slide here, slide content is aligned top.

See also [`slidebreak`](@Ref) and [`centerslidebreak`](@Ref)
"""
topslidebreak=html"<h2></h2>"

"""
    seperator

Visual seperator for any location
"""
seperator=html"<hr>"

include("presentation.jl")
include("Title.jl")
include("references.jl")
include("abstracts.jl")

end # module
