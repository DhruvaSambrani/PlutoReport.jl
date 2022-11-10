push!(LOAD_PATH, "../src/")

using Documenter
using PlutoReport

makedocs(
    sitename = "PlutoReport",
    format = Documenter.HTML(),
    modules = [PlutoReport]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/DhruvaSambrani/PlutoReport.jl.git"
)
