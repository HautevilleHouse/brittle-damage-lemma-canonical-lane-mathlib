import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure StressConcentrationPackage where
  crackTip : Type u
  stressField : Type v
  asymptotics : Prop
  singularTerm : Prop
  stressIntensityFactor : Prop

structure StressConcentrationEvidence (S : StressConcentrationPackage) where
  asymptoticsClosed : S.asymptotics
  singularTermClosed : S.singularTerm
  stressIntensityFactorClosed : S.stressIntensityFactor

def StressConcentrationClosed (S : StressConcentrationPackage) : Prop :=
  S.asymptotics ∧ S.singularTerm ∧ S.stressIntensityFactor

theorem stress_concentration_closed_from_evidence
    (S : StressConcentrationPackage) (E : StressConcentrationEvidence S) :
    StressConcentrationClosed S := by
  exact And.intro E.asymptoticsClosed
    (And.intro E.singularTermClosed E.stressIntensityFactorClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse