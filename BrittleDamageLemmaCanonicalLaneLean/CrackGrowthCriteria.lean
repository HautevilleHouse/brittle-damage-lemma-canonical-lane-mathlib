import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.BrittleDamageClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure CrackGrowthCriteriaPackage (B : BrittleDamageAdmittedObject) where
  stressIntensityFactor : Type
  fractureToughness : Type
  growthCondition : Prop
  subcriticalGrowth : Prop
  unstableGrowth : Prop

structure CrackGrowthCriteriaEvidence {B : BrittleDamageAdmittedObject}
    (C : CrackGrowthCriteriaPackage B) where
  growthConditionClosed : C.growthCondition
  subcriticalGrowthClosed : C.subcriticalGrowth
  unstableGrowthClosed : C.unstableGrowth

def CrackGrowthCriteriaClosed {B : BrittleDamageAdmittedObject}
    (C : CrackGrowthCriteriaPackage B) : Prop :=
  C.growthCondition ∧ C.subcriticalGrowth ∧ C.unstableGrowth

theorem crack_growth_criteria_closed_from_evidence
    {B : BrittleDamageAdmittedObject} (C : CrackGrowthCriteriaPackage B)
    (E : CrackGrowthCriteriaEvidence C) : CrackGrowthCriteriaClosed C := by
  exact And.intro E.growthConditionClosed
    (And.intro E.subcriticalGrowthClosed E.unstableGrowthClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse