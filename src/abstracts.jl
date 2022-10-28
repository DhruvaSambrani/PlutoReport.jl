"""
    search_semantic_scholar(doi)

Query the Semantic Scholar API to get abstract information
"""
function search_semantic_scholar(link)
    try
        dlp = Downloads.download("https://api.semanticscholar.org/graph/v1/reference/DOI:$(link)?fields=title,abstract,tldr")
        f = JSON3.read(read(dlp))
        println(f)
        if !isnothing(f.abstract)
            return f.title, f.abstract
        end
        return f.title, f.tldr.text, "Semantic Scholar:tldr"
    catch e
        println("Looking for DOI $(link) errored: ")
        println(e)
        return nothing
    end
end


"""
    get_abstract(link)

Try all possible APIs and methods to get reference information
"""
function get_abstract(link)
    ss = search_semantic_scholar(link)
    isnothing(ss) || return (ss..., "Semantic Scholar")
    return nothing
end

"""
    show_abstract(link; aside=true)

Show the abstract of the link clicked in the [References](@ref) section. If unable to query the information, just show the reference link

See also [`display_bibliography`](@ref), [`@cite_str`](@ref)
"""
function show_abstract(link; aside = true)
    if !(link isa String)
        text = @htl "No citation link clicked"
    else
        resp = get_abstract(first(split(link, "::")))
        if isnothing(resp)
            text = @htl """<iframe src="$(last(split(link, "::")))"></iframe>"""
        else
            text = @htl "<h5>$(resp[1])</h5><p>$(resp[2])</p><p>Provided by: <b>$(resp[3])</b></p>"
        end
    end
    @htl """
    <style>
    .aside-abstract {
    	position: fixed;
    	top: 60px;
    	left: 10px;
    	max-width: 275px;
    	max-height: 400px;
    }
    #cite-article-container {
    	background-color: #484848;
    	padding: 12px;
    	border-radius: 4px;
    	z-index: 10000000;
    	display: flex;
    	flex-direction: column;
    }
    #cite-article {
    	overflow: auto;
    }
    .descriptor{
    	font-weight: bolder;
    }
    .article-hide {
    	display: none;
    }
    #cite-article-container h5 {
    	cursor: pointer;
    	color: #669966;
    }
    </style>
    <div id="cite-article-container" class="$(aside ? "aside-abstract" : "")">
    	<h5 onclick="document.getElementById('cite-article').classList.toggle('article-hide')">Abstract</h5>
    	<div id="cite-article" class="article-hide">$(text)</div>
    </div>
    """
end
