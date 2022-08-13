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
</style>
<script>document.body.classList.add("disable_ui")</script>
    """
end

include("presentation.jl")
include("Title.jl")
include("references.jl")
include("abstracts.jl")

end # module
