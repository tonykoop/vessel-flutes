// vessel-flutes.scad — parametric Helmholtz vessel-flute ENVELOPE master
// =====================================================================
// SOURCE OF TRUTH: family-spec.csv (volume_cc, voicing_area_cm2, wall_cm,
//   estimated_neck_cm per member) and design.md "Governing Model" section.
//
// AUTHORITY: pending_measurement. NOT fabrication authority until reviewed.
//   The defining acoustic dimension of a vessel flute is its CAVITY VOLUME,
//   which IS carried by family-spec.csv; this model derives a volume-matched
//   cavity + wall shell + voicing port from those real target values.
//
// OUT OF SCOPE (refine by hand — tuning-sensitive, per design.md / risks.md):
//   - Fipple / windway / labium / voicing-window edge geometry
//   - Finger-hole positions and undercut (drilled undersize, tuned by ear)
//   - The artistic exterior BODY FORM. This model draws a REPRESENTATIVE
//     spherical cavity envelope only. Real ocarina / xun / gemshorn bodies
//     are ovoid/teardrop/horn shapes; the exterior here is a volume proxy so
//     the acoustic cavity, wall, and neck can be inspected — NOT a body shape
//     authority. "A pretty exterior is secondary" (design.md).
//
// All dimensions below trace to family-spec.csv. Nothing is invented; where a
// value is not in the table (exterior form) a representative proxy is used and
// labelled as such. Values must be re-derived from measured fired volume,
// shrinkage, and tuner data before any pitch/build claim (validation.csv,
// helmholtz-gates.json).

// ---- Member selector (choose one row from family-spec.csv) ----
member = "VF-130-A4";   // "VF-130-A4" | "VF-95-C5" | "VF-180-G4"

// ---- Family-spec.csv rows (real target dims; units as in the table) ----
// member_id     volume_cc  voicing_area_cm2  wall_cm  estimated_neck_cm
// VF-130-A4     130        0.45              0.40     0.63   (A4 440.00 Hz, ocarina lab body)
// VF-95-C5      95         0.35              0.35     0.55   (C5 523.25 Hz)
// VF-180-G4     180        0.55              0.45     0.70   (G4 392.00 Hz)

volume_cc =
    member == "VF-130-A4" ? 130 :
    member == "VF-95-C5"  ? 95  :
    member == "VF-180-G4" ? 180 : 130;              // family-spec.csv volume_cc

voicing_area_cm2 =
    member == "VF-130-A4" ? 0.45 :
    member == "VF-95-C5"  ? 0.35 :
    member == "VF-180-G4" ? 0.55 : 0.45;            // family-spec.csv voicing_area_cm2

wall_cm =
    member == "VF-130-A4" ? 0.40 :
    member == "VF-95-C5"  ? 0.35 :
    member == "VF-180-G4" ? 0.45 : 0.40;            // family-spec.csv wall_cm

neck_cm =
    member == "VF-130-A4" ? 0.63 :
    member == "VF-95-C5"  ? 0.55 :
    member == "VF-180-G4" ? 0.70 : 0.63;            // family-spec.csv estimated_neck_cm

// ---- Unit conversion (model in mm; family-spec is cm / cc) ----
CM  = 10;                         // cm -> mm
volume_mm3 = volume_cc * 1000;    // 1 cc = 1000 mm^3
wall_mm    = wall_cm * CM;
neck_mm    = neck_cm * CM;

// ---- Derived geometry (formulas, not baked values) ----
// Representative spherical cavity matched to target internal volume:
//   V = 4/3 * pi * r^3  ->  r = (3V / 4pi)^(1/3)
cavity_r_mm = pow( (3 * volume_mm3) / (4 * PI), 1/3 );
shell_r_mm  = cavity_r_mm + wall_mm;

// Voicing port: circular port whose area matches voicing_area_cm2.
//   A = pi * r^2  ->  r = sqrt(A / pi).  (1 cm^2 = 100 mm^2)
voicing_area_mm2 = voicing_area_cm2 * 100;
port_r_mm = sqrt( voicing_area_mm2 / PI );

$fn = 96;

// ---- Components ----
module vessel_cavity() {
    sphere(r = cavity_r_mm);
}

module vessel_shell() {
    // hollow shell = outer sphere minus cavity
    difference() {
        sphere(r = shell_r_mm);
        vessel_cavity();
    }
}

module voicing_port() {
    // neck/voicing port stub rising from the top of the shell; length =
    // estimated_neck_cm (effective neck length feeds L_eff in design.md).
    translate([0, 0, shell_r_mm - wall_mm])
        cylinder(h = neck_mm + wall_mm, r = port_r_mm + wall_mm);
}

module voicing_bore() {
    translate([0, 0, shell_r_mm - wall_mm - 0.01])
        cylinder(h = neck_mm + wall_mm + 0.02, r = port_r_mm);
}

// ---- Top-level assembly (envelope only) ----
module vessel_flute_envelope() {
    difference() {
        union() {
            vessel_shell();
            voicing_port();
        }
        voicing_bore();
    }
}

vessel_flute_envelope();

// Echo the acoustic-critical values for review.
echo(member = member, volume_cc = volume_cc, cavity_r_mm = cavity_r_mm,
     shell_r_mm = shell_r_mm, port_r_mm = port_r_mm, neck_mm = neck_mm);
