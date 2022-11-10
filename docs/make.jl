push!(LOAD_PATH, "../src/")

using Documenter:
    DocMeta,
    HTML,
    MathJax3,
    asset,
    deploydocs,
    makedocs

using PlutoSliderServer

PlutoSliderServer.export_notebook("examples/notebook.jl")
mv("examples/notebook.html", "docs/src/example.html", force=true)

sitename = "PlutoReport.jl"
# Using MathJax3 since Pluto uses that engine too.

mathengine = MathJax3()
prettyurls = get(ENV, "CI", nothing) == "true"
format = HTML(; mathengine, prettyurls)
modules = [PlutoSliderServer]
strict = true
checkdocs = :none
makedocs(; sitename, format, modules, strict, checkdocs)

deploydocs(;
    repo = "github.com/DhruvaSambrani/PlutoReport.jl.git"
)
