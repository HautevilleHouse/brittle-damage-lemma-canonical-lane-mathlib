import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.BrittleDamageClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : BrittleDamageAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BrittleDamageWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse