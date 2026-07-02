# Design Intent — vessel-flutes rev A

- Master CAD: `cad/vessel-flutes.scad` (sha256: 715dc841216d2e37a245d1d2480d49b5b57330c5c93b2f8f45285571b8ee5f6d), driven by `family-spec.csv` (sha256: 0eec5e36487be8d7870e3b22bb08b4b761fd7c2406b27caedc70444bdcceb9a4)
- Function: Helmholtz vessel-flute family (ocarina/xun/gemshorn-inspired ceramic studies). Pitch is governed by cavity VOLUME, voicing-aperture area, and effective neck length — NOT open-pipe tube length. f = c/(2π)·√(A/(V·L_eff)), L_eff = wall_thickness + end_correction. First target is a 130 cc ceramic ocarina lab body (VF-130-A4).
- Environment: hand-built/slip-cast ceramic; clay shrinkage/warp can invalidate holes and volume; surface leaks shift pitch. Voicing/fipple/labium and the artistic exterior form are empirical and outside the CAD envelope. Uncalibrated closed-form model until measured.
- Target qty: 1 (VF-130-A4 first prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| VF-130-A4 cavity volume | 130 cc | water-fill to ±5 cc (validation gate) | governs fundamental (A4 = 440.00 Hz) | family-spec.csv VF-130-A4 (measurement_required) |
| VF-130-A4 voicing aperture area | 0.45 cm² | empirical; first-sound test before tuning | voicing / speaking + Helmholtz A term | family-spec.csv VF-130-A4 |
| VF-130-A4 wall thickness | 0.40 cm | leak/crack + L_eff contribution | shell strength + effective neck | family-spec.csv VF-130-A4 |
| VF-130-A4 effective neck length | 0.63 cm | recompute from measured wall/port | L_eff in Helmholtz model | family-spec.csv VF-130-A4 (estimated) |
| VF-95-C5 cavity volume | 95 cc | water-fill check | fundamental (C5 = 523.25 Hz) | family-spec.csv VF-95-C5 |
| VF-180-G4 cavity volume | 180 cc | water-fill check (after shrinkage data) | fundamental (G4 = 392.00 Hz) | family-spec.csv VF-180-G4 |

## Incidental (free for DFM)

- The entire exterior body form (ocarina/xun/gemshorn shape), decorative surface, glaze color — the CAD uses a representative spherical volume proxy only; "a pretty exterior is secondary" (design.md).

## Must-nots (DFM may never violate)

- Never apply open-pipe/tube-length logic to a vessel flute — pitch is volume+area+neck (risks.md VF-AC-01; design.md).
- Voicing window/labium/fipple is tuning-sensitive: refine on a coupon first; never freeze from the CAD envelope or a lossy export (risks.md VF-AC-02).
- Do not cut a mold before test-tile shrinkage + post-fire volume data (risks.md VF-ST-01).
- Drill finger holes undersize, measure, enlarge, record — do not treat CAD hole sizes as final (design.md hole workflow).
- Seal the proof body and leak-test before evaluating tuning (risks.md VF-FI-01).

## Material intent

- Preferred: hand-built clay or sealed proof body (VF-130/VF-95); slab or slip-cast study (VF-180) per family-spec material_path / bom.csv.
- Acceptable subs: per sourcing.csv / supplier-rfq.md (spec-first; live prices unverified; record supplier body + firing cone).
- Forbidden: non-mouth-safe interior finishes on played bodies.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable. L2 candidate; model uncalibrated, authority measurement-gated.
