import canonicalLaneMathlib.Basic

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure CrackGrowthModel where
  crackLength : ℝ → ℝ
  growthRate : ℝ → ℝ
  criticalStressIntensity : ℝ
  fractureToughness : ℝ
  kicDominated : Prop
  parisLawCoefficient : ℝ
  parisExponent : ℝ
  growthEquation : crackLength = λ t => (parisLawCoefficient) * (growthRate t) ^ parisExponent
  initialCondition : crackLength 0 = 0

structure CrackGrowthEvidence (M : CrackGrowthModel) where
  kicDominatedClosed : M.kicDominated
  growthEquationClosed : M.growthEquation = M.growthEquation
  initialConditionClosed : M.initialCondition

def CrackGrowthClosed (M : CrackGrowthModel) : Prop :=
  M.kicDominated ∧ M.growthEquation ∧ M.initialCondition

theorem crack_growth_closed_from_evidence (M : CrackGrowthModel) (E : CrackGrowthEvidence M) :
    CrackGrowthClosed M := by
  exact And.intro E.kicDominatedClosed (And.intro E.growthEquationClosed E.initialConditionClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse