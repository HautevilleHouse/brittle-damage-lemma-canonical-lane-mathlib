import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure GriffithCriterionPackage where
  crackGeometry : Type u
  appliedLoad : Type v
  surfaceEnergy : Prop
  criticalStress : Prop
  growthCondition : Prop

structure GriffithCriterionEvidence (G : GriffithCriterionPackage) where
  surfaceEnergyClosed : G.surfaceEnergy
  criticalStressClosed : G.criticalStress
  growthConditionClosed : G.growthCondition

def GriffithCriterionClosed (G : GriffithCriterionPackage) : Prop :=
  G.surfaceEnergy ∧ G.criticalStress ∧ G.growthCondition

theorem griffith_criterion_closed_from_evidence
    (G : GriffithCriterionPackage) (E : GriffithCriterionEvidence G) :
    GriffithCriterionClosed G := by
  exact And.intro E.surfaceEnergyClosed
    (And.intro E.criticalStressClosed E.growthConditionClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse