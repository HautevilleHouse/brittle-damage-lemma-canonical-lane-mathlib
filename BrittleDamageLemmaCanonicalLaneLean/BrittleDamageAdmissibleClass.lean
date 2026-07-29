import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.CrackPathEnergy
import HautevilleHouse.BrittleDamageLemmaCanonicalLaneLean.DamageEvolutionPDE

namespace HautevilleHouse
namespace BrittleDamageLemmaCanonicalLaneLean

structure BrittleDamageAdmissibleObject where
  crackPathEnergy : CrackPathEnergyPackage
  damageEvolution : DamageEvolutionPDEPackage
  crackPathEnergyEvidence : CrackPathEnergyEvidence crackPathEnergy
  damageEvolutionEvidence : DamageEvolutionPDEEvidence damageEvolution
  energyDamageCompat : Prop
  energyDamageCompatClosed : energyDamageCompat

def BrittleDamageAdmissibleClass (A : AdmissibleClass) : Prop :=
  CrackPathEnergyClosed A.crackPathEnergy ∧
  DamageEvolutionPDEClosed A.damageEvolution ∧
  A.energyDamageCompat

end BrittleDamageLemmaCanonicalLaneLean
end HautevilleHouse