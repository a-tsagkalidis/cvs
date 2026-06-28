# CVs

A collection of maintainable, source-controlled CVs written in [Typst](https://typst.app/).

Each CV is a single `.typ` source file plus its photo, and is committed alongside
its compiled `.pdf`. Layout, colours and spacing are defined once at the top of
each file and reused, so editing is just a matter of changing the text in the
clearly-marked **PAGE CONTENT** section.

## Contents

| Person | Source | Photo | Output |
| --- | --- | --- | --- |
| Argyrios Tsagkalidis | `argyrios-tsagkalidis-cv.typ` | `argyrios.tsagkalidis.jpg` | `argyrios-tsagkalidis-cv.pdf` |
| Georgia Mavrantza | `georgia-mavrantza-cv.typ` | `georgia.mavrantza.jpg` | `georgia-mavrantza-cv.pdf` |

## Editing

All content lives in the **PAGE CONTENT** section near the bottom of each `.typ`
file. The theme is defined once at the top (`accent`, `muted`, `sidebarbg`, …) —
change `accent` to recolour an entire CV.

## Building

Install Typst (<https://github.com/typst/typst>), then compile the CV you want:

```sh
typst compile argyrios-tsagkalidis-cv.typ      # -> argyrios-tsagkalidis-cv.pdf
typst compile georgia-mavrantza-cv.typ         # -> georgia-mavrantza-cv.pdf

typst watch   argyrios-tsagkalidis-cv.typ      # live rebuild while editing
```
