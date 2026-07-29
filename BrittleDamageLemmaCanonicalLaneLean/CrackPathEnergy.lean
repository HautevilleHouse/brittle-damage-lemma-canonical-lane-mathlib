import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure CrackPathEnergyPackage where
  energyReleaseRate : Prop
  pathIntegral : Prop
  crackLength : Prop
  energyConservation : Prop

structure CrackPathEnergyEvidence (C : CrackPathEnergyPackage) where
  energyReleaseRateClosed : C.energyReleaseRate
  pathIntegralClosed : C.pathIntegral
  crackLengthClosed : C.crackLength
  energyConservationClosed : C.energyConservation

def CrackPathEnergyClosed (C : CrackPathEnergyPackage) : Prop :=
  C.energyReleaseRate ∧ C.pathIntegral ∧ C.crackLength ∧ C.energyConservation

theorem crack_path_energy_closed_from_evidence (C : CrackPathEnergyPackage)
    (E : CrackPathEnergyEvidence C) : CrackPathEnergyClosed C := by
  exact And.intro E.energyReleaseRateClosed
    (And.intro E.pathIntegralClosed
      (And.intro E.crackLengthClosed E.energyConservationClosed))

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse