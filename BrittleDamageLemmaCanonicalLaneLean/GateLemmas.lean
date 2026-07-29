import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse