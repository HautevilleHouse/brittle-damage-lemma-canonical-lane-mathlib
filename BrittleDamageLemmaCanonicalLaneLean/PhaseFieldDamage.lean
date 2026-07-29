import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

/-!
# Phase Field Damage Package

This module formalizes the phase field approach to brittle damage.
-/

structure PhaseFieldDamagePackage where
  orderParameter : Type u
  damageEvolutionEquation : Prop
  regularizationLength : Prop
  elasticEnergyDegradation : Prop

structure PhaseFieldDamageEvidence (P : PhaseFieldDamagePackage) where
  damageEvolutionEquationClosed : P.damageEvolutionEquation
  regularizationLengthClosed : P.regularizationLength
  elasticEnergyDegradationClosed : P.elasticEnergyDegradation

def PhaseFieldDamageClosed (P : PhaseFieldDamagePackage) : Prop :=
  P.damageEvolutionEquation ∧ P.regularizationLength ∧ P.elasticEnergyDegradation

theorem phase_field_damage_closed_from_evidence (P : PhaseFieldDamagePackage)
    (E : PhaseFieldDamageEvidence P) : PhaseFieldDamageClosed P := by
  exact And.intro E.damageEvolutionEquationClosed
    (And.intro E.regularizationLengthClosed E.elasticEnergyDegradationClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse