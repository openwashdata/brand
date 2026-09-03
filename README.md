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

Quarto documents (PDF through Typst, and Word): the openwashdata
extension [quarto-owd](https://github.com/openwashdata/quarto-owd)
provides the formats `owd-typst` and `owd-docx`. Bring the brand in with
`quarto use brand openwashdata/brand` and the extension with
`quarto add openwashdata/quarto-owd`.

R charts outside brand-aware tools: read the file with
`yaml::read_yaml()` and take colors from `color$palette`.

## Updating

Change values in this repository first, then refresh the copies in
consuming repositories:

- R data packages: `washr::use_brand()` (washr 1.1.0 and later) copies
  `_brand.yml` and the referenced logos into the package and wires the
  pkgdown site. Run it again to refresh.
- Quarto projects: `quarto use brand openwashdata/brand` (Quarto 1.9 and
  later) mirrors the brand into `_brand/`. Run it again to refresh.
- quarto-owd regenerates its Word reference document from the refreshed
  brand; see its README.

## License

The brand definition (`_brand.yml`: colors, typography, and the logo
references) is licensed under [CC BY 4.0](LICENSE). Copy and adapt it
with attribution to openwashdata.

The logos identify openwashdata. CC BY 4.0 does not license trademark
rights (section 2(b)(2)), so the logo files are here so that openwashdata
material renders with the correct marks. Any other use of the logos
needs permission from openwashdata.

## Reference implementation

openwashdata/website carries the same values in `style/theme.scss` and
`styles.css` and is the visual reference. The values here were
extracted from the website theme on 2026-08-25; `owd-purple-bg` and
`owd-orange` are derived additions from the AGUASAN pitch deck work,
chosen for contrast on light backgrounds.
