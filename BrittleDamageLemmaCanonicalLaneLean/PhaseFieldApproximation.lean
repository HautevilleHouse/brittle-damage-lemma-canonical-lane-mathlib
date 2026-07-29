import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.BrittleFractureModel

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure PhaseFieldApproximationPackage {M : BrittleFractureModel} where
  regularizedCrackSurface : Prop
  lengthScaleParameter : Prop
  degradationFunction : Prop
  GammaConvergence : Prop

structure PhaseFieldApproximationEvidence {M : BrittleFractureModel} (P : PhaseFieldApproximationPackage M) where
  regularizedCrackSurfaceClosed : P.regularizedCrackSurface
  lengthScaleParameterClosed : P.lengthScaleParameter
  degradationFunctionClosed : P.degradationFunction
  GammaConvergenceClosed : P.GammaConvergence

def PhaseFieldApproximationClosed {M : BrittleFractureModel} (P : PhaseFieldApproximationPackage M) : Prop :=
  P.regularizedCrackSurface ∧ P.lengthScaleParameter ∧ P.degradationFunction ∧ P.GammaConvergence

theorem phase_field_approximation_closed_from_evidence {M : BrittleFractureModel} (P : PhaseFieldApproximationPackage M) (E : PhaseFieldApproximationEvidence P) :
    PhaseFieldApproximationClosed P := by
  exact And.intro E.regularizedCrackSurfaceClosed (And.intro E.lengthScaleParameterClosed (And.intro E.degradationFunctionClosed E.GammaConvergenceClosed))

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse