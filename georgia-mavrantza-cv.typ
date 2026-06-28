// =============================================================================
//  Georgia Mavrantza — Curriculum Vitae
//  ---------------------------------------------------------------------------
//  HOW TO EDIT:  Just change the text inside the sections below. The layout,
//                colours and spacing are defined once at the top and reused.
//  HOW TO BUILD: typst compile cv.typ            -> cv.pdf
//                typst watch   cv.typ            (live preview while editing)
// =============================================================================

// ----- Theme ---------------------------------------------------------------
#let accent    = rgb("#2f5d62")   // deep teal — change this to recolour the CV
#let muted     = rgb("#5b6770")   // secondary grey text
#let sidebarbg = rgb("#f1f4f4")   // sidebar band colour
#let sidebar-w = 6.6cm

#set text(font: "Liberation Sans", size: 9pt, fill: rgb("#23292d"), lang: "en")
#set par(justify: false, leading: 0.55em)

#set page(
  paper: "a4",
  margin: 0pt,
  // Draws the sidebar band on EVERY page so content can flow over multiple pages.
  background: place(top + left, rect(width: sidebar-w, height: 100%, fill: sidebarbg)),
)

// ----- Reusable building blocks --------------------------------------------

// Heading used inside the grey sidebar
#let side-h(body) = block(above: 12pt, below: 5pt)[
  #text(size: 9pt, weight: "bold", fill: accent, tracking: 0.8pt)[#upper(body)]
  #v(-5pt)
  #line(length: 100%, stroke: 0.6pt + accent.lighten(35%))
]

// Heading used in the main column
#let main-h(body) = block(above: 12pt, below: 7pt)[
  #text(size: 11.5pt, weight: "bold", fill: accent, tracking: 0.6pt)[#upper(body)]
  #v(-6pt)
  #line(length: 100%, stroke: 1.1pt + accent)
]

// The dot that sits on the timeline rail
#let tl-dot = place(top + right, dx: 3pt, dy: 2pt,
  circle(radius: 3pt, fill: white, stroke: 1.5pt + accent))

// A vertical "timeline" of entries (continuous rail + a dot per entry)
#let timeline(..items) = {
  let cells = ()
  for it in items.pos() {
    cells.push(tl-dot)
    cells.push(it)
  }
  grid(
    columns: (15pt, 1fr),
    stroke: (x, y) => if x == 1 { (left: 1.1pt + accent.lighten(15%)) },
    inset: (x, y) => if x == 1 { (left: 11pt, bottom: 8pt) } else { (bottom: 8pt) },
    ..cells,
  )
}

