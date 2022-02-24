# Documentation for PlutoReport.jl

## Installation

Right now, the package is not published to `General` repository. Hence, to use this package, you must use the following code in the top cell.

```julia
begin
    import Pkg
    Pkg.add(PackageSpec(url="https://github.com/DhruvaSambrani/PlutoReport.jl"))
    using PlutoReport
end
```

!!! warning Note
    This will disable Pluto's inbuild Pkg Manager.

## Example

You can find an example notebook [here]("./notebook.jl") with the associated bibtex file [here]("./bibliotest.bib"). Place both in the same folder and run the notebook via Pluto.

## API Documentation

```@autodocs
Modules = [PlutoReport]
Pages   = ["presentation.jl", "references.jl", "Title.jl"]
```
