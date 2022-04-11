### A Pluto.jl notebook ###
# v0.18.0

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

# ╔═╡ d22e842a-9405-11ec-0fb8-ebd2d0626ed1
begin
    import Pkg
    Pkg.activate("v1.7", shared=true)
	using PlutoReport
end

# ╔═╡ dd29548f-9e36-4bfb-99b8-a8678755fb45
@bind pvals presentation_controls(aside=true)

# ╔═╡ 628b3ce5-093f-48ea-b316-864c8b53b503
apply_css_fixes()

# ╔═╡ 64540cb1-8e86-4f05-b4e1-62013f2a6055
presentation_ui(pvals)

# ╔═╡ 3cfa2562-4ab9-4b5c-b87e-604bf6a1a68c
md"""
$(make_title("Test", "This is a Subtitle", "Dhruva Sambrani", "Department of Physics, IISER Mohali"))
"""

# ╔═╡ 7a3fbc03-4e36-4c25-9947-f823040e69b1
md"""
## Another slide
"""

# ╔═╡ e310d08f-f7cd-47fb-aef5-20f50a3520d8
md"""
### Heading
"""

# ╔═╡ c5ec3224-03c3-48fe-903a-105f976c4203
md"""This is a citation $(cite"test2") within some large piece of text

This is a list
- Paper 2 $(cite"test2")
- Paper 1 $(cite"test3")
"""

# ╔═╡ fe0d4fb1-81aa-4e0c-9ed6-ee0915deb65d
cite"test1"

# ╔═╡ e74f9cd4-4b15-4d0c-b6dd-a8787221e01a
cite"test3"

# ╔═╡ b7be0e28-df6c-415a-8b8b-5a780aedb464
cite"test1"

# ╔═╡ b6f3d7d1-ecf0-4b44-b23c-5b49b0513e09
@bind references References()

# ╔═╡ 145ce391-7089-45ea-8e67-54a898c8d0ae
@bind k display_bibliography("bibliotest.bib", references)

# ╔═╡ 4fd2d72d-50b8-441b-8b2e-fcc229e6e5d7
k

# ╔═╡ 8a84694c-2f71-4bca-ad6d-7473028868a8


# ╔═╡ c34a6072-0ab1-48b9-97a6-ef3639ab2a82
show_abstract(k, aside=true)

# ╔═╡ fc5d35c6-e59e-47e9-b43d-928ba0034764
PlutoReport.__version__

# ╔═╡ Cell order:
# ╠═d22e842a-9405-11ec-0fb8-ebd2d0626ed1
# ╠═dd29548f-9e36-4bfb-99b8-a8678755fb45
# ╠═628b3ce5-093f-48ea-b316-864c8b53b503
# ╠═64540cb1-8e86-4f05-b4e1-62013f2a6055
# ╠═3cfa2562-4ab9-4b5c-b87e-604bf6a1a68c
# ╟─7a3fbc03-4e36-4c25-9947-f823040e69b1
# ╠═e310d08f-f7cd-47fb-aef5-20f50a3520d8
# ╠═c5ec3224-03c3-48fe-903a-105f976c4203
# ╠═fe0d4fb1-81aa-4e0c-9ed6-ee0915deb65d
# ╠═e74f9cd4-4b15-4d0c-b6dd-a8787221e01a
# ╠═b7be0e28-df6c-415a-8b8b-5a780aedb464
# ╠═b6f3d7d1-ecf0-4b44-b23c-5b49b0513e09
# ╠═145ce391-7089-45ea-8e67-54a898c8d0ae
# ╠═4fd2d72d-50b8-441b-8b2e-fcc229e6e5d7
# ╠═8a84694c-2f71-4bca-ad6d-7473028868a8
# ╠═c34a6072-0ab1-48b9-97a6-ef3639ab2a82
# ╠═fc5d35c6-e59e-47e9-b43d-928ba0034764
