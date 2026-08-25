# openwashdata brand

One file defines the openwashdata visual identity: colors, typography,
and logos. Tools that understand brand.yml (Quarto, bslib, Shiny) read
it directly. Everything else can read the YAML and use the values.

## What is here

- `_brand.yml`: the brand definition, the single source of truth
- `logos/`: the full OWD logo library (variants 01 to 41 in SVG and PNG,
  a large variant, and `logos/communications/` with the QR-code logos).
  The variants `_brand.yml` designates: `OWD-logo-18.png` as the small
  icon and `OWD-logo-01` as the medium and large marks; adjust the
  `logo:` section when other variants should be the official picks.

## The palette in short

| Token           | Value     | Use                                     |
|-----------------|-----------|-----------------------------------------|
| owd-purple      | `#5b195b` | primary identity (navbar, accents)      |
| owd-purple-bg   | `#f5eef5` | very light background for slides, pages |
| owd-orange      | `#c14a09` | high-contrast emphasis and chart accent |
| owd-blue        | `#272bd1` | links                                   |
| ink, paper      | `#1e1e1e`, `#f4f4f4` | text and surface             |
| mint, peach, sand, rose | see file | highlights                      |

Typography is Atkinson Hyperlegible (Google Fonts) with Source Code Pro
for code.

## How to use it

Quarto website, document, or slide deck: copy `_brand.yml` and the
`logos/` folder into the project root. Quarto discovers the file
automatically; to be explicit, add `brand: _brand.yml` to `_quarto.yml`
or the document header. When a project layers its own SCSS on top, put
`brand` before the custom file in the theme list so the custom rules
keep the final word.

pkgdown or Shiny via bslib: `bslib::bs_theme(brand = "_brand.yml")`.

R charts outside brand-aware tools: read the file with
`yaml::read_yaml()` and take colors from `color$palette`.

## Updating

Change values in this repository first, then refresh the copies in
consuming repositories. The file is small enough to copy by hand; a
`washr::use_brand()` helper is planned to automate the copy for the
data package sites.

## Reference implementation

openwashdata/website carries the same values in `style/theme.scss` and
`styles.css` and is the visual reference. The values here were
extracted from the website theme on 2026-08-25; `owd-purple-bg` and
`owd-orange` are derived additions from the AGUASAN pitch deck work,
chosen for contrast on light backgrounds.
