import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.CrackGrowthCriteria

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure EnergyReleaseRatePackage {B : BrittleDamageAdmittedObject}
    (C : CrackGrowthCriteriaPackage B) where
  potentialEnergy : Type
  crackArea : Type
  energyReleaseRate : Type
  fractureEnergy : Type
  energyBalance : Prop
  rateServesAsDrivingForce : Prop

structure EnergyReleaseRateEvidence {B : BrittleDamageAdmittedObject}
    {C : CrackGrowthCriteriaPackage B} (E : EnergyReleaseRatePackage C) where
  energyBalanceClosed : E.energyBalance
  rateServesAsDrivingForceClosed : E.rateServesAsDrivingForce

def EnergyReleaseRateClosed {B : BrittleDamageAdmittedObject}
    {C : CrackGrowthCriteriaPackage B} (E : EnergyReleaseRatePackage C) : Prop :=
  E.energyBalance ∧ E.rateServesAsDrivingForce

theorem energy_release_rate_closed_from_evidence
    {B : BrittleDamageAdmittedObject} {C : CrackGrowthCriteriaPackage B}
    (E : EnergyReleaseRatePackage C) (Ev : EnergyReleaseRateEvidence E) :
    EnergyReleaseRateClosed E := by
  exact And.intro Ev.energyBalanceClosed Ev.rateServesAsDrivingForceClosed

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse