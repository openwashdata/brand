# openwashdata brand 1.0.0

First tagged release. The guide at <https://openwashdata.github.io/brand/>
shows everything below rendered from the files.

## Palette

- owd-orange darkened from `#c14a09` to `#b04208` so it passes WCAG AA as
  text on paper (5.3:1) and carries white text.
- New accents with the same property: owd-green `#257a5a` (success),
  owd-red `#a4262c` (danger), owd-grey `#5c5c5c` and owd-grey-light
  `#b5b5b5` (secondary), owd-blue-light `#9fb6ff` (links on dark
  backgrounds), owd-purple-dim `#3f1a3f` (wells on dark backgrounds).
- mint, peach, sand and rose are highlight backgrounds only, with ink
  text; they are no longer semantic roles. `success` moves from mint to
  owd-green, `warning` from sand to owd-orange.
- All eleven roles set: foreground, background, primary, secondary,
  tertiary, success, info, warning, danger, light, dark.
- Bootstrap aliases gain `red`; `green` now points at owd-green.

## Typography

- Atkinson Hyperlegible Next replaces Atkinson Hyperlegible (weights 400,
  600, 700 with italics; 150 languages; a variable font). Source Code Pro
  stays for code.
- Headings in the primary colour; code (inline and block) on the
  owd-purple-bg tint; links underlined.

## Dark mode

- `_brand-dark.yml`: the dark brand with the same palette and logos and
  dark values for every role. Quarto websites toggle between the two
  files. The brand.yml R package reads one mode per file, hence two files.

## Logos

- Alt text on every designated image.
- White variants designated for dark backgrounds: OWD-logo-05 (wordmark)
  and OWD-logo-16 (stacked), plus the badge OWD-logo-40.
- Assets generated with Typst: `assets/avatar.png` (1024 by 1024) and
  `assets/social-preview.png` (1280 by 640).

## Guide

- `example.qmd` is now `index.qmd`, a Quarto website published from
  `docs/`: swatches, roles, a computed contrast table, callouts, logo
  rules, dark mode, themed ggplot2 and gt examples, the assets, and how
  every consumer reads the brand.
