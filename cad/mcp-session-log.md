# CAD / MCP Session Log — vessel-flutes

No external MCP or creative-tool sessions have produced artifacts in this packet as of 2026-05-29.
No dimensioned drawings or renders have been generated yet; drawings/ and images/ hold placeholder stubs only.

When an OpenSCAD MCP, Blender MCP, or image-gen session produces or modifies a repo artifact,
add a row to the table below before committing that artifact.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
|---|---|---|---|---|---|---|---|
| — | — | — | — | — | — | — | No sessions recorded. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | family-spec.csv; design.md governing model | cad/vessel-flutes.scad | cad_authoring | pending_measurement | self_checked | Authored parametric Helmholtz-envelope master: cavity volume/wall/voicing-area/neck from family-spec.csv (VF-130-A4/VF-95-C5/VF-180-G4). Volume-matched spherical cavity proxy; exterior body form + voicing/fipple/finger-hole geometry OUT OF SCOPE (hand-refined, per design.md/risks.md). NOT fabrication authority. openscad render check: pass (openscad -o STL, exit 0). |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | family-spec.csv | vessel-flutes-starter.wl; wolfram-starter.wl | analysis_source | derived_preview | unreviewed | Existing Wolfram starters; source-only (not executed). L2 evidence. |
