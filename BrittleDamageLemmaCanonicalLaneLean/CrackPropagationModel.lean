import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure CrackPropagationPackage where
  propagationLaw : Type u
  crackSpeed : Type v
  stabilityCondition : Prop
  branchingCriteria : Prop
  limitingSpeed : Prop

structure CrackPropagationEvidence (C : CrackPropagationPackage) where
  stabilityConditionClosed : C.stabilityCondition
  branchingCriteriaClosed : C.branchingCriteria
  limitingSpeedClosed : C.limitingSpeed

def CrackPropagationClosed (C : CrackPropagationPackage) : Prop :=
  C.stabilityCondition ∧ C.branchingCriteria ∧ C.limitingSpeed

theorem crack_propagation_closed_from_evidence
    (C : CrackPropagationPackage) (E : CrackPropagationEvidence C) :
    CrackPropagationClosed C := by
  exact And.intro E.stabilityConditionClosed
    (And.intro E.branchingCriteriaClosed E.limitingSpeedClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse