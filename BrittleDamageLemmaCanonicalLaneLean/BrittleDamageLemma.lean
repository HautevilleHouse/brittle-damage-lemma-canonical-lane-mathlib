import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.DamageLocalization

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure BrittleDamageLemmaPackage {B : BrittleDamageAdmittedObject}
    {C : CrackGrowthCriteriaPackage B} {E : EnergyReleaseRatePackage C}
    (L : DamageLocalizationPackage E) where
  crackPropagationCriterion : Prop
  energyReleaseThreshold : Prop
  localizationZoneAdmissible : Prop
  damageProgressionClosed : Prop
  lemmaConclusion : Prop

structure BrittleDamageLemmaEvidence {B : BrittleDamageAdmittedObject}
    {C : CrackGrowthCriteriaPackage B} {E : EnergyReleaseRatePackage C}
    {L : DamageLocalizationPackage E} (Lemma : BrittleDamageLemmaPackage L) where
  crackPropagationCriterionClosed : Lemma.crackPropagationCriterion
  energyReleaseThresholdClosed : Lemma.energyReleaseThreshold
  localizationZoneAdmissibleClosed : Lemma.localizationZoneAdmissible
  damageProgressionClosedClosed : Lemma.damageProgressionClosed
  lemmaConclusionClosed : Lemma.lemmaConclusion

def BrittleDamageLemmaClosed {B : BrittleDamageAdmittedObject}
    {C : CrackGrowthCriteriaPackage B} {E : EnergyReleaseRatePackage C}
    {L : DamageLocalizationPackage E} (Lemma : BrittleDamageLemmaPackage L) : Prop :=
  Lemma.crackPropagationCriterion ∧ Lemma.energyReleaseThreshold ∧
  Lemma.localizationZoneAdmissible ∧ Lemma.damageProgressionClosed ∧ Lemma.lemmaConclusion

theorem brittle_damage_lemma_closed_from_evidence
    {B : BrittleDamageAdmittedObject} {C : CrackGrowthCriteriaPackage B}
    {E : EnergyReleaseRatePackage C} {L : DamageLocalizationPackage E}
    (Lemma : BrittleDamageLemmaPackage L) (Ev : BrittleDamageLemmaEvidence Lemma) :
    BrittleDamageLemmaClosed Lemma := by
  exact And.intro Ev.crackPropagationCriterionClosed
    (And.intro Ev.energyReleaseThresholdClosed
      (And.intro Ev.localizationZoneAdmissibleClosed
        (And.intro Ev.damageProgressionClosedClosed Ev.lemmaConclusionClosed)))

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse