import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure EnergyReleaseRatePackage where
  crackSurface : Type u
  energyFunctional : Type v
  releaseRate : Prop
  pathIndependence : Prop
  criticalValue : Prop

structure EnergyReleaseRateEvidence (E : EnergyReleaseRatePackage) where
  releaseRateClosed : E.releaseRate
  pathIndependenceClosed : E.pathIndependence
  criticalValueClosed : E.criticalValue

def EnergyReleaseRateClosed (E : EnergyReleaseRatePackage) : Prop :=
  E.releaseRate ∧ E.pathIndependence ∧ E.criticalValue

theorem energy_release_rate_closed_from_evidence
    (E : EnergyReleaseRatePackage) (Ev : EnergyReleaseRateEvidence E) :
    EnergyReleaseRateClosed E := by
  exact And.intro Ev.releaseRateClosed
    (And.intro Ev.pathIndependenceClosed Ev.criticalValueClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse