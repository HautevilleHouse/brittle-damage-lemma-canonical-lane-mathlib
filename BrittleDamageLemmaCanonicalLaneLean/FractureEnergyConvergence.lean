import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

/-!
# Fracture Energy Convergence Package

This module defines the convergence of energy approximations in numerical methods.
-/

structure FractureEnergyConvergencePackage where
  approximationScheme : Type u
  meshRefinement : Type v
  convergenceRate : Prop
  stabilityCondition : Prop

structure FractureEnergyConvergenceEvidence (F : FractureEnergyConvergencePackage) where
  convergenceRateClosed : F.convergenceRate
  stabilityConditionClosed : F.stabilityCondition

def FractureEnergyConvergenceClosed (F : FractureEnergyConvergencePackage) : Prop :=
  F.convergenceRate ∧ F.stabilityCondition

theorem fracture_energy_convergence_closed_from_evidence (F : FractureEnergyConvergencePackage)
    (E : FractureEnergyConvergenceEvidence F) : FractureEnergyConvergenceClosed F := by
  exact And.intro E.convergenceRateClosed E.stabilityConditionClosed

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse