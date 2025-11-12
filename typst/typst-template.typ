

#let article(
  title: none,
  title-font: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1in, y: 1in),
  paper: "us-letter",
  page_numbering: "1",
  lang: "en",
  region: "US",
  font: "Libertinus Serif",
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  show link: underline
  show link: set text(rgb("#861F41"))
  show raw: set text(font: "DejaVu Sans Mono")
  show quote: set pad(x: 2em)
  show quote: set block(spacing: 1em)

  set list(marker: ([•], [--]))
  set page(
    paper: paper,
    margin: margin,
    numbering: page_numbering, // to remove page numbers numbering: none, to use Arabic numerals "1",
  )
  set par(justify: false)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)

  if title != none {
    align(center)[#block(below: 2em)[
      // = #title
      #if title-font != none {
        text(weight: "bold", size: 2em, font: title-font, rgb("#861F41"))[#title]
      } else {
        text(weight: "bold", size: 2em, rgb("#861F41"))[#title]
      }
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 0em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)
