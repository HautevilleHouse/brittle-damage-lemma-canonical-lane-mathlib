import BrittleDamageLemmaCanonicalLaneLean.FractureMechanics

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure DamageEvolutionPackage {F : FractureMechanicsPackage} where
  damageVariable : F.crackTip → ℝ
  evolutionLaw : Prop
  irreversibility : Prop
  stabilityCondition : Prop

structure DamageEvolutionEvidence {F : FractureMechanicsPackage}
    (D : DamageEvolutionPackage F) where
  evolutionLawClosed : D.evolutionLaw
  irreversibilityClosed : D.irreversibility
  stabilityConditionClosed : D.stabilityCondition

def DamageEvolutionClosed {F : FractureMechanicsPackage}
    (D : DamageEvolutionPackage F) : Prop :=
  D.evolutionLaw ∧ D.irreversibility ∧ D.stabilityCondition

theorem damage_evolution_closed_from_evidence {F : FractureMechanicsPackage}
    (D : DamageEvolutionPackage F) (E : DamageEvolutionEvidence D) :
    DamageEvolutionClosed D := by
  exact And.intro E.evolutionLawClosed (And.intro E.irreversibilityClosed E.stabilityConditionClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse