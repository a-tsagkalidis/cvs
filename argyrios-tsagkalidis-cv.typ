// =============================================================================
//  Argyrios Tsagkalidis — Curriculum Vitae
//  ---------------------------------------------------------------------------
//  HOW TO EDIT:  Just change the text inside the sections below. The layout,
//                colours and spacing are defined once at the top and reused.
//  HOW TO BUILD: typst compile argyrios-tsagkalidis-cv.typ   -> .pdf
//                typst watch   argyrios-tsagkalidis-cv.typ   (live preview)
// =============================================================================

// ----- Theme ---------------------------------------------------------------
#let accent    = rgb("#2b5797")   // corporate blue — change this to recolour the CV
#let muted     = rgb("#5b6770")   // secondary grey text
#let sidebarbg = rgb("#f1f3f7")   // sidebar band colour
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

// One project entry (used inside `timeline`)
#let project(title, dates: "", stack: none, body: none, link-label: none, url: none) = {
  set block(spacing: 3pt)
  grid(columns: (1fr, auto), column-gutter: 8pt,
    text(size: 10pt, weight: "bold")[#title],
    text(size: 8pt, fill: muted)[#dates],
  )
  if body != none { block[#text(size: 9pt)[#body]] }
  if stack != none { block[#text(size: 8.5pt, fill: muted, style: "italic")[Stack: #stack]] }
  if url != none {
    block[
      #text(size: 8.5pt, fill: accent, weight: "bold")[Link ]
      #text(size: 8.5pt)[#link(url)[#link-label]]
    ]
  }
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

// A labelled group of skill chips
#let skill-group(label, ..chips) = block(below: 7pt)[
  #text(size: 8pt, weight: "bold", fill: accent, tracking: 0.5pt)[#upper(label)]
  #v(3pt)
  #box[#chips.pos().join[ ]]
]

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
          #image("argyrios.tsagkalidis.jpg", width: 3.3cm, height: 3.3cm, fit: "cover")
        ]
      ]
      #v(8pt)
      #text(size: 16pt, weight: "bold", fill: accent, font: "Libertinus Serif")[Argyrios\ Tsagkalidis]
      #v(2pt)
      #text(size: 8.5pt, fill: muted, tracking: 0.5pt)[IT Professional · Systems Administrator]
    ]

    #side-h[Personal Info]
    #contact("Date of birth", "06/05/1984")
    #contact("Nationality", "Greek")
    #contact("Gender", "Male")
    #contact("Driving licence", "Category B")

    #side-h[Contact]
    #contact("Address", "Athanasiou Diakou 5\n57001 Nea Raidestos\nThessaloniki, Greece")
    #contact("Phone", "(+30) 697 919 5398")
    #contact("Email", link("mailto:argyrios.tsagkalidis@onedice.org")[argyrios.tsagkalidis\@onedice.org])
    #contact("Website", link("https://aboutme.onedice.org")[aboutme.onedice.org])

    #side-h[Languages]
    #block(below: 5pt)[
      #text(size: 9pt, weight: "medium")[Greek] #h(1fr) #text(size: 8pt, fill: muted)[Native]
    ]
    #block(below: 5pt)[
      #text(size: 9pt, weight: "medium")[English] #h(1fr) #text(size: 8pt, fill: muted)[C2 — Proficient]
      #linebreak()
      #text(size: 7.5pt, fill: muted)[LRN C2 (Esolnet) · FCE B2 (Cambridge)]
    ]

    #side-h[Military Service]
    #block(below: 5pt)[
      #text(size: 9pt)[Combat Support Arms — Signal Arms]
    ]
  ],

  // ---------------------------------------------------------------- MAIN ----
  pad(x: 22pt, top: 20pt, bottom: 16pt)[

    #main-h[About Me]
    #text(size: 9pt)[
      Experienced IT professional with a background in systems administration, L1
      support, and hardware repairing and maintenance. I hold a BSc in Electronics
      Engineering, complemented by certifications in C, Python, cybersecurity, SQL,
      Azure Cloud, and networks. Proficient in a range of technologies, including
      Windows and Linux systems, networking, scripting, app development, CI/CD,
      containerization, and cloud services.
    ]

    #main-h[Work Experience]
    #timeline(
      entry(
        "Global On-Site Support Engineer",
        org: "Capgemini Engineering · Group IT", place: "GOSS",
        dates: "2024 – Current",
        body: [Networking · L1 support · Intune management · IAM · Corporate Directory management · ServiceNow · System and AV rooms maintenance],
      ),
      entry(
        "NOC Systems Administrator",
        org: "HDL Design House", place: "Network Operation Center",
        dates: "2022 – 2024",
        body: [Networking · L1/L2 support · Active Directory management · Ansible playbooks · VPN configuration · ESET Protect management · M365 administration · Monitoring with Icinga2 · System and AV rooms maintenance],
      ),
      entry(
        "IT Helpdesk",
        org: "Target Power Group",
        dates: "2018 – 2022",
        body: [Networking · IAM · Data DRP · L1 support · Systems monitoring],
      ),
      entry(
        "Computer Hardware Technician",
        org: "Target Power Electronics",
        dates: "2013 – 2018",
        body: [Repairing and maintenance · SMD soldering · BGA reworks · IC reprogramming · Diagnosing · Assembling/disassembling · Technical support],
      ),
    )

    #main-h[Education & Training]
    #timeline(
      entry(
        "BSc in Electronics Engineering",
        org: "Technological Educational Institute of Thessaloniki",
        place: "Dept. of Electronics Engineering",
        dates: "",
        body: [
          Specialization in microprocessors / microcomputers. \
          Internship at Papastolou Healthcare Technologies. \
          #text(fill: muted)[Thesis: Appliance power usage monitor]
        ],
      ),
      entry(
        "School Graduate",
        org: "1st Vocational School of Xanthi",
        place: "Analogue Electronics",
        dates: "",
      ),
    )

    #v(1pt)
    #text(size: 8pt, weight: "bold", fill: muted, tracking: 0.5pt)[#upper("Computer Science Certificates")]
    #v(4pt)
    #item("Azure Administrator Associate AZ-104", note: "Microsoft Certified")
    #item("Azure Fundamentals AZ-900", note: "Microsoft Certified")
    #item("Python Data Structures", note: "University of Michigan")
    #item("Professional Certificate in CS for Python", note: "Harvard edX")
    #item("Computer Science CS50X", note: "Harvard edX")
    #item("Programming with Python CS50P", note: "Harvard edX")
    #item("Cybersecurity CS50CS", note: "Harvard edX")
    #item("Networking Essentials for CCNA", note: "CISCO Network Academy")

    #v(4pt)
    #text(size: 8pt, weight: "bold", fill: muted, tracking: 0.5pt)[#upper("English Language Certificates")]
    #v(4pt)
    #item("LRN C2", note: "Esolnet")
    #item("FCE B2", note: "University of Cambridge")

    #main-h[Projects]
    #timeline(
      project(
        "ArcanaPDF", dates: "01/2023 – 10/2025",
        body: [A personal, free and open-source tool that streamlines the creation of character sheets for 5E-compatible TTRPGs.],
        stack: [Flask/Jinja2, JavaScript/HTML/CSS, Redis, MySQL (SQLAlchemy), Gunicorn, Nginx, Docker, GitHub Actions],
        link-label: "arcanapdf.onedice.org", url: "https://arcanapdf.onedice.org",
      ),
      project(
        "NamEngine", dates: "04/2025 – 06/2025",
        body: [A dynamic and creative fictional name generator for writers, game masters and creators.],
        stack: [Flask/Jinja2, JavaScript/HTML/CSS, Docker, GitHub Actions],
        link-label: "namengine.onedice.org", url: "https://namengine.onedice.org",
      ),
      project(
        "CTerminal", dates: "10/2024 – 12/2024",
        body: [A browser-based terminal that runs subprocesses on any server, built with FastAPI.],
        link-label: "cterminal.onedice.org", url: "https://cterminal.onedice.org",
      ),
      project(
        "Timesheet validation tool", dates: "05/2024 – 06/2024",
        body: [Python/TKinter tool that validates batches of timesheet Excel files; built to support the HR department's monthly validation tasks.],
        link-label: "github.com/a-tsagkalidis/tsvalidtool", url: "https://github.com/a-tsagkalidis/tsvalidtool",
      ),
      project(
        "CS50 Cybersecurity Final Project", dates: "04/2024",
        body: [An analysis of an XSS attack from 29 June 2023 exploiting a security vulnerability in Zimbra Collaboration software.],
        link-label: "youtube.com/watch?v=tBVnlp9tfnQ", url: "https://www.youtube.com/watch?v=tBVnlp9tfnQ",
      ),
      project(
        "LLM API Wrapper", dates: "03/2024",
        body: [A containerized API running on an Ollama server to resolve AI text-to-text requests.],
        link-label: "llm.apis.onedice.org", url: "https://llm.apis.onedice.org",
      ),
      project(
        "Swappr", dates: "01/2024 – 04/2024",
        body: [A home-swapping app where users exchange their houses. Final project for Harvard's CS50X.],
        link-label: "github.com/a-tsagkalidis/swappr", url: "https://github.com/a-tsagkalidis/swappr",
      ),
      project(
        "PyPi Package: fictional-names", dates: "06/2023 – 11/2023",
        body: [A PyPi Python 3 package that creates randomized fictional names for several scenarios.],
        link-label: "pypi.org/project/fictional-names", url: "https://pypi.org/project/fictional-names/",
      ),
      project(
        "URL redirect checker", dates: "10/2023",
        body: [A Python script that reads a list of URLs from Excel and verifies their expected redirects. Written to support a legacy WordPress site migration.],
        link-label: "github.com/a-tsagkalidis/url_redirect_checker", url: "https://github.com/a-tsagkalidis/url_redirect_checker",
      ),
      project(
        "SMTP Relay API", dates: "01/2023 – 02/2023",
        body: [A containerized SMTP relay that forwards email content to the recipient and sends an acknowledgement email to the sender.],
        link-label: "smtp.apis.onedice.org", url: "https://smtp.apis.onedice.org/send_email",
      ),
    )

    #main-h[Skills]
    #skill-group("Programming & Scripting",
      chip[Python 3], chip[C], chip[Assembly], chip[HTML/CSS/JavaScript],
      chip[SQL], chip[Bash], chip[PowerShell],
    )
    #skill-group("Operating Systems",
      chip[Windows (since '98)], chip[Linux/Unix], chip[CLI],
    )
    #skill-group("Dev Tools, Frameworks & Libraries",
      chip[Flask], chip[FastAPI], chip[Gunicorn], chip[Jinja2], chip[SQLAlchemy],
      chip[Locust], chip[Selenium], chip[PyPi Packaging], chip[Bootstrap],
      chip[jQuery], chip[AJAX], chip[Redis],
    )
    #skill-group("Dev CLIs & Other Tools",
      chip[Git], chip[GitHub Actions], chip[Docker CLI], chip[GitHub CLI],
      chip[Azure CLI], chip[MS-SQL Server], chip[JSON/YAML], chip[CI/CD],
      chip[CloudFlare], chip[VS Code],
    )
    #skill-group("Networking",
      chip[VPN], chip[NGINX], chip[Firewalls], chip[SFTP], chip[NAS], chip[SSH],
      chip[CISCO iOS], chip[RouterOS], chip[DNS], chip[Port Forwarding], chip[VPS],
    )
    #skill-group("Sysadmin, Cloud Services & Tools",
      chip[MS Azure], chip[MS 365], chip[MS Intune], chip[ServiceNow],
      chip[MantisBT], chip[LogMeIn], chip[DC/AD/GPOs], chip[Self-Hosted Servers],
      chip[ESET Protect], chip[PuTTY], chip[Power Automate], chip[Icinga2],
      chip[NoMachine NX],
    )
    #skill-group("Web & CMS",
      chip[WordPress], chip[Magento], chip[Web Browsers],
    )
  ],
)
