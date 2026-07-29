import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure FractureMechanicsPackage where
  crackTip : Type
  stressIntensity : crackTip → ℝ
  energyReleaseRate : crackTip → ℝ
  criticalStressIntensity : Prop
  crackPropagationCondition : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  criticalStressIntensityClosed : F.criticalStressIntensity
  crackPropagationConditionClosed : F.crackPropagationCondition

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.criticalStressIntensity ∧ F.crackPropagationCondition

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage)
    (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.criticalStressIntensityClosed E.crackPropagationConditionClosed

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse