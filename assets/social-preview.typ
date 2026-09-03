// Social preview for repositories and the website: white wordmark with the
// orange dot (OWD-logo-06) on owd-purple, tagline and URL in Atkinson
// Hyperlegible Next. Compile at 72 ppi for 1280 x 640 px.
#set page(width: 1280pt, height: 640pt, margin: 96pt, fill: rgb("#5b195b"))
#set text(font: "Atkinson Hyperlegible Next", fill: rgb("#f4f4f4"))
#align(left + horizon)[
  #image("../logos/OWD-logo-06.svg", width: 78%)
  #v(40pt)
  #text(size: 40pt, weight: 600)[Open data for water, sanitation and hygiene]
  #v(18pt)
  #text(size: 30pt, fill: rgb("#c8a3c8"))[openwashdata.org]
]
