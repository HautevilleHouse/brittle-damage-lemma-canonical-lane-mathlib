import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.BrittleFractureModel

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure EnergyReleaseRateAnalysisPackage {M : BrittleFractureModel} where
  griffithCriterion : Prop
  criticalEnergyReleaseRate : Prop
  crackGrowthStability : Prop
  fractureToughness : Prop

structure EnergyReleaseRateAnalysisEvidence {M : BrittleFractureModel} (E : EnergyReleaseRateAnalysisPackage M) where
  griffithCriterionClosed : E.griffithCriterion
  criticalEnergyReleaseRateClosed : E.criticalEnergyReleaseRate
  crackGrowthStabilityClosed : E.crackGrowthStability
  fractureToughnessClosed : E.fractureToughness

def EnergyReleaseRateAnalysisClosed {M : BrittleFractureModel} (E : EnergyReleaseRateAnalysisPackage M) : Prop :=
  E.griffithCriterion ∧ E.criticalEnergyReleaseRate ∧ E.crackGrowthStability ∧ E.fractureToughness

theorem energy_release_rate_analysis_closed_from_evidence {M : BrittleFractureModel} (E : EnergyReleaseRateAnalysisPackage M) (Ev : EnergyReleaseRateAnalysisEvidence E) :
    EnergyReleaseRateAnalysisClosed E := by
  exact And.intro Ev.griffithCriterionClosed (And.intro Ev.criticalEnergyReleaseRateClosed (And.intro Ev.crackGrowthStabilityClosed Ev.fractureToughnessClosed))

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse