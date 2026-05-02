# Vessel Flute Lab

## Concept

The vessel flute lab explores sculptural ceramic wind instruments that are neither standard transverse flutes nor standard ocarinas. The core idea is to use 3D-printed mold masters to make unusual chambers repeatable enough for real acoustic study.

Think of this as a family between:

- Ocarina: fipple vessel flute, hole-area pitch control.
- Water whistle: vessel flute with water-variable chamber volume.
- Native American style flute: breath-channel craft, fipple sensitivity, and expressive low-pressure playing.
- Udu: ceramic vessel body, hand interaction, and Helmholtz bass behavior.

## Why 3D Printed Molds Matter

Hand-built vessels naturally drift in volume and wall thickness. That is beautiful, but it makes physics experiments muddy. A printed master lets you create organic shapes while still controlling:

- Internal volume.
- Port diameter and neck length.
- Wall thickness target.
- Finger-hole area.
- Fipple insert or windway geometry.
- Mold split and release.
- Shrinkage compensation.

This opens the door to creative forms that are hard to throw or pinch-build: seed pods, shells, double bulbs, torus-like chambers, animal-neutral abstract bodies, folded chambers, and ergonomic grip forms.

## Governing Model

Start with Helmholtz resonance:

```text
f = c/(2*pi) * sqrt(A_open/(V_chamber * L_eff))
```

Then treat deviations as research data:

- Non-round chambers still use measured volume for first-order tuning.
- Complex ports need measured effective neck correction.
- Fipple response depends on air jet behavior as much as chamber resonance.
- Water fill lowers effective air volume and can create pitch bends.
- Multiple chambers may need a coupled-resonator model.

## First Design Family

| Variant | Description | Physics focus | Build risk |
| --- | --- | --- | --- |
| VF-01 Seed | Single fipple chamber, 4-hole pentatonic | Hole area vs pitch | Low |
| VF-02 Water Bird | Small water whistle with fill line | Variable air volume | Low |
| VF-03 Double Pod | Two coupled chambers with one mouthpiece | Coupled Helmholtz modes | Medium |
| VF-04 Drone Vessel | Melody chamber plus fixed drone chamber | Shared breath and coupling | Medium |
| VF-05 Sculptural Transverse Vessel | Blow-across embouchure on a vessel | Edge tone plus Helmholtz interaction | High |
| VF-06 Hand-Wah Vessel | Ocarina/udu hybrid with palm port | Dynamic port area | Medium |

## Recommended First Prototype

Start with **VF-01 Seed**, a 4-hole pentatonic fipple vessel:

- Target range: A4 to E5 or G4 to D5.
- Chamber volume: choose 100-160 cm3 for an alto hand size.
- Fipple: make a replaceable or hand-cut test zone.
- Holes: 4 primary holes, no sub-holes.
- Goal: learn how far the measured fired instrument lands from the model.

This gives enough music to be satisfying without the full 12-hole ocarina burden.

## Design Table Spec

A future `Vessel-Flute.xlsx` should include these input blocks:

| Block | Fields |
| --- | --- |
| Instrument identity | Build ID, variant, target key, scale, player hand assumption |
| Chamber | CAD volume, water-fill volume, shape type, wall target |
| Material | Clay body, shrinkage, firing schedule, glaze plan |
| Voicing | Fipple type, windway width/height, labium angle, edge thickness |
| Ports | Hole ID, diameter, area, cumulative area, hand assignment |
| Tuning | Target note, target Hz, calculated Hz, measured Hz, cents error |
| Mold | Split line, plaster thickness, drain plan, release risk |
| Validation | Stage, mass, dimensions, volume, tone quality, response notes |

## Acoustic Experiments

1. **Volume sweep**
   - Print/cast three bodies with same fipple and hole areas but different chamber volumes.
   - Compare model prediction to fired pitch.

2. **Wall sweep**
   - Use same chamber and ports with different casting drain times.
   - Compare pitch, weight, shell tap tone, and projection.

3. **Fipple cartridge**
   - Keep chamber constant and test interchangeable mouthpiece/fipple geometries.
   - Measure response threshold, breath noise, and pitch stability.

4. **Water fill**
   - Add measured water increments.
   - Plot pitch vs remaining air volume.

5. **Organic shape equivalence**
   - Cast two very different shapes with equal measured chamber volume and port geometry.
   - Test whether pitch and response match closely.

## Open Questions

- Can a vessel flute be made with the gentle breath feel of Tony's Native American style flutes?
- Is a replaceable ceramic or printed fipple insert practical, or should all voicing be hand-cut?
- How much does chamber shape affect timbre when volume and openings are held constant?
- Can the mold split support undercut-looking shapes without actual undercuts?
- Can a water whistle become a controllable musical instrument rather than only an effect?

