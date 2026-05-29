# Vessel Flutes

**Status: L2 V5 build-packet candidate.** Helmholtz vessel flute packet with design documents, BOM, Wolfram source, and Helmholtz validation gates. Not build-ready until volume/voicing measurements close the gates in `helmholtz-gates.json` and `validation.csv`. No dimensioned drawings or renders generated yet.

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

## Calibration Status

**This is not a calibrated vessel flute design.** The Helmholtz model in
`design.md` is closed-form and uncalibrated. Cavity volume, voicing aperture,
effective neck length, wall thickness, and material/fire state are all unknowns
that must be measured on a real prototype before any pitch claim is treated as
trustworthy.

- `helmholtz-gates.json` records the model's validity boundary, ambient
  assumptions, and measurement requirements that block L3 promotion.
- `tuning-log.csv` is a header-only stub. Rows are appended only from real
  prototype measurements; pending or guessed values stay marked `pending` or
  `stub`, never measured-looking.

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
| `helmholtz-gates.json` | Model boundary, ambient assumptions, and measurement requirements |
| `tuning-log.csv` | Header-only stub for first measured tuning row |

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
