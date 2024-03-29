### A Pluto.jl notebook ###
# v0.19.16

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
using PlutoReport

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

The following $(cite"Or_s_2014") is a great introduction to Tensor Network States.
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

# ╔═╡ 14e81c39-c046-43a3-859d-39c1b5fa17d5
md"""
	We can also style the citations according to our choice. See the documentation
"""

# ╔═╡ 393f352d-cf58-4102-ac7d-c8c7d74f67bb
style_citations(refs, "bibliography.bib", content=By_Number, css=Superscript)

# ╔═╡ 831ff4e4-ab3f-4251-83ab-189c10360fd2
md"""
	Now let us display the references using `display_bibliography`, parametrized by a local file and the bound variable. 
	Support for inline definition of the bibliography will be added.
"""

# ╔═╡ 6f58d88f-1cbd-4190-a5fd-234ddb0b64b0
@bind abstractlink display_bibliography("bibliography.bib", refs)

# ╔═╡ 59902dd5-63e3-4c90-a70e-3023e8529eac
md"""
	It would be nice if we could see atleast the abstract of the references. `bind` a variable to `display_bibliography`, and let `show_abstract` react to that. Now, clicking on any of the citations' id will result in the abstract being shown in the abstract panel (possibly collapsed). This is a feature in alpha stage.
"""

# ╔═╡ c7db3e28-6767-49b1-ba34-4cfe8bd2d134
show_abstract(abstractlink)

# ╔═╡ 31a4e944-c047-4268-87b4-1b604ae50f1f
md"""
	Finally you can always just hack your way through and override any css/js to make your report look exactly like you want it.
"""

# ╔═╡ 9fdf69e0-0957-4c76-9465-7728040e01d7
html"""
<style>
.cite {
	line-height: 0;
}
</style>
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoReport = "ab5eb977-4f23-42a0-954d-2743fb6218c4"

[compat]
PlutoReport = "~0.3.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "804e38e0a54be4d1cdd82936cfb95482108590bc"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BibInternal]]
git-tree-sha1 = "3a760b38ba8da19e64d29244f06104823ff26f25"
uuid = "2027ae74-3657-4b95-ae00-e2f7d55c3e64"
version = "0.3.4"

[[deps.BibParser]]
deps = ["BibInternal", "DataStructures", "Dates", "JSONSchema", "YAML"]
git-tree-sha1 = "f24884311dceb5f8eafe11809b6f1d867b489a46"
uuid = "13533e5b-e1c2-4e57-8cef-cac5e52f6474"
version = "0.2.1"

[[deps.Bibliography]]
deps = ["BibInternal", "BibParser", "DataStructures", "Dates", "FileIO", "YAML"]
git-tree-sha1 = "b506db2482a8e110622ddf1fd0f78bce381af032"
uuid = "f1be7e48-bf82-45af-a471-ae754a193061"
version = "0.2.19"

[[deps.BitFlags]]
git-tree-sha1 = "43b1a4a8f797c1cddadf60499a8a077d4af2cd2d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.7"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "00a2cccc7f098ff3b66806862d275ca3db9e6e5a"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.5.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "7be5f99f7d15578798f338f5433b6c432ea8037b"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.16.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "Dates", "IniFile", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "e1acc37ed078d99a714ed8376446f92a5535ca65"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.5.5"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JSON3]]
deps = ["Dates", "Mmap", "Parsers", "SnoopPrecompile", "StructTypes", "UUIDs"]
git-tree-sha1 = "84b10656a41ef564c39d2d477d7236966d2b5683"
uuid = "0f8b85d8-7281-11e9-16c2-39a750bddbf1"
version = "1.12.0"

[[deps.JSONSchema]]
deps = ["HTTP", "JSON", "URIs"]
git-tree-sha1 = "8d928db71efdc942f10e751564e6bbea1e600dfe"
uuid = "7d188eb4-7ad8-530c-ae41-71a32a6d4692"
version = "1.0.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "cedb76b37bc5a6c702ade66be44f831fa23c681e"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.0.0"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "Random", "Sockets"]
git-tree-sha1 = "03a9b9718f5682ecb107ac9f7308991db4ce395b"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.7"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "df6830e37943c7aaa10023471ca47fb3065cc3c4"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.3.2"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6e9dba33f9f2c44e08a020b0caf6903be540004"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.19+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "b64719e8b4504983c7fca6cc9db3ebc8acc2a4d6"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoReport]]
deps = ["Bibliography", "Downloads", "HTTP", "HypertextLiteral", "JSON3", "PlutoUI", "Reexport"]
git-tree-sha1 = "dfe9fed6bfd1257b94fd9c6fabe90305dac12a36"
uuid = "ab5eb977-4f23-42a0-954d-2743fb6218c4"
version = "0.3.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "efc140104e6d0ae3e7e30d56c98c4a927154d684"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.48"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "874e8867b33a00e784c8a7e4b60afe9e037b74e1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.1.0"

[[deps.SnoopPrecompile]]
git-tree-sha1 = "f604441450a3c0569830946e5b33b78c928e1a85"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.1"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StringEncodings]]
deps = ["Libiconv_jll"]
git-tree-sha1 = "50ccd5ddb00d19392577902f0079267a72c5ab04"
uuid = "69024149-9ee7-55f6-a4c4-859efe599b68"
version = "0.3.5"

[[deps.StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "ca4bccb03acf9faaf4137a9abc1881ed1841aa70"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.10.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "8a75929dcd3c38611db2f8d08546decb514fcadf"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.9"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "ac00576f90d8a259f2c9d823e91d1de3fd44d348"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.YAML]]
deps = ["Base64", "Dates", "Printf", "StringEncodings"]
git-tree-sha1 = "dbc7f1c0012a69486af79c8bcdb31be820670ba2"
uuid = "ddb6d928-2868-570f-bddf-ab3f9cf99eb6"
version = "0.4.8"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

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
# ╟─a0ccb87e-3911-4dba-9114-b4633b34c621
# ╠═dc6812d6-7dc2-459a-9ccf-495aac0942f0
# ╟─ea35d808-db03-492a-8f36-32b0cf77419b
# ╠═5a392c22-b692-48ac-a0d2-5577c238f927
# ╟─972dbb43-7774-4ed9-8d2d-f62341d6cb3f
# ╠═6fbce86e-65da-4d59-ad49-3a1d00a1af5f
# ╟─2f295bf7-5bef-4ed6-9014-93ed8fcf12fb
# ╠═28ef6ac5-4475-402f-a963-420e4b320f4b
# ╟─14e81c39-c046-43a3-859d-39c1b5fa17d5
# ╠═393f352d-cf58-4102-ac7d-c8c7d74f67bb
# ╟─831ff4e4-ab3f-4251-83ab-189c10360fd2
# ╠═6f58d88f-1cbd-4190-a5fd-234ddb0b64b0
# ╟─59902dd5-63e3-4c90-a70e-3023e8529eac
# ╠═c7db3e28-6767-49b1-ba34-4cfe8bd2d134
# ╟─31a4e944-c047-4268-87b4-1b604ae50f1f
# ╟─9fdf69e0-0957-4c76-9465-7728040e01d7
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
