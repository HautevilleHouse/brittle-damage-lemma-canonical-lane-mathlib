import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure DamageThresholdPackage where
  material : Type u
  thresholdFunction : Type v
  criticalDamage : Prop
  stabilityMargin : Prop
  onsetCondition : Prop

structure DamageThresholdEvidence (D : DamageThresholdPackage) where
  criticalDamageClosed : D.criticalDamage
  stabilityMarginClosed : D.stabilityMargin
  onsetConditionClosed : D.onsetCondition

def DamageThresholdClosed (D : DamageThresholdPackage) : Prop :=
  D.criticalDamage ∧ D.stabilityMargin ∧ D.onsetCondition

theorem damage_threshold_closed_from_evidence
    (D : DamageThresholdPackage) (E : DamageThresholdEvidence D) :
    DamageThresholdClosed D := by
  exact And.intro E.criticalDamageClosed
    (And.intro E.stabilityMarginClosed E.onsetConditionClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse