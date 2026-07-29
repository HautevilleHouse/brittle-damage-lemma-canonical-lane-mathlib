import BrittleDamageLemmaCanonicalLaneLean.BrittleDamageLemmaEvidenceTerms

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure FractureMechanicsCertificate (F : FractureMechanicsPackage) where
  criticalStressIntensity : Prop
  crackPropagationCondition : Prop
  criticalStressIntensityClosed : criticalStressIntensity
  crackPropagationConditionClosed : crackPropagationCondition
  fractureEvidence : FractureMechanicsEvidence F

def FractureMechanicsCertificateClosed {F : FractureMechanicsPackage}
    (C : FractureMechanicsCertificate F) : Prop :=
  C.criticalStressIntensity ∧ C.crackPropagationCondition ∧ FractureMechanicsClosed F

theorem fracture_mechanics_certificate_closed {F : FractureMechanicsPackage}
    (C : FractureMechanicsCertificate F) : FractureMechanicsCertificateClosed C := by
  exact And.intro C.criticalStressIntensityClosed
    (And.intro C.crackPropagationConditionClosed
      (fracture_mechanics_closed_from_evidence F C.fractureEvidence))

structure DamageEvolutionCertificate {F : FractureMechanicsPackage}
    (D : DamageEvolutionPackage F) where
  evolutionLaw : Prop
  irreversibility : Prop
  stabilityCondition : Prop
  evolutionLawClosed : evolutionLaw
  irreversibilityClosed : irreversibility
  stabilityConditionClosed : stabilityCondition
  damageEvidence : DamageEvolutionEvidence D

def DamageEvolutionCertificateClosed {F : FractureMechanicsPackage}
    {D : DamageEvolutionPackage F} (C : DamageEvolutionCertificate D) : Prop :=
  C.evolutionLaw ∧ C.irreversibility ∧ C.stabilityCondition ∧ DamageEvolutionClosed D

theorem damage_evolution_certificate_closed {F : FractureMechanicsPackage}
    {D : DamageEvolutionPackage F} (C : DamageEvolutionCertificate D) :
    DamageEvolutionCertificateClosed C := by
  exact And.intro C.evolutionLawClosed
    (And.intro C.irreversibilityClosed
      (And.intro C.stabilityConditionClosed
        (damage_evolution_closed_from_evidence D C.damageEvidence)))

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse