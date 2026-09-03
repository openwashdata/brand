# openwashdata brand

One file defines the openwashdata visual identity: colours, typography,
and logos. Tools that understand brand.yml (Quarto, bslib, Shiny, the
brand.yml R package) read it directly. Everything else can read the YAML
and use the values.

The guide at <https://openwashdata.github.io/brand/> renders from these
files and shows the palette with its contrast table, the roles, the
logos and their rules, dark mode, themed charts and tables, and the
shared assets.

## What is here

- `_brand.yml`: the brand definition, the single source of truth
- `_brand-dark.yml`: the same brand for dark backgrounds (same palette
  and logos, dark values for the roles); Quarto websites toggle between
  the two files
- `logos/`: the logo library, variants 01 to 41 as SVG and PNG, a large
  export of variant 20, and `logos/communications/` with the QR code
  logos. `_brand.yml` designates OWD-logo-18 (small), OWD-logo-01
  (medium and large) and their white counterparts OWD-logo-16 and
  OWD-logo-05 for dark backgrounds
- `assets/`: avatar and social preview image, generated from the logos
  with Typst (`assets/*.typ`)
- `index.qmd` and `_quarto.yml`: the guide, published from `docs/`

## The palette in short

| Token | Value | Role |
|---|---|---|
| owd-purple | `#5b195b` | primary: navbar, headings, buttons |
| owd-purple-light, owd-purple-dark, owd-purple-dim, owd-purple-bg | see file | shades: dark mode primary, dark background, dark wells, light tint for code and pages |
| owd-orange | `#b04208` | warning, emphasis, chart accent |
| owd-green | `#257a5a` | success |
| owd-red | `#a4262c` | danger |
| owd-blue, owd-blue-light | `#272bd1`, `#9fb6ff` | info and links, light and dark mode |
| owd-grey, owd-grey-light | `#5c5c5c`, `#b5b5b5` | secondary: muted text |
| ink, paper | `#1e1e1e`, `#f4f4f4` | text and surface |
| mint, peach, sand, rose | see file | highlight backgrounds only, with ink text |

Every accent reaches 4.5:1 as text on paper and carries white text; the
guide computes the table. Typography is Atkinson Hyperlegible Next
(Google Fonts) with Source Code Pro for code.

## How to use it

- **Quarto** website, document or slide deck:
  `quarto use brand openwashdata/brand` (Quarto 1.9 and later) mirrors
  the brand into `_brand/`. Or copy `_brand.yml` and `logos/` into the
  project root; Quarto discovers the file. When a project layers its own
  SCSS on top, put `brand` before the custom file in the theme list.
  For a light and dark website add `_brand-dark.yml` and set
  `brand: {light: _brand.yml, dark: _brand-dark.yml}`.
- **Branded PDF and Word documents:** the
  [quarto-owd](https://github.com/openwashdata/quarto-owd) extension,
  formats `owd-typst` and `owd-docx`.
- **R data packages:** `washr::use_brand()` (washr 1.1.0 and later)
  copies the brand into the package and wires the pkgdown site.
- **Shiny and other bslib apps:** `bslib::bs_theme(brand = "_brand.yml")`.
- **Charts and tables in R:** `brand.yml::theme_brand_ggplot2()`,
  `theme_brand_gt()`, `theme_brand_flextable()`, `theme_brand_plotly()`
  and `theme_brand_thematic()` read the file from the project. Palette
  names carry underscores in R (`brand$color$palette$owd_purple`).
- **Everything else:** read the YAML with `yaml::read_yaml()` and take
  colours from `color$palette`.

## Updating

Change values in this repository first, then refresh the copies in
consuming repositories:

- R data packages: `washr::use_brand()`, or pin a release with
  `washr::use_brand(ref = "v1.0.0")`.
- Quarto projects: `quarto use brand openwashdata/brand` again.
- quarto-owd regenerates its Word reference document from the refreshed
  brand; see its README.

Releases are tagged; `NEWS.md` says what a refresh changes.

## Maintaining

- The guide renders with `quarto render` into `docs/`, which is
  committed and served by GitHub Pages. Render before committing a brand
  change so the site and the file agree.
- The assets regenerate with Typst, for example
  `typst compile --root . --format png --ppi 72 assets/avatar.typ assets/avatar.png`
  (the social preview needs the Atkinson Hyperlegible Next files on a
  font path).
- The brand.yml R package reads one mode per file, so a colour that
  changes in `_brand.yml` changes in `_brand-dark.yml` too when both
  modes use it.

## License

The brand definition (`_brand.yml`, `_brand-dark.yml`: colours,
typography, and the logo references) is licensed under
[CC BY 4.0](LICENSE). Copy and adapt it with attribution to
openwashdata.

The logos identify openwashdata. CC BY 4.0 does not license trademark
rights (section 2(b)(2)), so the logo files are here so that openwashdata
material renders with the correct marks. Any other use of the logos
needs permission from openwashdata.

## Reference implementation

openwashdata/website carries the earlier values in `style/theme.scss`
and `styles.css`; the brand files here are the source of truth since
1.0.0, and the website is due to read them.
