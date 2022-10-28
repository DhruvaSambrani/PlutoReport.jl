
"""
    PresentationControls

alias for `NamedTuple{(:presentation_mode, :max_time, :clock),Tuple{Bool,Int64,Int64}}`, which is used in [`presentation_ui`](@ref)

See also [`presentation_ui`](@ref), [`presentation_controls`](@ref)
"""
PresentationControls = NamedTuple{(:presentation_mode, :max_time, :clock),Tuple{Bool,Int64,Int64}}


"""
    timeleft(pvals::PresentationControls) :: HypertextLiteral.Result

Returns  string which displays the time left in talk.
Must be the last statement in a cell.

See also [`presentation_ui`](@ref), [`presentation_controls`](@ref), [`PresentationControls`](@ref)
"""
function timeleft(pvals::PresentationControls)
    c = pvals.max_time * 60 - pvals.clock
    htl"""<div style="position: fixed; bottom: 10px; left: 10px; font-weight: bolder">$(c÷60):$(string(c%60, pad=2)) left</div>"""
end

"""
    presentation(pvals::PresentationControls) :: HypertextLiteral.Result

Returns htl string which turns UI into presentation mode.
Must be the last statement in a cell.

See also [`presentation_ui`](@ref), [`presentation_controls`](@ref), [`PresentationControls`](@ref)
"""
function presentation(pvals::PresentationControls)::HypertextLiteral.Result
    if pvals.presentation_mode
        htl"""<script>document.body.classList.add('presentation')</script><style type="text/css">* {cursor: inherit!important;}body {cursor: url(http://www.rw-designer.com/cursor-extern.php?id=102952), pointer !important;}</style>"""
    else
        htl"""<script>document.body.classList.remove('presentation')</script><style type="text/css">* {cursor: initial!important;}</style>"""
    end
end

"""
    presentation_ui(pvals::PresentationControls) :: HypertextLiteral.Result

Returns htl string with [`presentation`](@ref) and [`timeleft`](@ref)
Must be the last statement in a cell.

See also [`presentation_controls`](@ref), [`PresentationControls`](@ref)
"""
function presentation_ui(pvals::PresentationControls)::HypertextLiteral.Result
    @htl "$(presentation(pvals))\n$(timeleft(pvals))"
end

"""
    presentation_controls(aside::Bool = true) :: PlutoUI.CombineNotebook.CombinedBonds

Returns a PlutoUI widget which returns a [`PresentationControls`](@ref), and acts as a control panel for [`presentation_ui`](@ref).
Must be bound to a variable using `PlutoUI.bind`.

# Arguments

- `aside::Bool`: Whether control panel is floating

See also [`presentation_ui`](@ref), [`PresentationControls`](@ref)
"""
function presentation_controls(; aside::Bool = true)::PlutoUI.CombineNotebook.CombinedBonds
    PlutoUI.combine() do Child
        @htl ("""
<style>
.float-right {
    position: fixed;
    bottom: 40px;
    right: 10px;
}
#container {
    background-color: #484848;
    padding: 8px;
    border-radius: 8px;
    z-index: 10000000000
}
$(aside ? "#container #unit {
    display: none;
    }" : "" )
</style>
<div id="container" class="$(aside ? "float-right" : "")">
<b>Presentation Controls:</b><br>
<p>Presentation Mode: $(Child("presentation_mode", CheckBox()))</p>
<p>Max time: $(Child("max_time", Scrubbable(5:5:120, default=15))) minutes</p>
$(Child("clock", Clock()))
</div>
        """)
    end
end
