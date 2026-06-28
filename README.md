# Argyrios Tsagkalidis — CV

A maintainable, source-controlled CV written in [Typst](https://typst.app/).

## Files

- `argyrios-tsagkalidis-cv.typ` — the CV source (edit this)
- `argyrios.tsagkalidis.jpg` — profile photo used by the CV
- `argyrios-tsagkalidis-cv.pdf` — the compiled output

## Editing

All content lives in the clearly-marked **PAGE CONTENT** section near the bottom
of the `.typ` file. Layout, colours and spacing are defined once at the top
(`accent`, `muted`, `sidebarbg`, …) and reused — change `accent` to recolour the
whole CV.

## Building

Install Typst (<https://github.com/typst/typst>), then:

```sh
typst compile argyrios-tsagkalidis-cv.typ      # -> argyrios-tsagkalidis-cv.pdf
typst watch   argyrios-tsagkalidis-cv.typ      # live rebuild while editing
```
