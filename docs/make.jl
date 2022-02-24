push!(LOAD_PATH, "../src/")

using Documenter, PlutoReport

makedocs(sitename = "PlutoReport.jl Documentation")

deploydocs(
    repo = "github.com/DhruvaSambrani/PlutoReport.jl.git",
)
