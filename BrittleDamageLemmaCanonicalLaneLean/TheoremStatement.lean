import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedStatement : String
  carriedRemainder : String

def brittleDamageTheoremStatement : TheoremStatement :=
  { sourceKey := "brittle-damage-lemma-canonical-lane"
    theoremName := "Brittle Damage Lemma"
    theoremObject := "Brittle damage admissible class closure"
    classicalBoundary := "unrestricted classical closure remains carried"
    constrainedStatement := "manifold-constrained theorem certificate for Brittle Damage Lemma"
    carriedRemainder := "classical source boundary carried by theoremBoundaryOpen and sourceTheoremBoundary"
  }

theorem theorem_statement_constrained_closure_holds (A : AdmissibleClass) :
    ConstrainedBrittleDamageClosure A := by
  exact constrained_brittle_damage_endgame A

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse