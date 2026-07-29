import BrittleDamageLemmaCanonicalLaneLean.DamageEvolution

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure FractureMechanicsEvidenceTerms {F : FractureMechanicsPackage}
    (C : FractureMechanicsCertificate F) where
  criticalStressIntensityClosed : C.criticalStressIntensity
  crackPropagationConditionClosed : C.crackPropagationCondition
  fractureClosed : FractureMechanicsClosed F

def FractureMechanicsCertificate.evidenceTerms {F : FractureMechanicsPackage}
    (C : FractureMechanicsCertificate F) : FractureMechanicsEvidenceTerms C :=
  { criticalStressIntensityClosed := C.criticalStressIntensityClosed
    crackPropagationConditionClosed := C.crackPropagationConditionClosed
    fractureClosed := fracture_mechanics_closed_from_evidence F C.fractureEvidence
  }

structure DamageEvolutionEvidenceTerms {F : FractureMechanicsPackage}
    {D : DamageEvolutionPackage F} (C : DamageEvolutionCertificate D) where
  evolutionLawClosed : C.evolutionLaw
  irreversibilityClosed : C.irreversibility
  stabilityConditionClosed : C.stabilityCondition
  damageClosed : DamageEvolutionClosed D

def DamageEvolutionCertificate.evidenceTerms {F : FractureMechanicsPackage}
    {D : DamageEvolutionPackage F} (C : DamageEvolutionCertificate D) :
    DamageEvolutionEvidenceTerms C :=
  { evolutionLawClosed := C.evolutionLawClosed
    irreversibilityClosed := C.irreversibilityClosed
    stabilityConditionClosed := C.stabilityConditionClosed
    damageClosed := damage_evolution_closed_from_evidence D C.damageEvidence
  }

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse