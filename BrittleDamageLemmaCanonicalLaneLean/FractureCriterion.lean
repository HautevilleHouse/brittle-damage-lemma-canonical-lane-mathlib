import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

/-!
# Fracture Criterion Package

This module defines the critical condition for crack propagation.
-/

structure FractureCriterionPackage where
  toughnessParameter : Type u
  criticalEnergyReleaseRate : Prop
  stressIntensityThreshold : Prop
  criterionEquivalence : Prop

structure FractureCriterionEvidence (C : FractureCriterionPackage) where
  criticalEnergyReleaseRateClosed : C.criticalEnergyReleaseRate
  stressIntensityThresholdClosed : C.stressIntensityThreshold
  criterionEquivalenceClosed : C.criterionEquivalence

def FractureCriterionClosed (C : FractureCriterionPackage) : Prop :=
  C.criticalEnergyReleaseRate ∧ C.stressIntensityThreshold ∧ C.criterionEquivalence

theorem fracture_criterion_closed_from_evidence (C : FractureCriterionPackage)
    (E : FractureCriterionEvidence C) : FractureCriterionClosed C := by
  exact And.intro E.criticalEnergyReleaseRateClosed
    (And.intro E.stressIntensityThresholdClosed E.criterionEquivalenceClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse