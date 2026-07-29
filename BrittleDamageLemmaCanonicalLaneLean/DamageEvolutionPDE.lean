import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure DamageEvolutionPDEPackage where
  damageVariable : Prop
  timeDependence : Prop
  parabolicRegularization : Prop
  boundaryConditions : Prop

structure DamageEvolutionPDEEvidence (D : DamageEvolutionPDEPackage) where
  damageVariableClosed : D.damageVariable
  timeDependenceClosed : D.timeDependence
  parabolicRegularizationClosed : D.parabolicRegularization
  boundaryConditionsClosed : D.boundaryConditions

def DamageEvolutionPDEClosed (D : DamageEvolutionPDEPackage) : Prop :=
  D.damageVariable ∧ D.timeDependence ∧ D.parabolicRegularization ∧ D.boundaryConditions

theorem damage_evolution_pde_closed_from_evidence (D : DamageEvolutionPDEPackage)
    (E : DamageEvolutionPDEEvidence D) : DamageEvolutionPDEClosed D := by
  exact And.intro E.damageVariableClosed
    (And.intro E.timeDependenceClosed
      (And.intro E.parabolicRegularizationClosed E.boundaryConditionsClosed))

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse