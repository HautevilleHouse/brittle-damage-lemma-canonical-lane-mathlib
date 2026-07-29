import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure BrittleDamageObject where
  material : Type
  crackSet : Type
  stressField : Type
  toughnessBound : Prop
  crackPropagationCriterion : Prop
  damageThreshold : Prop
  conclusion : crackPropagationCriterion → damageThreshold

structure BrittleDamageAdmittedObject where
  object : BrittleDamageObject
  initialToughness : object.toughnessBound
  propagationClosed : object.crackPropagationCriterion
  damageWitness : object.damageThreshold

def BrittleDamageWitnessClosed (O : BrittleDamageAdmittedObject) : Prop :=
  O.propagationClosed ∧ O.damageWitness

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse