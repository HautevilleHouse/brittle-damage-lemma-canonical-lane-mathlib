import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.BrittleFractureModel

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure CrackPropagationPackage {M : BrittleFractureModel} where
  crackGrowthLaw : Prop
  energyReleaseRate : Prop
  crackPathStability : Prop
  propagationCriterion : Prop

structure CrackPropagationEvidence {M : BrittleFractureModel} (P : CrackPropagationPackage M) where
  crackGrowthLawClosed : P.crackGrowthLaw
  energyReleaseRateClosed : P.energyReleaseRate
  crackPathStabilityClosed : P.crackPathStability
  propagationCriterionClosed : P.propagationCriterion

def CrackPropagationClosed {M : BrittleFractureModel} (P : CrackPropagationPackage M) : Prop :=
  P.crackGrowthLaw ∧ P.energyReleaseRate ∧ P.crackPathStability ∧ P.propagationCriterion

theorem crack_propagation_closed_from_evidence {M : BrittleFractureModel} (P : CrackPropagationPackage M) (E : CrackPropagationEvidence P) :
    CrackPropagationClosed P := by
  exact And.intro E.crackGrowthLawClosed (And.intro E.energyReleaseRateClosed (And.intro E.crackPathStabilityClosed E.propagationCriterionClosed))

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse