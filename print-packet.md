# Vessel Flutes Build Packet Print Packet

Generated: 2026-05-09
Packet folder: `/tmp/vessel-flutes-codex-bob-r3-build-packet`

## File Map

| File | Purpose |
| --- | --- |
| `design.md` | Project intent, catalog metadata, assumptions, and validation plan. |
| `bom.csv` | Starter bill of materials with part categories, quantities, drawing refs, and notes. |
| `sourcing.csv` | Supplier/search tracker with specs, price/date fields, lead time, substitutes, and risks. |
| `cut-list.csv` | Rough/final stock sizes, material, grain/orientation, operations, yield, and offcuts. |
| `drawing-brief.md` | Manufacturing drawing and technical product sketch brief. |
| `assembly-manual.md` | Shop-facing sequence, tools, fixtures, safety, tuning, finishing, and maintenance notes. |
| `validation.csv` | Target/measured values, tolerance, environment, result, and tuning/build action log. |
| `supplier-rfq.md` | Supplier email/request-for-quote starter. |
| `visual-bom-brief.md` | Art direction for an image-forward visual BOM. |
| `wolfram-starter.wl` | Wolfram starter for physics, optimization, visualization, and validation. |
| `CHECKLIST.md` | Project artifact. |
| `README.md` | Project artifact. |
| `concept-matrix.csv` | Project artifact. |
| `experiments.csv` | Project artifact. |
| `family-spec.csv` | Project artifact. |
| `jig-decision.md` | Project artifact. |
| `mold-workflow.md` | Project artifact. |
| `photo-shotlist.md` | Project artifact. |
| `resources.md` | Project artifact. |
| `review-evidence.md` | Project artifact. |
| `risks.md` | Project artifact. |

<div class="page-break"></div>

## design.md

Project intent, catalog metadata, assumptions, and validation plan.

# Design

## Design Intent

Create an L2 root-mode build packet for vessel flutes whose pitch behavior is
set by Helmholtz resonance. The first prototype is a 130 cc ceramic ocarina lab
body with a conservative voicing and undersize finger holes. The purpose is to
validate cavity volume, voicing response, cumulative hole area, and shrinkage
before committing to a polished slip-cast family.

This packet supports issue #1 as a reviewable packet candidate. It does not
claim L3/build-ready status until measured cavity volume, shrinkage, and tuner
data are added to `validation.csv`.

## Governing Model

Helmholtz resonance:

```text
f = c / (2*pi) * sqrt(A / (V * L_eff))
L_eff = wall_thickness + end_correction
end_correction ~= 0.6 * sqrt(A/pi)
```

Variables:

- `f`: target frequency in Hz.
- `c`: speed of sound, about 34300 cm/s at 20 C.
- `A`: effective open area in square centimeters.
- `V`: cavity volume in cubic centimeters.
- `L_eff`: effective neck length in centimeters.

For finger-hole notes, `A` is cumulative effective area, not tube length. Hole
interaction and hand coverage require empirical correction.

## Starter Bodies

| Body | Role | Volume | Voicing area | Target | Notes |
| --- | --- | ---: | ---: | ---: | --- |
| VF-130-A4 | First lab body | 130 cc | 0.45 cm2 | A4 | Ocarina-style proof body |
| VF-95-C5 | Smaller response body | 95 cc | 0.35 cm2 | C5 | Tests higher voice and hand size |
| VF-180-G4 | Larger warm body | 180 cc | 0.55 cm2 | G4 | Tests low response and wall stiffness |

## Finger-Hole Area Plan

1. Calculate required cumulative area for each target note.
2. Convert each incremental area into an undersize drill diameter.
3. Drill small, measure, enlarge, and record the final diameter.
4. Update the hole-area curve before copying the body into a mold.

Starter scale for VF-130-A4 is a simple major pentatonic: `A4, B4, C#5, E5,
F#5, A5`. A chromatic fingering chart is out of scope for this L2 pass.

## Ceramic And Prototype Path

- Quick prototype: hand-shaped clay or sealed printed/plaster mockup with
  water-fill volume measurement.
- Ceramic path: slab or pinch body first; slip-cast mold only after shrinkage
  and voicing are measured.
- Mold workflow: preserve the existing `mold-workflow.md` notes and add fired
  shrinkage rows after test tiles.

## SolidWorks/OpenSCAD Handoff

The CAD handoff should expose volume, voicing area, wall thickness, hole
diameters, and mold split line as named inputs. A pretty exterior is secondary
until the Helmholtz measurements agree with the design sheet.

## L2 To L3 Gates

- Actual cavity volume measured within +/-5 cc.
- First sound is stable at low and medium breath pressure.
- Fundamental is within +/-20 cents before tuning holes.
- Tuned pentatonic notes are within +/-10 cents or documented as correction
  data.
- Fired shrinkage is measured before a slip-cast production mold is claimed.

<div class="page-break"></div>

## bom.csv

Starter bill of materials with part categories, quantities, drawing refs, and notes.

| item | qty | unit | estimated_cost | notes |
| --- | --- | --- | --- | --- |
| Low-fire or mid-fire clay body | 5 | lb | derived estimate 12 | Enough for two small prototypes and test tiles |
| Calibrated syringe or graduated cylinder | 1 | each | derived estimate 8 | Water-fill cavity volume measurement |
| Digital caliper | 1 | each | shop tool | Measure hole diameters and wall thickness |
| Needle files and reamers | 1 | set | derived estimate 18 | Gradual hole enlargement |
| Small drill index | 1 | set | derived estimate 20 | Undersize tuning holes |
| Plaster for test mold | 5 | lb | derived estimate 15 | Only after hand-built body validates |
| Food-safe shellac or ceramic finish test | 1 | set | derived estimate 10 | Prototype sealing and surface tests |

<div class="page-break"></div>

## sourcing.csv

Supplier/search tracker with specs, price/date fields, lead time, substitutes, and risks.

| item | required_spec | search_terms | preferred_source | current_check_needed | substitution_notes |
| --- | --- | --- | --- | --- | --- |
| Clay body | known shrinkage clay with supplier data | low fire clay body shrinkage | ceramic supplier | yes | Use same body for test tiles and prototype |
| Graduated cylinder | 100 to 250 ml with readable marks | 250 ml graduated cylinder | lab or craft supplier | yes | Syringe acceptable for small cavities |
| Needle files | small round and tapered profiles | needle file set round tapered | hardware supplier | yes | Needed for controlled hole enlargement |
| Drill bits | number or metric bits under final hole size | number drill bit set | tool supplier | yes | Undersize holes are required |
| Plaster | mold plaster suitable for slip casting tests | pottery plaster slip casting | ceramic supplier | yes | Do not buy bulk until shrinkage plan is confirmed |

<div class="page-break"></div>

## cut-list.csv

Rough/final stock sizes, material, grain/orientation, operations, yield, and offcuts.

| part | qty | material | rough_dimensions_in | final_dimensions_in | operation_notes |
| --- | --- | --- | --- | --- | --- |
| VF-130 clay blank | 2 | clay | 4 x 4 x 3 equivalent | 130 cc cavity with 0.4 cm wall | Make one playable and one sectioned test |
| Test tiles | 3 | clay | 3 x 1 x 0.25 | measured fired shrinkage coupons | Fire with prototype body |
| Voicing test coupon | 2 | clay or sealed scrap | 2 x 2 x 0.5 | window and windway practice | Use before cutting final body |
| Hole-area gauge card | 1 | card or acrylic | 3 x 5 | diameter/area reference | Keep with tuning tools |
| Plaster mold test block | 1 | plaster | 6 x 6 x 3 | small split-line trial | Only after hand-built validation |

<div class="page-break"></div>

## drawing-brief.md

Manufacturing drawing and technical product sketch brief.

# Drawing Brief

## Required Sheets

1. VF-130-A4 body overview with approximate cavity, voicing, and hand position.
2. Section view showing cavity volume, wall thickness, windway, and labium.
3. Finger-hole area chart with undersize drill diameters and final measured
   diameters.
4. Mold split-line concept after shrinkage validation.

## Datum Scheme

- A: voicing centerline.
- B: mouthpiece/windway reference face.
- C: body midplane for hole layout and mold split discussion.

## Tolerance Notes

Volume, voicing, and hole area are validation variables. Drawings should label
starter dimensions as first-pass values until the measured body is logged.

<div class="page-break"></div>

## assembly-manual.md

Shop-facing sequence, tools, fixtures, safety, tuning, finishing, and maintenance notes.

# Assembly Manual

## Scope

This manual covers the VF-130-A4 lab body. A slip-cast version should wait
until the hand-built or sealed proof body validates volume, voicing, and hole
area.

## Steps

1. Weigh clay and form a simple closed cavity with an inspection/fill opening.
2. Shape the body around the 130 cc target volume, leaving extra wall thickness
   near the voicing.
3. Cut a conservative windway/window and smooth the labium edge.
4. Measure wet cavity volume by water fill and record in `validation.csv`.
5. Dry slowly; measure shrinkage against test tiles.
6. Seal the proof body if needed for first acoustic tests.
7. Establish first sound before drilling tone holes.
8. Drill tone holes undersize according to the area plan.
9. Tune by gradual enlargement, recording final diameters and cents error.
10. Fire or finish only after the acoustic target is stable.
11. Re-measure cavity volume after firing or sealing.
12. Update `mold-workflow.md` with the measured shrinkage before any slip-cast
    mold is cut.

## Stop Conditions

- Stop if the cavity leaks; pitch observations are meaningless until sealed.
- Stop if volume differs by more than 10 cc; update design before drilling.
- Stop if first sound requires high breath pressure only; adjust voicing before
  tuning holes.

<div class="page-break"></div>

## validation.csv

Target/measured values, tolerance, environment, result, and tuning/build action log.

| check | target | method | tool | actual | pass | notes |
| --- | --- | --- | --- | --- | --- | --- |
| Wet cavity volume | 130 cc +/- 5 cc | water fill before drying | graduated cylinder | pending | pending | Record before shrinkage |
| Dry/fired shrinkage | measured percent on test tiles | measure before/after firing | caliper | pending | pending | Required before mold claims |
| Voicing first sound | stable tone at low and medium breath | play test | shop notes | pending | pending | Fix voicing before drilling scale |
| Fundamental A4 | 440 Hz +/- 20 cents before tone holes | tuner at room temp | tuner | pending | pending | Adjust voicing or volume if far off |
| Hole 1 B4 | 493.88 Hz +/- 10 cents after tuning | undersize drill then enlarge | tuner | pending | pending | Record final diameter |
| Hole 2 C#5 | 554.37 Hz +/- 10 cents after tuning | undersize drill then enlarge | tuner | pending | pending | Track cumulative area |
| Hole 3 E5 | 659.25 Hz +/- 10 cents after tuning | undersize drill then enlarge | tuner | pending | pending | Check hand coverage |
| Hole 4 F#5 | 739.99 Hz +/- 10 cents after tuning | undersize drill then enlarge | tuner | pending | pending | Watch tone stability |
| Octave A5 | 880 Hz response check | overblow and fingering test | tuner | pending | pending | Do not overclaim if unstable |
| Leak check | no leaks around seam or voicing | water/air leak test | visual/play test | pending | pending | Seal prototype before judging pitch |

<div class="page-break"></div>

## supplier-rfq.md

Supplier email/request-for-quote starter.

# Supplier RFQ

## Request

Please quote the following public-safe, non-proprietary instrument-build
materials or fabrication services.

## Items

- Item: TBD
- Quantity: TBD
- Material/spec: TBD
- Tolerance: TBD
- Finish: TBD
- Lead time target: TBD

<div class="page-break"></div>

## visual-bom-brief.md

Art direction for an image-forward visual BOM.

# Visual BOM Brief

Create a one-page visual BOM after the first prototype is shaped. Required
image panels:

- Clay body or proof cavity before closure.
- Water-fill measurement setup.
- Voicing window and labium close-up.
- Drill/reamer set used for tuning holes.
- Test tiles used for shrinkage measurement.
- Final tuned prototype, front and back.

Each panel should link to the validation row it supports.

<div class="page-break"></div>

## wolfram-starter.wl

Wolfram starter for physics, optimization, visualization, and validation.

```wolfram
(* Vessel flute Helmholtz starter: cavity volume and hole area. *)

ClearAll["Global`*"];

cCmPerSec = 34300;
a4 = 440;
volumeCc = 130;
wallCm = 0.40;

areaCircleCm2[dmm_] := Pi*(dmm/20)^2;
endCorrectionCm[area_] := 0.6*Sqrt[area/Pi];
helmholtzHz[area_, volume_, neck_] := (cCmPerSec/(2*Pi))*Sqrt[area/(volume*neck)];
areaForHz[f_, volume_, neck_] := volume*neck*(2*Pi*f/cCmPerSec)^2;
centsError[measured_, target_] := 1200*Log[2, measured/target];

baseArea = 0.45;
baseNeck = wallCm + endCorrectionCm[baseArea];
baseHz = helmholtzHz[baseArea, volumeCc, baseNeck];

scale = {
  {"A4", 440.00},
  {"B4", 493.88},
  {"C#5", 554.37},
  {"E5", 659.25},
  {"F#5", 739.99},
  {"A5", 880.00}
};

areaTable = Table[
  <|
    "Note" -> note,
    "TargetHz" -> hz,
    "CumulativeAreaCm2" -> areaForHz[hz, volumeCc, baseNeck]
  |>,
  { {note, hz}, scale}
];

Dataset[areaTable]

(* Validation reminder: effective hole area must be measured on a prototype;
   this is not an open-pipe tone-hole model. *)
```

<div class="page-break"></div>

## CHECKLIST.md

Project artifact.

# Public-Ready Checklist

## Readiness Level

- [ ] L0 Concept: target sound, family, and rough build method are documented.
- [ ] L1 Design: governing equations, assumptions, dimensions, BOM, and sourcing candidates are present.
- [ ] L2 Shop Packet: build sequence, drawings/briefs, cut list, validation checklist, hazards, and artifact paths are complete enough for careful builder review.
- [ ] L3 Validated Packet: validator passes, generated/rendered artifacts open, units are consistent, and sourceability/tolerance claims are checked.
- [ ] L4 Empirical Packet: measured build data, tuning deviations, correction loop, and catalog feedback are included.

Only L3 or L4 work should be described as build-ready.

## Packet Completeness

- [ ] Replace `Vessel Flutes`, `L2 root-mode build packet for Helmholtz vessel flutes: ocarina, xun, gemshorn, and ceramic cavity prototypes.`, and other placeholders.
- [ ] Add cultural attribution and sources of inspiration.
- [ ] Replace placeholder photos with owned photos, renders, or honest public-safe placeholders.
- [ ] Fill `design.md` with instrument-specific governing equations and assumptions.
- [ ] Fill BOM, sourcing, cut list, validation, and family spec rows with non-placeholder values.
- [ ] Add OpenSCAD/SolidWorks/Wolfram handoff notes without pretending final CAD exists.
- [ ] Add drawings and a CNC/setup plan where applicable.
- [ ] Fill `resources.md` with public-safe provenance, education, maker, and license notes.
- [ ] Fill `jig-decision.md` for any make/order/buy/borrow fixture decisions.
- [ ] Run `instrument-maker-v4/scripts/validate_packet.py . --mode root --json`.
- [ ] Confirm no local absolute paths, private repo links, or frozen supplier-price claims.

## Review Evidence

- [ ] PR body includes changed behavior/artifact, physics/manufacturing assumptions, validation run, known gaps, reviewer focus, and do-not-merge-until bar.
- [ ] Physics gate passed: model, assumptions, units, tuning targets, and sensitivity ranges are reviewable.
- [ ] Manufacturing gate passed: toolchain, materials, tolerances, cut lists/jigs/CAD, and assembly order are plausible.
- [ ] Safety gate passed: dust, finishes, adhesives, sharp tools, tension, heat/pressure/electrical risks, and workshop constraints are addressed.
- [ ] Artifact gate passed: BOM, sourcing, cut list, validation, risks, drawings/CAD briefs, and rendered/generated artifacts are present or gaps are named.
- [ ] Empirical gate passed: measurement plan, pass/fail criteria, tuning correction path, and catalog feedback destination are stated.

<div class="page-break"></div>

## README.md

Project artifact.

# Vessel Flutes

> L2 root-mode build packet for Helmholtz vessel flutes: ocarina, xun,
> gemshorn-inspired ceramic studies, and quick cavity-volume prototypes.

![Hero photo placeholder](images/README-placeholder.txt)

## What This Is

This repository documents a vessel-flute build packet where pitch is governed
primarily by cavity volume, voicing aperture area, and effective neck length,
not by open-pipe tube length. The first build target is a small ceramic ocarina
lab body because it can validate volume measurement, voicing response, and
finger-hole area formulas before more ornate forms are attempted.

The packet is **L2, not L3**. It is a reviewable root-mode packet with formulas,
shop sequence, and validation gates, but it is not build-ready until a fired or
prototype body has measured volume, shrinkage, and tuning data.

Refs #1.

## Design Overview

| Topic | Packet decision |
| --- | --- |
| Governing model | Helmholtz: `f = c/(2*pi) * sqrt(A/(V * L_eff))` |
| First prototype | 130 cc ocarina-style lab body |
| Voicing | Rectangular windway/window with measured effective area |
| Tuning method | Drill holes undersize, track cumulative open area, tune by enlargement |
| Materials | Clay slab/pinch prototype first; slip-cast workflow after shrinkage data |
| Validation | Volume fill test, voicing response, scale tuning, shrinkage log |

## Why Hole Area Matters

For vessel flutes, a tone hole does not "shorten a tube." It increases the
effective open area of the resonator. The practical tuning loop is:

1. measure dry/fired cavity volume;
2. calculate target cumulative open area for each note;
3. drill holes undersize;
4. enlarge holes gradually while measuring pitch;
5. update the hole-area curve with real data.

This packet keeps that distinction explicit so pipe-flute shortcuts do not
creep into the vessel-flute workflow.

## Packet Map

| Path | Purpose |
| --- | --- |
| `design.md` | Helmholtz model, cavity-volume assumptions, hole-area logic |
| `family-spec.csv` | Three starter bodies with volume, aperture, and pitch targets |
| `bom.csv` | Clay/prototype materials, measuring tools, and finish supplies |
| `sourcing.csv` | Supply/spec tracker with live purchasing checks deferred |
| `cut-list.csv` | Clay blanks, gauges, templates, and fixture components |
| `assembly-manual.md` | Prototype sequence from volume target through tuning |
| `validation.csv` | Volume, shrinkage, voicing, and tuning measurements |
| `mold-workflow.md` | Existing ceramic lab context retained for follow-up |
| `concept-matrix.csv` | Existing concept matrix retained as design inputs |
| `wolfram-starter.wl` | Helmholtz and hole-area calculation starter |

## Build Order

1. Make a quick clay or sealed prototype body with measurable volume.
2. Cut a conservative voicing window and establish first sound.
3. Measure cavity volume by water fill before and after drying/firing when
   applicable.
4. Drill tone holes undersize and tune by cumulative open area.
5. Record fired shrinkage and update the mold/slip-cast plan.

## Status

| Area | Status |
| --- | --- |
| Packet docs | L2 root-mode candidate |
| Ceramic lab notes | Existing docs retained under `docs/ceramic-vessel-lab/` |
| Drawings/CAD | Drawing brief and mold workflow included |
| Photos | Placeholder only |
| Validation | Planned, no measured prototype yet |
| Issue linkage | Refs #1, does not close #1 |

## License

[CC BY 4.0](LICENSE) - engineering documentation only.

<div class="page-break"></div>

## concept-matrix.csv

Project artifact.

| concept_id | name | form | play_method | primary_model | creative_hook | first_target | prototype_notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| VF-01 | Seed Vessel | Asymmetric seed pod | fipple | Single Helmholtz | Organic small flute with 4-hole pentatonic scale | A4 to E5 | Best first vessel-flute prototype. |
| VF-02 | Water Bird | Small rounded pod with fill port | fipple plus water | Variable-volume Helmholtz | Pitch bends by changing water volume | TBD | Start as sound effect then tune a narrow range. |
| VF-03 | Double Pod | Two connected bulbs | fipple | Coupled Helmholtz | Two chamber colors from one breath | TBD | Needs coupled-mode measurement. |
| VF-04 | Drone Vessel | Melody bulb plus drone bulb | fipple | Coupled Helmholtz | Native-flute-like drone in ceramic vessel form | TBD | Design drone as fixed port first. |
| VF-05 | Transverse Vessel | Sculptural side-blown vessel | blow-across edge | Edge tone plus Helmholtz | Transverse flute gesture without long bore | TBD | Higher risk because embouchure physics dominates. |
| VF-06 | Hand-Wah Vessel | Udu/ocarina hybrid | fipple plus palm port | Variable-port Helmholtz | Hand opens a port for wah effects | TBD | Good bridge from udu experiments. |
| VF-07 | Shell Labyrinth | Folded shell-like chamber | fipple | Measured-volume Helmholtz | Complex outside shape with simple acoustic volume | TBD | Great 3D mold showcase if release is solved. |

<div class="page-break"></div>

## experiments.csv

Project artifact.

| experiment_id | question | controlled_variables | changed_variable | measurements | success_criteria | next_action |
| --- | --- | --- | --- | --- | --- | --- |
| VF-EXP-001 | How accurately does the Helmholtz model predict fired vessel flutes? | fipple geometry; hole area; clay body; firing schedule | chamber volume | green/bisque/fired volume and pitch | Prediction within +/-50 cents after empirical correction | Fit correction factor for this clay and voicing. |
| VF-EXP-002 | How much does wall thickness matter? | chamber CAD; port geometry; fipple; clay body | casting drain time and wall thickness | mass; wall sample; tap tone; pitch; response | Identify thickness range with good tone and low cracking | Update mold workflow with drain-time targets. |
| VF-EXP-003 | Can different shapes with equal volume tune similarly? | volume; port area; fipple geometry; wall target | external chamber shape | pitch; tone color; response threshold | Pitch similar but timbre measurably different | Choose best shape for production. |
| VF-EXP-004 | Can water fill create controllable musical bends? | body; port; fipple; hole area | water volume and tilt angle | pitch sweep; leak behavior; playability | Smooth repeatable bend over useful interval | Design fill mark and leak-safe plug. |
| VF-EXP-005 | Can a replaceable fipple cartridge work? | chamber; holes; clay body | insert geometry | response threshold; pitch stability; noise | One insert speaks reliably across multiple bodies | Create insert drawing and tolerance table. |
| VF-EXP-006 | Can a drone chamber share breath with melody chamber? | melody chamber; fipple; clay body | drone volume/port area | two-note stability; beating; breath demand | Stable drone without choking melody | Move to coupled-resonator model. |

<div class="page-break"></div>

## family-spec.csv

Project artifact.

| member_id | name | target_note | target_hz | volume_cc | voicing_area_cm2 | wall_cm | estimated_neck_cm | material_path | status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| VF-130-A4 | Ocarina lab body | A4 | 440.00 | 130 | 0.45 | 0.40 | 0.63 | hand-built clay or sealed proof body | first prototype |
| VF-95-C5 | Small vessel response body | C5 | 523.25 | 95 | 0.35 | 0.35 | 0.55 | hand-built clay | after VF-130 |
| VF-180-G4 | Large warm vessel body | G4 | 392.00 | 180 | 0.55 | 0.45 | 0.70 | slab or slip-cast study | after shrinkage data |

<div class="page-break"></div>

## jig-decision.md

Project artifact.

# Jig Decision

| Operation | Jig choice | Reason | Release check |
| --- | --- | --- | --- |
| Volume measurement | Graduated fill setup | Directly measures governing variable | Repeat fill within 2 cc |
| Voicing cut | Coupon-first hand guide | Voicing is empirical and fragile | Coupon speaks before body cut |
| Hole drilling | Hand drill with area gauge | Allows gradual hole enlargement | Final diameter recorded after tuning |
| Shrinkage test | Test-tile board | Couples every firing to a measured shrinkage row | Tile dimensions logged before/after |
| Mold planning | Split-line sketch only at L2 | Mold is premature before shrinkage data | Promote after prototype validation |

<div class="page-break"></div>

## mold-workflow.md

Project artifact.

# Vessel Flute Mold Workflow

## CAD First Principles

- Model the **inside air volume** intentionally, not just the exterior sculpture.
- Keep a named chamber-volume parameter or a repeatable CAD volume report.
- Avoid true undercuts unless using a multi-part mold.
- Add shrinkage compensation as a configurable scale factor.
- Design the split line before falling in love with the outside form.
- Put fipple and hole features in locations that can be cleaned, measured, and tuned.

## Master Print

1. Print at high enough resolution that fipple and port areas are not stair-stepped.
2. Sand and seal the master completely.
3. Measure master dimensions and compare with CAD.
4. Mark split line, datums, and build ID.

## Plaster Mold

1. Choose 2-piece mold for simple pods and 3-piece mold for forms with more dramatic shoulders.
2. Use registration keys that release cleanly and do not create stress risers.
3. Keep plaster thick enough for strength but not so massive that drying takes forever.
4. Dry the mold fully before judging casting performance.

## Casting Controls

- Record slip batch.
- Record pour time, drain time, room temperature, and humidity if available.
- Measure wall thickness from a sacrificial rim or test coupon.
- Use the same drain orientation for each comparison build.

## Fipple Strategy Options

| Strategy | Pros | Cons | Use for |
| --- | --- | --- | --- |
| Molded fipple | Repeatable once solved | Hard to release and clean | Later production |
| Hand-cut fipple | Fast iteration | More variable | First prototypes |
| Insert/cartridge | Easy A/B testing | Adds fit tolerance problem | Physics experiments |
| Printed sacrificial guide | Helps locate cuts | Must be removed cleanly | Early mold learning |

## Mold-Release Design Rules

- Organic outside forms are fine if every mold segment has a pull direction.
- Texture should be shallow until the release behavior is proven.
- Avoid thin raised details near the mouthpiece, hole edges, and split line.
- Keep the first prototype simpler than the final sculpture; prove tone first, then make it wild.

<div class="page-break"></div>

## photo-shotlist.md

Project artifact.

# Photo Shotlist

- Hero image of completed instrument or honest concept placeholder.
- Scale reference with ruler/calipers.
- Material blank before cutting.
- Key operations and jigs.
- Detail shots of acoustic features.
- Final validation setup.

<div class="page-break"></div>

## resources.md

Project artifact.

# Resources

## Engineering References To Gather Before L3

- Measured ocarina or vessel-flute cavity volumes and voicing dimensions.
- Ceramic body shrinkage data for the exact clay and firing schedule.
- Finger-hole area calculation references and measured correction curves.
- Photos or drawings of voicing geometry with reuse permission.

## Existing Local Context

- `docs/ceramic-vessel-lab/` contains previous ceramic vessel-lab notes that
  should be preserved as design history.
- `concept-matrix.csv` and `experiments.csv` remain useful intake artifacts.
- `mold-workflow.md` is the right place to promote measured shrinkage into the
  slip-casting path.

## Related Repos

- `tonykoop/ocarina` for single-instrument Helmholtz packet style.
- `tonykoop/gemshorn` for slip-cast vessel-flute family handling.
- `tonykoop/udu` for ceramic cavity-volume measurement discipline.
- `tonykoop/instrument-maker` for formulas and validation scripts.

<div class="page-break"></div>

## review-evidence.md

Project artifact.

# Review Evidence

Refs #1.

## Round 3 Scope

- Added an L2 root-mode build packet scaffold and hand-tuned it for
  vessel-flute specifics: Helmholtz cavity volume, effective hole area,
  voicing response, ceramic shrinkage, mold timing, and ocarina-style
  prototype validation.
- Existing ceramic vessel-lab notes were preserved under `docs/`.
- This packet does not claim L3/build-ready status.

## Gates Before Close

- Measure wet/dry/fired cavity volume and shrinkage.
- Record first-sound behavior, cumulative hole areas, tuned cents error, and
  leak checks in `validation.csv`.
- Promote slip-cast mold work only after the lab body validates.

<div class="page-break"></div>

## risks.md

Project artifact.

# Risks

| ID | Category | Risk | Verification test | Mitigation |
| --- | --- | --- | --- | --- |
| VF-AC-01 | Acoustic | Pipe-flute length logic is accidentally applied to a vessel flute | Design review checks Helmholtz area/volume formula | Keep hole-area table visible in packet |
| VF-AC-02 | Acoustic | Voicing does not speak cleanly | First-sound test before tuning holes | Adjust window/labium on coupon first |
| VF-ST-01 | Structural | Clay shrinks or warps enough to invalidate holes | Test-tile shrinkage and post-fire volume | Do not cut mold before shrinkage data |
| VF-ER-01 | Ergonomic | Holes tune correctly but are not coverable | Paper hand-layout and clay mock grip | Favor four-hole pentatonic starter |
| VF-SU-01 | Supply | Clay body changes shrinkage or porosity | Record supplier/body name and firing cone | Keep test tiles with every material batch |
| VF-FI-01 | Fit/finish | Surface leaks shift pitch | Water/air leak test | Seal proof body before evaluating tuning |