// One job / education entry (used inside `timeline`)
// `set block(spacing)` keeps the org/place and body lines tucked tightly under
// the role title; separation BETWEEN entries comes from the timeline cell inset.
#let entry(role, org: "", place: "", dates: "", body: none) = {
  set block(spacing: 3pt)
  grid(columns: (1fr, auto), column-gutter: 8pt,
    text(size: 10pt, weight: "bold")[#role],
    text(size: 8pt, fill: muted)[#dates],
  )
  if org != "" or place != "" {
    block[
      #text(size: 9pt, fill: accent, style: "italic")[#org]
      #if place != "" [ #text(size: 8.5pt, fill: muted)[ · #place] ]
    ]
  }
  if body != none { block[#text(size: 9pt)[#body]] }
}

// Compact one-line item (certificates, activities)
#let item(title, dates: "", note: "") = block(below: 4.5pt)[
  #grid(columns: (1fr, auto), column-gutter: 8pt,
    text(size: 9pt)[#title #if note != "" [#text(fill: muted)[ · #note]]],
    text(size: 8pt, fill: muted)[#dates],
  )
]

// A line in the contact block
#let contact(label, value) = block(above: 0pt, below: 8pt)[
  #text(size: 7.5pt, fill: accent, weight: "bold", tracking: 0.5pt)[#upper(label)] \
  #text(size: 8.8pt)[#value]
]

// A skill / tool chip
#let chip(body) = box(
  fill: white, stroke: 0.6pt + accent.lighten(30%), radius: 3pt,
  inset: (x: 5pt, y: 2.5pt), outset: (y: 1.6pt),
)[#text(size: 8pt)[#body]]

// =============================================================================
//  PAGE CONTENT
// =============================================================================
#grid(
  columns: (sidebar-w, 1fr),

  // ------------------------------------------------------------- SIDEBAR ----
  pad(x: 16pt, top: 18pt, bottom: 16pt)[

    // Photo — circular with a ringed rim
    #align(center)[
      #box(stroke: 2pt + accent, radius: 50%, inset: 3pt)[
        #box(clip: true, radius: 50%, width: 3.3cm, height: 3.3cm)[
          #image("georgia.mavrantza.jpg", width: 3.3cm, height: 3.3cm, fit: "cover")
        ]
      ]
      #v(8pt)
      #text(size: 16pt, weight: "bold", fill: accent, font: "Libertinus Serif")[Georgia\ Mavrantza]
      #v(2pt)
    ]

    #side-h[Personal Info]
    #contact("Date of birth", "07/05/1987")
    #contact("Nationality", "Greek")
    #contact("Driving licence", "Category B")

    #side-h[Contact]
    #contact("Address", "5 Athanasiou Diakou, 57000\nNea Raidestos, Greece")
    #contact("Phone", "(+30) 698 383 4278")
    #contact("Email", link("mailto:georgiamavrantza@gmail.com")[georgiamavrantza\@gmail.com])
    #contact("LinkedIn", link("https://www.linkedin.com/in/georgia-mavrantza-85a489254")[georgia-mavrantza])

    #side-h[Languages]
    #block(below: 5pt)[
      #text(size: 9pt, weight: "medium")[Greek] #h(1fr) #text(size: 8pt, fill: muted)[Native]
    ]
    #block(below: 5pt)[
      #text(size: 9pt, weight: "medium")[English] #h(1fr) #text(size: 8pt, fill: muted)[C2 — Proficient]
      #linebreak()
      #text(size: 7.5pt, fill: muted)[LRN C2 (2024) · FCE Michigan (2001)]
    ]

    #side-h[Skills & Tools]
    #box[
      #chip[MS Word] #chip[MS Excel] #chip[MS PowerPoint] #chip[MS Outlook]
      #chip[Google Workspace] #chip[Adobe Photoshop] #chip[Adobe Lightroom]
      #chip[Image Editing] #chip[CMS] #chip[Social Media] #chip[Windows OS]
      #chip[Web Browsers] #chip[ECDL]
    ]
  ],

  // ---------------------------------------------------------------- MAIN ----
  pad(x: 22pt, top: 20pt, bottom: 16pt)[

    #main-h[Work Experience]
    #timeline(
      entry(
        "Greek & Ancient Greek Tutor", org: "Freelance", place: "Thermi, Thessaloniki",
        dates: "2024 – Present",
      ),
      entry(
        "Greek & Ancient Greek Tutor", org: "Freelance", place: "Thessaloniki",
        dates: "2013 – 2017",
      ),
      entry(
        "Vocal Coach", org: "Freelance", place: "Thessaloniki",
        dates: "2013 – 2017",
      ),
      entry(
        "Customer Service", org: "Active Technology", place: "Thessaloniki",
        dates: "2023",
      ),
      entry(
        "Sales & Marketing Specialist", org: [Antique Store "Akrokeramon"], place: "Thessaloniki",
        dates: "2019 – 2023",
      ),
      entry(
        "Marketing Team Member", org: "Target Power Group", place: "Thessaloniki",
        dates: "2018",
      ),
    )

    #main-h[Education & Training]
    #timeline(
      entry(
        "Bachelor's Degree in History and Archaeology", org: "Aristotle University of Thessaloniki (AUTH)",
        place: "Thessaloniki", dates: "2016",
      ),
      entry(
        "Certificate in Special Education and Training (440 hours)",
        org: "University of the Aegean", dates: "2024",
      ),
      entry(
        "Diploma in Classical Singing", org: "Central Music School of Thessaloniki",
        place: "Thessaloniki", dates: "2011",
      ),
      entry(
        "High School Diploma", org: "3rd Public High School of Larissa",
        place: "Larissa", dates: "2005",
      ),
    )
    #v(1pt)
    #text(size: 8pt, weight: "bold", fill: muted, tracking: 0.5pt)[#upper("Certificates & Seminars")]
    #v(4pt)
    #item("LRN Level 3 Certificate in ESOL International (CEF C2)", dates: "2024")
    #item("Certificate of Completion in Green Skills Upskilling Program", dates: "2024")
    #item("ECDL — Computer Skills Certification", dates: "2017")
    #item("FCE of Michigan", dates: "2001")

    #main-h[Activities & Achievements]
    #item("Opera / Pop / Rock / Symphonic Metal singing", dates: "2005 – Present")
    #item("Traditional Greek dancing", dates: "1994 – 2017")
    #item("Member, Student Union of the Aristotle University", note: "Thessaloniki", dates: "2005 – 2009")
    #item("President, High School Student Council", note: "Larissa", dates: "2004 – 2005")
    #item("Member, Theatrical Team \"Kaleidoscope\"", dates: "2012 – 2014")
    #item("Sprinter (short-distance runner)", dates: "1999 – 2004")

    #main-h[Interests]
    #text(size: 9pt)[Music · Photography · Cinema · Role-playing games]
  ],
)
