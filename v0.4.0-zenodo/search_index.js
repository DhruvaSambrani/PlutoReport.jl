var documenterSearchIndex = {"docs":
[{"location":"#Documentation-for-PlutoReport.jl","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"","category":"section"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"CurrentModule = PlutoReport","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"Make awesome reports and talk slides in Pluto! ","category":"page"},{"location":"#Why","page":"Documentation for PlutoReport.jl","title":"Why","text":"","category":"section"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"Pluto is already an awesome platform to make interactive notebooks in julia. Along with the markdown and latex support, one can harness the interactivity of PlutoUI to make anything that they wish to make. This has lead to a rise in Pluto being used as an educational tool. With PlutoReport, we envision pluto notebooks being used for scientific publishing too. ","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"Whereas LaTeX has become the de facto standard for publishing, it is inherently a two step process, to first generate the data and plots, and then to insert these along with the content. Such a separation is naturally more time consuming for the writers. I believe that such a separation is not a necessity in the publishing worklow. Further, the seperation of data and content also shows up in the lack of codes being available for readers.","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"Another use of Pluto is in making presentations for talks. A common drawback of pdf slides in, say beamer, is the complexity of adding interactivity in the slides.","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"While Pluto already provides most of the things we need in terms of interactivity, and also the hidden present() feature, there are certain things like citations, arbitrary slide breaks, presentation controls etc which are missing. This package attempts to add these features without users having to write them out themselves.","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"The end goal is this: A single document, which is code, documentation, talk slides and a full fledged report which the reader can interact with on any device, with easy ways to export and publish static html, active notebooks, and pdfs, and with opt in features to display cited papers so the reader can quickly look at the reference without losing context, all while being easy to learn and write for the author of the paper, but nearly as powerful as LaTeX. Yeah, ambitious, but possible. CSS/JS, Julia, Pluto/UI with export features already make it halfway, this package does the rest.","category":"page"},{"location":"#Features","page":"Documentation for PlutoReport.jl","title":"Features","text":"","category":"section"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"A fancy title for your report - Title\nA floating control panel to set the amount of time of your talk, and toggle presentation mode - presentation_controls. Control slide movement with the mouse, scroll or PlutoUI.TableOfContents\nA nice clock to show you how much time you have left - presentation_ui\nAdd inline citations with @cite. You can even style them according to your wish, following the norms of your referencing style via style_citations\nGenerates a References list from a bibtex file and actually cited works automatically. See the docs for References.\nMultiple aesthetic fixes for the report to look professional. apply_css_fixes\nA cute little laser pointer in presentation mode","category":"page"},{"location":"#Experimental-and-Future-Features","page":"Documentation for PlutoReport.jl","title":"Experimental and Future Features","text":"","category":"section"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"Display abstracts from the references on a single click\nShare DOI of a refernce to Zotero, Mendeley etc. Maybe even Mastodon just for fun\nSections that are hidden in presentations\nSpeaker Notes ??\nMaking papers accessible to ScreenReaders and such.\nIntegration with DrWatson.jl","category":"page"},{"location":"#Installation","page":"Documentation for PlutoReport.jl","title":"Installation","text":"","category":"section"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"In any cell of your Pluto notebook,","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"using PlutoReport","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"And you are done!!","category":"page"},{"location":"#Examples-of-reports-and-talks","page":"Documentation for PlutoReport.jl","title":"Examples of reports and talks","text":"","category":"section"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"A fifteen minute presentation about Quantum Walks\nA report on Quantum Walks","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"You can find example notebooks here with the associated bibtex files. Make sure you have the notebook and bibtex files in the same folder!","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"If you just want to see how it looks like, look at the hosted example page. This however will not have all the fancy features that makes this package useful.","category":"page"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"Send a PR to feature your works in PlutoReports.jl!!","category":"page"},{"location":"#API-Documentation","page":"Documentation for PlutoReport.jl","title":"API Documentation","text":"","category":"section"},{"location":"","page":"Documentation for PlutoReport.jl","title":"Documentation for PlutoReport.jl","text":"Modules = [PlutoReport]\nPages   = [\"presentation.jl\", \"references.jl\", \"Title.jl\", \"abstracts.jl\", \"PlutoReport.jl\"]","category":"page"},{"location":"#PlutoReport.PresentationControls","page":"Documentation for PlutoReport.jl","title":"PlutoReport.PresentationControls","text":"PresentationControls\n\nalias for NamedTuple{(:presentation_mode, :max_time, :clock),Tuple{Bool,Int64,Int64}}, which is used in presentation_ui\n\nSee also presentation_ui, presentation_controls\n\n\n\n\n\n","category":"type"},{"location":"#PlutoReport.presentation-Tuple{NamedTuple{(:presentation_mode, :max_time, :clock), Tuple{Bool, Int64, Int64}}}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.presentation","text":"presentation(pvals::PresentationControls) :: HypertextLiteral.Result\n\nReturns htl string which turns UI into presentation mode. Must be the last statement in a cell.\n\nSee also presentation_ui, presentation_controls, PresentationControls\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.presentation_controls-Tuple{}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.presentation_controls","text":"presentation_controls(aside::Bool = true) :: PlutoUI.CombineNotebook.CombinedBonds\n\nReturns a PlutoUI widget which returns a PresentationControls, and acts as a control panel for presentation_ui. Must be bound to a variable using PlutoUI.bind.\n\nArguments\n\naside::Bool: Whether control panel is floating\n\nSee also presentation_ui, PresentationControls\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.presentation_ui-Tuple{NamedTuple{(:presentation_mode, :max_time, :clock), Tuple{Bool, Int64, Int64}}}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.presentation_ui","text":"presentation_ui(pvals::PresentationControls) :: HypertextLiteral.Result\n\nReturns htl string with presentation and timeleft Must be the last statement in a cell.\n\nSee also presentation_controls, PresentationControls\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.timeleft-Tuple{NamedTuple{(:presentation_mode, :max_time, :clock), Tuple{Bool, Int64, Int64}}}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.timeleft","text":"timeleft(pvals::PresentationControls) :: HypertextLiteral.Result\n\nReturns  string which displays the time left in talk. Must be the last statement in a cell.\n\nSee also presentation_ui, presentation_controls, PresentationControls\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.CiteCSS","page":"Documentation for PlutoReport.jl","title":"PlutoReport.CiteCSS","text":"CiteCSS\n\nAn Enum with values Superscript and Highlighted to control styling of inline citations.\n\nSee also style_citations\n\n\n\n\n\n","category":"type"},{"location":"#PlutoReport.CiteStyle","page":"Documentation for PlutoReport.jl","title":"PlutoReport.CiteStyle","text":"CiteStyle\n\nAn Enum with values ByNumber and ById to control content of inline citations.\n\nSee also style_citations\n\n\n\n\n\n","category":"type"},{"location":"#PlutoReport.References-Tuple{}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.References","text":"References() :: HypertextLiteral.Result\n\nReturns a PlutoUI widget which updates a Bond with the list of all citations (with repetition) in the report. Use with display_bibliography, with this bound to a variable using @bind\n\nSee also display_bibliography, @cite_str\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.display_bibentry-Tuple{BibInternal.Entry}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.display_bibentry","text":"display_bibentry(entry::Bibliography.BibInternal.Entry)::HypertextLiteral.Result\n\nReturns a display for a bibentry.\n\nSee also display_bibliography\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.display_bibliography-Tuple{String, Any}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.display_bibliography","text":"display_bibliography(bibtexpath::String, citations) ::HypertextLiteral.Result\n\nReturns all cited references from a reference BibTex file at bibtexpath and citations. It can also be bound to a variable to be used with show_abstract\n\nSee also @cite_str, References\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.nice_bib-Tuple{String}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.nice_bib","text":"nice_title(raw_title::String)::String\n\nRemoves any curly braces in titles\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.style_citations-Tuple{Any, String}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.style_citations","text":"style_citations(citations, bibtexpath::String; css::Union{CiteCSS, HypertextLiteral.Result}=Superscript, content::Union{CiteStyle, Function}=By_Id) :: HypertextLiteral.Result\n\nStyle inline citations. citations is a Bond to References, bibtexpath is path to the bibtex file. content can either be a CiteStyle or a Function, that is of the form  (citeid::String, bibtexpath::String)::String, whose output will replace the id in the citations\n\nSee also CiteStyle\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.@cite_str-Tuple{Any}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.@cite_str","text":"@cite_str -> HypertextLiteral.Result\n\nCreate an inline citation from string\n\nExample\n\ncite\"test1\"\n\nThis creates a citation for bibtex entry with id as test1\n\nSee also display_bibliography, References\n\n\n\n\n\n","category":"macro"},{"location":"#PlutoReport.Title-NTuple{4, String}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.Title","text":"Title(title::String, subtitle::String, author::String, affiliation::String) :: HypertextLiteral.Result\n\nMakes the title for the report. Must be the last statement in a cell.\n\nSee also make_title\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.make_title","page":"Documentation for PlutoReport.jl","title":"PlutoReport.make_title","text":"make_title is an alias for Title\n\n\n\n\n\n","category":"function"},{"location":"#PlutoReport.get_abstract-Tuple{Any}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.get_abstract","text":"get_abstract(link)\n\nTry all possible APIs and methods to get reference information\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.search_semantic_scholar-Tuple{Any}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.search_semantic_scholar","text":"search_semantic_scholar(doi)\n\nQuery the Semantic Scholar API to get abstract information\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.show_abstract-Tuple{Any}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.show_abstract","text":"show_abstract(link; aside=true)\n\nShow the abstract of the link clicked in the References section. If unable to query the information, just show the reference link\n\nSee also display_bibliography, @cite_str\n\n\n\n\n\n","category":"method"},{"location":"#PlutoReport.PlutoReport","page":"Documentation for PlutoReport.jl","title":"PlutoReport.PlutoReport","text":"PlutoReport\n\nA Package to make reports and talks in Pluto.jl.\n\nUsage\n\nusing PlutoReport\n\n@bind pval presentation_controls(aside=true)\n\npresentation_ui(pval)\n\napply_css_fixes()\n\nTitle(\"A test title\", \"some subtitle\", \"Some person\", \"Some institution\")\n\nmd\"## A beautiful Report\"\n\n@bind references References()\n\ndisplay_bibliography(\"./bibliography.bibtex\", references)\n\n\n\n\n\n","category":"module"},{"location":"#PlutoReport.centerslidebreak","page":"Documentation for PlutoReport.jl","title":"PlutoReport.centerslidebreak","text":"centerslidebreak\n\nStart a new slide here, slide content is centered.\n\nSee also slidebreak and topslidebreak\n\n\n\n\n\n","category":"constant"},{"location":"#PlutoReport.seperator","page":"Documentation for PlutoReport.jl","title":"PlutoReport.seperator","text":"seperator\n\nVisual seperator for any location\n\n\n\n\n\n","category":"constant"},{"location":"#PlutoReport.slidebreak","page":"Documentation for PlutoReport.jl","title":"PlutoReport.slidebreak","text":"slidebreak\n\nStart a new slide here, slide content is centered.\n\nSee also centerslidebreak and topslidebreak\n\n\n\n\n\n","category":"constant"},{"location":"#PlutoReport.topslidebreak","page":"Documentation for PlutoReport.jl","title":"PlutoReport.topslidebreak","text":"topslidebreak\n\nStart a new slide here, slide content is aligned top.\n\nSee also slidebreak and centerslidebreak\n\n\n\n\n\n","category":"constant"},{"location":"#PlutoReport.apply_css_fixes-Tuple{}","page":"Documentation for PlutoReport.jl","title":"PlutoReport.apply_css_fixes","text":"apply_css_fixes(;helpbox=true, logs=true, footer=true, print=true)\n\nApply fixes to Pluto's UI to make it better for reports and presentations. Set any of the parameters to false if you do not want to apply those. Must be the last statement in a cell.\n\n\n\n\n\n","category":"method"}]
}