push!(LOAD_PATH, "../src/")

using Documenter:
    DocMeta,
    HTML,
    MathJax3,
    asset,
    deploydocs,
    makedocs
using PlutoStaticHTML

const NOTEBOOK_DIR = joinpath(@__DIR__, "..", "examples")

"""
    build()
Run all Pluto notebooks (".jl" files) in `NOTEBOOK_DIR`.
"""
function build()
    println("Building notebooks in $NOTEBOOK_DIR")
    oopts = OutputOptions(; append_build_context=true)
    output_format = documenter_output
    bopts = BuildOptions(NOTEBOOK_DIR; output_format)
    build_notebooks(bopts, oopts)
    return nothing
end

# Build the notebooks; defaults to true.
if get(ENV, "BUILD_DOCS_NOTEBOOKS", "true") == "true"
    build()
end

sitename = "PlutoReport.jl"
pages = [
    "PlutoReport" => "index.md",
    "Example Notebook" => "notebooks/example.md"
]

# Using MathJax3 since Pluto uses that engine too.
mathengine = MathJax3()
prettyurls = get(ENV, "CI", nothing) == "true"
format = HTML(; mathengine, prettyurls)
modules = [PlutoStaticHTML]
strict = true
checkdocs = :none
makedocs(; sitename, pages, format, modules, strict, checkdocs)

deploydocs(;
    repo = "github.com/DhruvaSambrani/PlutoReport.jl.git"
)
