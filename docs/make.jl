cd(@__DIR__)
push!(LOAD_PATH, "../src/")

using Documenter
using PlutoReport

if get(ENV, "BUILD_NOTEBOOK", "1") == "1"
    using PlutoSliderServer
    PlutoSliderServer.export_notebook("../examples/notebook.jl")
    mv("../examples/notebook.html", "../docs/src/example.html", force=true)
end

makedocs(sitename="PlutoReport.jl", modules=[PlutoReport])

deploydocs(
    repo = "github.com/DhruvaSambrani/PlutoReport.jl.git"
)
