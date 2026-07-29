import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure DamageEvolutionLaw where
  damageRate : Type
  equivalentStrainMeasure : Prop
  loadingUnloadingConditions : Prop
  damageThreshold : Prop
  damageThresholdTerm : damageThreshold
  irreversibilityCondition : Prop
  irreversibilityConditionTerm : irreversibilityCondition

structure DamageEvolutionEvidence (D : DamageEvolutionLaw) where
  equivalentStrainMeasureClosed : D.equivalentStrainMeasure
  loadingUnloadingConditionsClosed : D.loadingUnloadingConditions
  damageThresholdClosed : D.damageThreshold
  irreversibilityConditionClosed : D.irreversibilityCondition

def DamageEvolutionClosed (D : DamageEvolutionLaw) : Prop :=
  D.equivalentStrainMeasure ∧ D.loadingUnloadingConditions ∧
  D.damageThreshold ∧ D.irreversibilityCondition

theorem damage_evolution_closed_from_evidence (D : DamageEvolutionLaw)
    (E : DamageEvolutionEvidence D) : DamageEvolutionClosed D := by
  exact And.intro E.equivalentStrainMeasureClosed
    (And.intro E.loadingUnloadingConditionsClosed
      (And.intro E.damageThresholdClosed E.irreversibilityConditionClosed))

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse