### A Pluto.jl notebook ###
# v0.19.14

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
	# This section ...
	import Pkg
	Pkg.activate(joinpath(@__DIR__, ".."))
	# ... is not necessary
	using PlutoReport
end

# ╔═╡ c6f2eeab-234a-4f85-957d-efe683f43167
md"""
	First we install `PlutoReport` into the notebook. Normally, just `using PlutoReport` is enough.
"""

# ╔═╡ a22d0512-c9cf-454f-96d6-65c1c8c47b69
md"""
	Add some presentation controls, and `bind` it to a variable. Don't want it floating? Set `aside=false`. Check 'Presentation Mode' to switch to the presentation UI. New slides are started at `h1`, `h2` or `slidebreak`s. Note that these can be in between text also. Two buttons will appear at the bottom left of the page. Use these to navigate between slides. You can also use the ToC, or even just scroll, but this is not suggested.
	
	Click the presentation title to hide the control panel
"""

# ╔═╡ a078aaab-55ff-4156-a487-0031c2b96520
@bind _pcon presentation_controls()

# ╔═╡ bd9f0723-8ff1-4a1a-9cfe-4ee45caecfc9
md"""
	Add the usual Table of Contents
"""

# ╔═╡ fc305d16-1458-4d75-ae13-440a923b67de
TableOfContents()

# ╔═╡ dec5c338-5005-4db4-911b-012616eabcbb
md"""
	Apply some css fixes so that it looks like a report/presentation
"""

# ╔═╡ 387df748-dfbb-4834-88e5-b067333acfca
apply_css_fixes()

# ╔═╡ cfe70a7a-1642-48a0-b66f-349ccee2c571
md"""
	Display the presentation UI which reacts to the presentation controls. Note the clock at the bottom left of the page. This displays the time left in your talk/presentation. Max time and tick speed can be set in the 'Presentation Controls' panel
"""

# ╔═╡ aae13cfb-9002-4c69-b2d1-1675ecddcfba
presentation_ui(_pcon)

# ╔═╡ b6d930a1-575f-4927-aeb3-46eacd9a50c4
md"""
	Add a title
"""

# ╔═╡ a0ccb87e-3911-4dba-9114-b4633b34c621
Title(
	"A Title", 
	"A catchy subtitle", 
	"Ashish Sharma", 
	"Institute of Smart People, India"
)

# ╔═╡ dc6812d6-7dc2-459a-9ccf-495aac0942f0
Resource("https://raw.githubusercontent.com/fonsp/Pluto.jl/dd0ead4caa2d29a3a2cfa1196d31e3114782d363/frontend/img/logo_white_contour.svg", :width=>"25%")

# ╔═╡ ea35d808-db03-492a-8f36-32b0cf77419b
md"""
	Logos can be added as above
	Now write the content in markdown/html/julia/whatever Pluto can handle
"""

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

$(Resource("https://raw.githubusercontent.com/fonsp/Pluto.jl/dd0ead4caa2d29a3a2cfa1196d31e3114782d363/frontend/img/logo_white_contour.svg", :width=>"55%"))

The $(cite"Or_s_2014::following") is a great introduction to Tensor Network States.
"""

# ╔═╡ 972dbb43-7774-4ed9-8d2d-f62341d6cb3f
md"""
	Note above that images in between text are not centered. Cells with just an image are.
"""

# ╔═╡ 6fbce86e-65da-4d59-ad49-3a1d00a1af5f
Resource("https://raw.githubusercontent.com/fonsp/Pluto.jl/dd0ead4caa2d29a3a2cfa1196d31e3114782d363/frontend/img/logo_white_contour.svg", :width=>"55%")

# ╔═╡ 2f295bf7-5bef-4ed6-9014-93ed8fcf12fb
md"""
	Now lets add some references. `bind` a variable to the `References()` function. On changing the body of the report, click the Refresh references button in case that citation is not included
"""

# ╔═╡ 28ef6ac5-4475-402f-a963-420e4b320f4b
@bind refs References()

# ╔═╡ 831ff4e4-ab3f-4251-83ab-189c10360fd2
md"""
	Now let us display the references using `display_bibliography`, parametrized by a local file and the bound variable. 
	Support for inline definition of the bibliography will be added.
"""

# ╔═╡ 6f58d88f-1cbd-4190-a5fd-234ddb0b64b0
@bind abstractlink display_bibliography("bibliography.bib", refs)

# ╔═╡ 59902dd5-63e3-4c90-a70e-3023e8529eac
md"""
	It would be nice if we could see atleast the abstract of the references. `bind` a variable to `display_bibliography`, and let `show_abstract` react to that. Now, clicking on any of the citations' id will result in the abstract being shown in the abstract panel (possibly collapsed)
"""

# ╔═╡ c7db3e28-6767-49b1-ba34-4cfe8bd2d134
show_abstract(abstractlink)

# ╔═╡ Cell order:
# ╟─c6f2eeab-234a-4f85-957d-efe683f43167
# ╠═12c7ee0c-68d7-4c34-8956-e9f1bb0ce380
# ╟─a22d0512-c9cf-454f-96d6-65c1c8c47b69
# ╠═a078aaab-55ff-4156-a487-0031c2b96520
# ╟─bd9f0723-8ff1-4a1a-9cfe-4ee45caecfc9
# ╠═fc305d16-1458-4d75-ae13-440a923b67de
# ╟─dec5c338-5005-4db4-911b-012616eabcbb
# ╠═387df748-dfbb-4834-88e5-b067333acfca
# ╟─cfe70a7a-1642-48a0-b66f-349ccee2c571
# ╠═aae13cfb-9002-4c69-b2d1-1675ecddcfba
# ╟─b6d930a1-575f-4927-aeb3-46eacd9a50c4
# ╠═a0ccb87e-3911-4dba-9114-b4633b34c621
# ╠═dc6812d6-7dc2-459a-9ccf-495aac0942f0
# ╟─ea35d808-db03-492a-8f36-32b0cf77419b
# ╠═5a392c22-b692-48ac-a0d2-5577c238f927
# ╟─972dbb43-7774-4ed9-8d2d-f62341d6cb3f
# ╠═6fbce86e-65da-4d59-ad49-3a1d00a1af5f
# ╟─2f295bf7-5bef-4ed6-9014-93ed8fcf12fb
# ╠═28ef6ac5-4475-402f-a963-420e4b320f4b
# ╟─831ff4e4-ab3f-4251-83ab-189c10360fd2
# ╠═6f58d88f-1cbd-4190-a5fd-234ddb0b64b0
# ╟─59902dd5-63e3-4c90-a70e-3023e8529eac
# ╠═c7db3e28-6767-49b1-ba34-4cfe8bd2d134
