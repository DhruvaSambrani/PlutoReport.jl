# PlutoReport.jl

[![docs stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://dhruvasambrani.github.io/PlutoReport.jl)
[![DOI](https://zenodo.org/badge/463202023.svg)](https://zenodo.org/badge/latestdoi/463202023)

Make awesome reports and talk slides in [Pluto](https://github.com/fonsp/Pluto.jl)! 

# Why

Pluto is already an awesome platform to make interactive notebooks in julia. Along with the markdown and latex support, one can harness the interactivity of PlutoUI to make anything that they wish to make. This has lead to a rise in Pluto being used as an educational tool. With PlutoReport, we envision pluto notebooks being used for scientific publishing too. 

Whereas LaTeX has become the de facto standard for publishing, it is inherently a two step process, to first generate the data and plots, and then to insert these along with the content. Such a separation is naturally more time consuming for the writers. I believe that such a separation is not a necessity in the publishing worklow. Further, the seperation of data and content also shows up in the lack of codes being available for readers.

Another use of Pluto is in making presentations for talks. A common drawback of pdf slides in, say beamer, is the complexity of adding interactivity in the slides.

While Pluto already provides most of the things we need in terms of interactivity, and also the hidden `present()` feature, there are certain things like citations, arbitrary slide breaks, presentation controls etc which are missing. This package attempts to add these features without users having to write them out themselves.

The end goal is this: A single document, which is code, documentation, talk slides and a full fledged report which the reader can interact with on any device, with easy ways to export and publish static html, active notebooks, and pdfs, and with opt in features to display cited papers so the reader can quickly look at the reference without losing context, all while being easy to learn and write for the author of the paper, but nearly as powerful as LaTeX. Yeah, ambitious, but possible. CSS/JS, Julia, Pluto/UI with export features already make it halfway, this package does the rest.

# Features

1. A fancy title for your report - [Title](@ref)
2. A floating control panel to set the amount of time of your talk, and toggle presentation mode - [presentation_controls](@ref). Control slide movement with the mouse, scroll or `PlutoUI.TableOfContents`
3. A nice clock to show you how much time you have left - [presentation_ui](@ref)
4. Add inline citations with `@cite`. You can even style them according to your wish, following the norms of your referencing style via [`style_citations`](@ref)
5. Generates a References list from a bibtex file and actually cited works automatically. See the docs for [`References`](@ref).
6. Multiple aesthetic fixes for the report to look professional. `apply_css_fixes`
7.  A cute little laser pointer in presentation mode

## Experimental and Future Features

- Display abstracts from the references on a single click
- Share DOI of a refernce to Zotero, Mendeley etc. Maybe even Mastodon just for fun
- Sections that are hidden in presentations
- Speaker Notes ??
- Making papers accessible to ScreenReaders and such.
- Integration with DrWatson.jl

# Installation

In any cell of your Pluto notebook,

```julia
using PlutoReport
```

And you are done!!


# Examples of reports and talks

You can find example notebooks [here](https://github.com/DhruvaSambrani/PlutoReport.jl/tree/main/examples) with the associated bibtex files. Make sure you have the notebook and bibtex files in the same folder!

If you just want to see how it looks like, look at the [hosted example page](./example.html). This however will not have all the fancy features that makes this package useful.

I've also made a repo for more examples of PlutoReport - [PlutoReport-Examples](https://github.com/dhruvasambrani/PlutoReport-Examples), [website](/PlutoReport-Examples)

**Send a PR to feature your works in PlutoReports.jl!!**

