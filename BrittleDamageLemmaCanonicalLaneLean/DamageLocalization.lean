import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.EnergyReleaseRate

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure DamageLocalizationPackage {B : BrittleDamageAdmittedObject}
    {C : CrackGrowthCriteriaPackage B} {E : EnergyReleaseRatePackage C} where
  localizationZone : Type
  damageField : Type
  strainField : Type
  zoneFormationCondition : Prop
  damageStrainCoupling : Prop
  zoneSizeBound : Prop

structure DamageLocalizationEvidence {B : BrittleDamageAdmittedObject}
    {C : CrackGrowthCriteriaPackage B} {E : EnergyReleaseRatePackage C}
    (L : DamageLocalizationPackage E) where
  zoneFormationConditionClosed : L.zoneFormationCondition
  damageStrainCouplingClosed : L.damageStrainCoupling
  zoneSizeBoundClosed : L.zoneSizeBound

def DamageLocalizationClosed {B : BrittleDamageAdmittedObject}
    {C : CrackGrowthCriteriaPackage B} {E : EnergyReleaseRatePackage C}
    (L : DamageLocalizationPackage E) : Prop :=
  L.zoneFormationCondition ∧ L.damageStrainCoupling ∧ L.zoneSizeBound

theorem damage_localization_closed_from_evidence
    {B : BrittleDamageAdmittedObject} {C : CrackGrowthCriteriaPackage B}
    {E : EnergyReleaseRatePackage C} (L : DamageLocalizationPackage E)
    (Ev : DamageLocalizationEvidence L) : DamageLocalizationClosed L := by
  exact And.intro Ev.zoneFormationConditionClosed
    (And.intro Ev.damageStrainCouplingClosed Ev.zoneSizeBoundClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse