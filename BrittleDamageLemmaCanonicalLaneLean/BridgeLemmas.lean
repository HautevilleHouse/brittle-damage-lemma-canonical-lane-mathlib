import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BrittleDamageWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.propagationClosed A.object.damageWitness

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse