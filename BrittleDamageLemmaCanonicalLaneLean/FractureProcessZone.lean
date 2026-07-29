import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure FractureProcessZone where
  crackTip : Type
  cohesiveTractionDistribution : Type
  damageParameter : Prop
  inelasticDeformation : Prop
  monotonicDamageEvolution : Prop
  monotonicDamageEvolutionTerm : monotonicDamageEvolution

structure FractureProcessZoneEvidence (F : FractureProcessZone) where
  damageParameterClosed : F.damageParameter
  inelasticDeformationClosed : F.inelasticDeformation
  monotonicDamageEvolutionClosed : F.monotonicDamageEvolution

def FractureProcessZoneClosed (F : FractureProcessZone) : Prop :=
  F.damageParameter ∧ F.inelasticDeformation ∧ F.monotonicDamageEvolution

theorem fracture_process_zone_closed_from_evidence (F : FractureProcessZone)
    (E : FractureProcessZoneEvidence F) : FractureProcessZoneClosed F := by
  exact And.intro E.damageParameterClosed
    (And.intro E.inelasticDeformationClosed E.monotonicDamageEvolutionClosed)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse