import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure BrittleFractureModel where
  materialDomain : Type u
  crackSet : Type v
  damageField : Type w
  stressField : Type x
  fractureEnergy : Prop
  crackThreshold : Prop
  damageEvolutionLaw : Prop

structure BrittleFractureEvidence (M : BrittleFractureModel) where
  fractureEnergyClosed : M.fractureEnergy
  crackThresholdClosed : M.crackThreshold
  damageEvolutionLawClosed : M.damageEvolutionLaw

def BrittleFractureClosed (M : BrittleFractureModel) : Prop :=
  M.fractureEnergy ∧ M.crackThreshold ∧ M.damageEvolutionLaw

theorem brittle_fracture_closed_from_evidence (M : BrittleFractureModel) (E : BrittleFractureEvidence M) :
    BrittleFractureClosed M := by
  exact And.intro E.fractureEnergyClosed (And.intro E.crackThresholdClosed E.damageEvolutionLawClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse