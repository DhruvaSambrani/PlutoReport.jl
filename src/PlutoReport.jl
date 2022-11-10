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
    show_abstract

"""
    apply_css_fixes()

Apply fixes to Pluto's UI to make it better for reports and presentations.
Must be the last statement in a cell.
"""
function apply_css_fixes()
    return html"""
<style>
	pluto-helpbox {
		display: none;
	}
	pluto-logs-container{
		display:none
	}
	footer {
		visibility: collapse;
	}
    .markdown{
        font-size: 20px;
    }
    main {
        max-width: 80%;
    }
    pluto-output>div>img {
        margin: auto;
        display: block;
    }
    .toc-row {
        margin: 0 !important;
    }
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
