import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure CohesiveZoneModel where
  tractionSeparationLaw : Prop
  fractureEnergyConsistent : Prop
  damageVariableDefined : Prop
  interfaceElement : Type
  cohesiveStiffnessDegradation : Prop

def CohesiveTraction (σ : CohesiveZoneModel) : Prop := σ.tractionSeparationLaw

def FractureEnergy (σ : CohesiveZoneModel) : Prop := σ.fractureEnergyConsistent

structure CohesiveZoneEvidence (σ : CohesiveZoneModel) where
  tractionSeparationLawClosed : σ.tractionSeparationLaw
  fractureEnergyConsistentClosed : σ.fractureEnergyConsistent
  damageVariableDefinedClosed : σ.damageVariableDefined

def CohesiveZoneClosed (σ : CohesiveZoneModel) : Prop :=
  σ.tractionSeparationLaw ∧ σ.fractureEnergyConsistent ∧ σ.damageVariableDefined

theorem cohesive_zone_closed_from_evidence (σ : CohesiveZoneModel)
    (E : CohesiveZoneEvidence σ) : CohesiveZoneClosed σ := by
  exact And.intro E.tractionSeparationLawClosed
    (And.intro E.fractureEnergyConsistentClosed E.damageVariableDefinedClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse