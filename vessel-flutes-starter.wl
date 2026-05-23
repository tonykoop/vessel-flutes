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
