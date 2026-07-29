import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

/-!
# Crack Tip Fields Package

This module defines the stress and strain fields near a crack tip in a brittle material.
-/

structure CrackTipFieldsPackage where
  stressField : Type u
  strainField : Type v
  stressIntensityFactor : Type w
  asymptoticExpansion : Prop
  pathIndependence : Prop

structure CrackTipFieldsEvidence (C : CrackTipFieldsPackage) where
  asymptoticExpansionClosed : C.asymptoticExpansion
  pathIndependenceClosed : C.pathIndependence

def CrackTipFieldsClosed (C : CrackTipFieldsPackage) : Prop :=
  C.asymptoticExpansion ∧ C.pathIndependence

theorem crack_tip_fields_closed_from_evidence (C : CrackTipFieldsPackage)
    (E : CrackTipFieldsEvidence C) : CrackTipFieldsClosed C := by
  exact And.intro E.asymptoticExpansionClosed E.pathIndependenceClosed

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse