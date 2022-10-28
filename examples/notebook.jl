### A Pluto.jl notebook ###
# v0.19.13

#> [frontmatter]
#> title = "Example Notebook"
#> date = "2022-08-13"
#> description = "This is an example notebook"

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

# ╔═╡ a078aaab-55ff-4156-a487-0031c2b96520
@bind _pcon presentation_controls(aside = true)

# ╔═╡ 387df748-dfbb-4834-88e5-b067333acfca
apply_css_fixes()

# ╔═╡ aae13cfb-9002-4c69-b2d1-1675ecddcfba
presentation_ui(_pcon)

# ╔═╡ a0ccb87e-3911-4dba-9114-b4633b34c621
Title(
	"A Title", 
	"A catchy subtitle", 
	"Ashish Sharma", 
	"Institute of Smart People, India"
)

# ╔═╡ fc305d16-1458-4d75-ae13-440a923b67de
TableOfContents()

# ╔═╡ 5a392c22-b692-48ac-a0d2-5577c238f927
md"""
# This is a Heading 

These are some cool citations $(cite"fons_van_der_plas_2022_6916713::pluto.jl") and others

A **list** of things I like to eat
- pizza
- pasta
- dosa
- idly

Same, but _ordered_ - 
1. pizza
2. pasta
3. dosa
4. idly

## Subheading 1

Other markdown can also be used! Make [Links](https://github.com/fonsp/Pluto.jl), and 

![Images with alt-text](https://raw.githubusercontent.com/fonsp/Pluto.jl/dd0ead4caa2d29a3a2cfa1196d31e3114782d363/frontend/img/logo_white_contour.svg)

The $(cite"Or_s_2014::following") is a great introduction to Tensor Network States

"""

# ╔═╡ 28ef6ac5-4475-402f-a963-420e4b320f4b
@bind refs References()

# ╔═╡ 6f58d88f-1cbd-4190-a5fd-234ddb0b64b0
@bind abstractlink display_bibliography("bibliography.bib", refs)

# ╔═╡ c7db3e28-6767-49b1-ba34-4cfe8bd2d134
show_abstract(abstractlink)

# ╔═╡ Cell order:
# ╟─12c7ee0c-68d7-4c34-8956-e9f1bb0ce380
# ╠═a078aaab-55ff-4156-a487-0031c2b96520
# ╠═fc305d16-1458-4d75-ae13-440a923b67de
# ╠═387df748-dfbb-4834-88e5-b067333acfca
# ╟─aae13cfb-9002-4c69-b2d1-1675ecddcfba
# ╟─a0ccb87e-3911-4dba-9114-b4633b34c621
# ╟─5a392c22-b692-48ac-a0d2-5577c238f927
# ╟─28ef6ac5-4475-402f-a963-420e4b320f4b
# ╟─6f58d88f-1cbd-4190-a5fd-234ddb0b64b0
# ╟─c7db3e28-6767-49b1-ba34-4cfe8bd2d134
