"""
    Title(title::String, subtitle::String, author::String, affiliation::String) :: HypertextLiteral.Result    
    
Makes the title for the report. Must be the last statement in a cell.

See also [`make_title`](@ref)
"""
function Title(title::String, subtitle::String, author::String, affiliation::String)::HypertextLiteral.Result
    @htl """
        <h1 style="text-align:center">$(title)</h1>
        <div style="text-align:center">
        <p style="font-weight:bold; font-size: 35px; font-variant: small-caps; margin: 0px">$(subtitle)</p>
        <p style="font-size: 30px; font-variant: small-caps; margin: 0px">$(author)</p>
        <p style="font-size: 20px;">$(affiliation)</p>
        </div>
    """
end

"""`make_title` is an alias for [`Title`](@ref)"""
make_title = Title