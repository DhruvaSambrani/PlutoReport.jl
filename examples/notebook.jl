### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 12c7ee0c-68d7-4c34-8956-e9f1bb0ce380
begin
	import Pkg
	Pkg.activate("..")
	using PlutoReport
end

# ╔═╡ a0ccb87e-3911-4dba-9114-b4633b34c621
Title("A Title", "A catchy subtitle", "Ashish Sharma", "Institute of Smart People, India")

# ╔═╡ a078aaab-55ff-4156-a487-0031c2b96520
@bind _pcon presentation_controls(aside=false)

# ╔═╡ aae13cfb-9002-4c69-b2d1-1675ecddcfba
presentation_ui(_pcon)

# ╔═╡ Cell order:
# ╟─12c7ee0c-68d7-4c34-8956-e9f1bb0ce380
# ╟─a0ccb87e-3911-4dba-9114-b4633b34c621
# ╟─a078aaab-55ff-4156-a487-0031c2b96520
# ╟─aae13cfb-9002-4c69-b2d1-1675ecddcfba
