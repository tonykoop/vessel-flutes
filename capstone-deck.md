# Vessel Flutes Build Packet
- Musical instrument documentation capstone
- Build packet: vessel-flutes-codex-bob-r3-build-packet
- Generated: 2026-05-09

---

# Project Intent
- Create an L2 root-mode build packet for vessel flutes whose pitch behavior is
set by Helmholtz resonance. The first prototype is a 130 cc ceramic ocarina lab
body with a conservative voicing and undersize finger holes. The purpose is to
validate cavity volume, voicing response, cumulative hole area, and shrinkage
before committing to a polished slip-cast family.

_Speaker notes:_ Read design.md before committing to dimensions or sourcing decisions.

---

# Physics Model
- Helmholtz resonance:

```
f = c / (2*pi) * sqrt(A / (V * L_eff))
L_eff = wall_thickness + end_correction
end_correction ~= 0.6 * sqrt(A/pi)
```

_Speaker notes:_ Governing equations extracted verbatim from design.md. Apply empirical corrections (NAF K2, scale offsets) only where the model permits — see references/acoustic-models.md.

---

# How To Use This Packet
- Start with design.md for intent and assumptions.
- Use bom.csv, sourcing.csv, and cut-list.csv before buying or cutting.
- Use drawing-brief.md and CAD/CNC folders before machining.
- Print the packet for shopping, shop work, and validation.

---

# File Map
- design.md: Project intent, catalog metadata, assumptions, and validation plan.
- bom.csv: Starter bill of materials with part categories, quantities, drawing refs, and notes.
- sourcing.csv: Supplier/search tracker with specs, price/date fields, lead time, substitutes, and risks.
- cut-list.csv: Rough/final stock sizes, material, grain/orientation, operations, yield, and offcuts.
- drawing-brief.md: Manufacturing drawing and technical product sketch brief.
- assembly-manual.md: Shop-facing sequence, tools, fixtures, safety, tuning, finishing, and maintenance notes.
- validation.csv: Target/measured values, tolerance, environment, result, and tuning/build action log.
- supplier-rfq.md: Supplier email/request-for-quote starter.

---

# Family Spec

| member_id | name | target_note | target_hz | volume_cc | voicing_area_cm2 | wall_cm | estimated_neck_cm | material_path | status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| VF-130-A4 | Ocarina lab body | A4 | 440.00 | 130 | 0.45 | 0.40 | 0.63 | hand-built clay or sealed proof body | first prototype |
| VF-95-C5 | Small vessel response body | C5 | 523.25 | 95 | 0.35 | 0.35 | 0.55 | hand-built clay | after VF-130 |
| VF-180-G4 | Large warm vessel body | G4 | 392.00 | 180 | 0.55 | 0.45 | 0.70 | slab or slip-cast study | after shrinkage data |

_Speaker notes:_ Sizes scale via the master scale factor; tuning targets are first-order Helmholtz/cantilever predictions to be empirically corrected per prototype.

---

# Build Workflow
- Design and assumptions
- Source materials and hardware
- Prepare stock, fixtures, and CNC/laser/lathe setup
- Assemble, tune, finish, and validate

---

# Sourcing And BOM
- BOM gives part categories and drawing references.
- Sourcing tracks search terms, supplier candidates, price/date, lead time, substitutions.
- Visual BOM brief turns the parts list into a presentation-ready image board.

---

# Shop Packet
- Cut list for lumber/sheet/blank planning.
- Assembly manual for away-from-keyboard work.
- Validation sheet for measured dimensions, tuning, pass/fail checks.

---

# Drawings, CAD, CNC
- drawing-brief.md defines required views, dimensions, datums, sketch intent.
- cad/ holds models and design tables.
- cnc/ holds CAM, toolpaths, setup sheets, dry-run notes.
- drawings/ holds PDFs, SVGs, DXFs, drawing exports.

---

# Images And Screenshots
- Add hero render/photo, visual BOM, shop screenshots, drawing previews, validation photos in images/.

---

# Validation Plan
- A4 = 440 Hz reference check.
- Tuning targets logged in validation.csv.
- Critical dimensions verified against design sheet and CAD.
- Photos and revision notes after each major step.

---

# Open Risks / Decisions
- TBDs in design sheet and BOM.
- Supplier price/availability not yet verified.
- Generated images marked as concept placeholders.
- Empirical corrections await measured prototype data.

---

# Next Actions
- Replace TBDs with measured/source-backed values.
- Verify live supplier price and availability before buying.
- Export final drawings and visual BOM images.
- Regenerate this deck and print packet after final edits.

---
