(* Vessel flute research notebook starter *)

ClearAll["Global`*"];

c = 34300; (* cm/s *)

areaCircleCm2[dmm_] := Pi*(dmm/20)^2;
endCorrectionCm[area_] := 0.6*Sqrt[area/Pi];
helmholtzHz[area_, volume_, neckLength_] :=
  (c/(2*Pi))*Sqrt[area/(volume*neckLength)];
centsError[measured_, target_] := 1200*Log[2, measured/target];
targetFreq[midi_] := 440*2^((midi - 69)/12);

(* Solve required open area for target frequency. *)
areaForFrequency[f_, volume_, neckLength_] :=
  volume*neckLength*(2*Pi*f/c)^2;

(* Water fill model: water reduces air volume. *)
freqWithWater[area_, volumeAirDry_, waterCm3_, neckLength_] :=
  helmholtzHz[area, volumeAirDry - waterCm3, neckLength];

(* Simple chamber variants to compare equal volume/different form. *)
variant[name_, volume_, area_, neck_] := <|
  "Name" -> name,
  "VolumeCm3" -> volume,
  "AreaCm2" -> area,
  "NeckCm" -> neck,
  "Hz" -> helmholtzHz[area, volume, neck]
|>;

seed = variant["VF-01 Seed", 130, areaCircleCm2[7], 0.4 + endCorrectionCm[areaCircleCm2[7]]];
waterBird = variant["VF-02 Water Bird", 90, areaCircleCm2[5], 0.35 + endCorrectionCm[areaCircleCm2[5]]];
doublePod = variant["VF-03 Double Pod", 160, areaCircleCm2[7], 0.45 + endCorrectionCm[areaCircleCm2[7]]];

Dataset[{seed, waterBird, doublePod}]

(* Plot water bend for the water-bird concept. *)
Table[
  {water, freqWithWater[waterBird["AreaCm2"], waterBird["VolumeCm3"], water, waterBird["NeckCm"]]},
  {water, 0, 30, 5}
]

