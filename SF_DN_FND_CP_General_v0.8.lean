/-!
Structural Flow — Constitutional Physiology
Domain-general conditional foundation (FND.CP.GENERAL)

Requires the Structural Flow Universal Kernel. This file supplies an
independent civic Density interface (Tier D), a stronger conditional
Recognition/Coherence interface (Tier C), a whole-owned parent-ground port,
and separate realization-conformance contracts.

The formal results are conditional on supplied domain warrants. The evidence
records support review and traceability; Lean does not authenticate public
records, legal interpretations, or the health of any constitutional system.
-/

namespace StructuralFlow
namespace CPGeneral

universe u

/- Stable domain-entry claim categories; claims require separately submitted evidence. -/
inductive EntryClaim where
  | constitutionalDomain
  | constitutionalBurden
  | personBearer
  | publicPower
  | personPowerBoundary
  | distinctFunctionalJobs
  | jointCoordinationInterface
  deriving DecidableEq, Repr

inductive DensityClaim where
  | memberOriginAndIncorporation
  | memberIdentityAndCarrier
  | individualStandingSupport
  | differentialCommonSupport
  | fixedMemberScopeAndLoss
  deriving DecidableEq, Repr

inductive EvidenceKind where
  | publicRecord
  | legalAuthority
  | reportedObservation
  | attributedInterpretation
  | formalConsequence
  deriving DecidableEq, Repr

structure ScopeIndex where
  authority : String
  wholeID : String
  levelID : String
  scopeID : String
  burdenID : String
  interactionUniverseID : String
  authorityPresent : authority ≠ ""
  wholePresent : wholeID ≠ ""
  levelPresent : levelID ≠ ""
  scopePresent : scopeID ≠ ""
  burdenPresent : burdenID ≠ ""
  universePresent : interactionUniverseID ≠ ""

structure Attestation where
  index : ScopeIndex
  kind : EvidenceKind
  source : String
  locator : String
  interpretation : String
  assessor : String
  limitations : String
  status : UniversalTranslationContract.Disposition
  sourcePresent : source ≠ ""
  locatorPresent : locator ≠ ""
  interpretationPresent : interpretation ≠ ""
  assessorPresent : assessor ≠ ""

structure Reviewed (index : ScopeIndex) (Category : Type) where
  evidence : Category → Attestation
  pinned : ∀ c, (evidence c).index = index
  accepted : ∀ c, (evidence c).status = .discharged

/- A CP architectural seat: constitutional boundary, differentiated civic jobs,
   and a shared-burden coordination relation; present success is not presumed. -/
structure Architecture where
  Domain : Type u
  Level : Type u
  Scope : Type u
  Person : Type u
  PublicPower : Type u
  Burden : Type u
  CivicFunction : Type u
  CoordinationInterface : Type u
  Condition : Type u
  RoleState : Type u

  index : ScopeIndex
  domain : Domain
  level : Level
  scope : Scope
  declaredBurden : Burden
  bearer : Person
  publicPower : PublicPower

  bearerPowerConstraint : Person → PublicPower → Burden → Prop
  bearerBoundaryRelevant :
    bearerPowerConstraint bearer publicPower declaredBurden

  functionRelevant : CivicFunction → Burden → Prop
  firstJob : CivicFunction
  secondJob : CivicFunction
  differentJobs : firstJob ≠ secondJob
  firstJobRelevant : functionRelevant firstJob declaredBurden
  secondJobRelevant : functionRelevant secondJob declaredBurden

  interface : CoordinationInterface
  participates : CoordinationInterface → CivicFunction → Prop
  firstParticipates : participates interface firstJob
  secondParticipates : participates interface secondJob
  condition : Condition
  jointlyConstitutional : CoordinationInterface → Burden → Condition → Prop
  jointJobRelevant : jointlyConstitutional interface declaredBurden condition

  jointPermitted : CoordinationInterface → (CivicFunction → RoleState) → Prop
  jointEffect : CoordinationInterface → (CivicFunction → RoleState) → Condition → Prop
  meaningfulJointWitness :
    (∃ x y : CivicFunction → RoleState,
      jointPermitted interface x ∧ ¬ jointPermitted interface y) ∨
    (∃ x y : CivicFunction → RoleState,
      jointEffect interface x condition ∧ ¬ jointEffect interface y condition)

  reviewed : Reviewed index EntryClaim
  boundarySourceNotMachine :
    (reviewed.evidence .personPowerBoundary).kind ≠ .formalConsequence
  coordinationSourceNotMachine :
    (reviewed.evidence .jointCoordinationInterface).kind ≠ .formalConsequence

/- Domain-side incorporated civic consequences, carriers, and standing public
   interactions; persons and offices are not Density members by their names. -/
structure CivicDensity (a : Architecture.{u}) where
  Case : Type u
  Consequence : Type u
  PublicInteraction : Type u
  Carrier : Type u

  relevant : Case → Consequence → Prop
  incorporated : Case → Consequence → Prop
  discriminatedMember : Case → Consequence → Prop
  fixedInteraction : PublicInteraction → Prop
  established : Case → Consequence → PublicInteraction → Prop
  carries : Case → Consequence → PublicInteraction → Prop
  discriminates : Case → Consequence → PublicInteraction → Prop
  carryRequiresEstablished : ∀ x c i,
    carries x c i → established x c i
  discriminateRequiresCarry : ∀ x c i,
    discriminates x c i → carries x c i
  jointDistinction : Case → PublicInteraction → Prop
  differentialConditioning :
    Case → Consequence → Consequence → PublicInteraction → Prop

  carrierOf : Consequence → Carrier
  originAdmitted : Case → Consequence → Prop
  persisted : Case → Consequence → Prop
  bounded : Case → Consequence → Prop
  inheritedInDistinctInteraction : Case → Consequence → Prop
  incorporatedOnCarrier : Case → Consequence → Carrier → Prop
  incorporatedHasRoute : ∀ x c,
    relevant x c → incorporated x c →
    originAdmitted x c ∧ persisted x c ∧ bounded x c ∧
    inheritedInDistinctInteraction x c ∧
    incorporatedOnCarrier x c (carrierOf c)

  localNeighbor : UniversalDensity.DensityNeighbor Case → Case → Prop
  localHeld : Case → Prop
  localFails : Case → Prop

/- The CP interaction universe is fixed across compared cases. -/
def densityWorld {a : Architecture.{u}} (d : CivicDensity a) :
    UniversalDensity.World d.Case d.Consequence d.PublicInteraction where
  relevant := d.relevant
  incorporated := d.incorporated
  memberDistinguished := d.discriminatedMember
  interactionInScope := fun _ i => d.fixedInteraction i
  established := d.established
  carries := d.carries
  discriminates := d.discriminates
  carry_requires_establishment := d.carryRequiresEstablished
  discrimination_requires_carry := d.discriminateRequiresCarry
  jointDistinction := d.jointDistinction
  differentiallyConditions := d.differentialConditioning

/- Independently invocable Density certificate with held/failure preservation. -/
structure TierD (a : Architecture.{u}) where
  civic : CivicDensity a
  nonVacuous : UniversalDensity.NonVacuous (densityWorld civic)
  loss : UniversalDensity.DensityLossPassageEvidence (densityWorld civic)
  sameMemberCarrier : ∀ c,
    civic.relevant loss.before c ↔ civic.relevant loss.after c
  localNeighborsPreserved : ∀ x n,
    civic.localNeighbor n x ↔
    UniversalDensity.densityNeighborHolds (densityWorld civic) n x
  localHeldPreserved : ∀ x,
    civic.localHeld x ↔ UniversalDensity.DensityHeld (densityWorld civic) x
  localFailsPreserved : ∀ x,
    civic.localFails x ↔ UniversalDensity.DensityFails (densityWorld civic) x

  memberEvidence : Reviewed a.index DensityClaim
  memberRouteNotOnlyMachine :
    (memberEvidence.evidence .memberOriginAndIncorporation).kind ≠ .formalConsequence
  commonSupportNotOnlyMachine :
    (memberEvidence.evidence .differentialCommonSupport).kind ≠ .formalConsequence

def densityRealization {a : Architecture.{u}} (d : TierD a) :
    DensityTranslation.DensityStructuralRealization
      a.Domain d.civic.Case d.civic.Consequence d.civic.PublicInteraction
      a.Level a.Scope where
  domain := a.domain
  level := a.level
  scope := a.scope
  thickness := .minimum
  profile := {
    neighborHolds := d.civic.localNeighbor
    held := d.civic.localHeld
    fails := d.civic.localFails
  }
  projectedWorld := densityWorld d.civic
  nonVacuous := d.nonVacuous
  lossPassage := d.loss
  neighborPreservation := d.localNeighborsPreserved
  heldPreservation := d.localHeldPreserved
  failurePreservation := d.localFailsPreserved

theorem projectedHeld {a : Architecture.{u}} (d : TierD a) :
    UniversalDensity.DensityHeld (densityWorld d.civic) d.loss.before :=
  d.loss.beforeHeld

theorem projectedFails {a : Architecture.{u}} (d : TierD a) :
    UniversalDensity.DensityFails (densityWorld d.civic) d.loss.after :=
  d.loss.afterFails

theorem localHeldAtBefore {a : Architecture.{u}} (d : TierD a) :
    d.civic.localHeld d.loss.before :=
  (d.localHeldPreserved d.loss.before).2 d.loss.beforeHeld

theorem localFailsAtAfter {a : Architecture.{u}} (d : TierD a) :
    d.civic.localFails d.loss.after :=
  (d.localFailsPreserved d.loss.after).2 d.loss.afterFails

theorem memberIdentityAcrossLoss {a : Architecture.{u}} (d : TierD a)
    (c : d.civic.Consequence) :
    d.civic.relevant d.loss.before c ↔ d.civic.relevant d.loss.after c :=
  d.sameMemberCarrier c

theorem fixedInteractionUniverse {a : Architecture.{u}} (d : TierD a)
    (i : d.civic.PublicInteraction) :
    (densityWorld d.civic).interactionInScope d.loss.before i ↔
    (densityWorld d.civic).interactionInScope d.loss.after i := by
  rfl

theorem exactProjection {a : Architecture.{u}} (d : TierD a) :
    (densityRealization d).projectedWorld = densityWorld d.civic :=
  rfl

end CPGeneral
end StructuralFlow

namespace StructuralFlow
namespace CPGeneral

universe u

inductive TierCClaim where
  | authorizedBindingSource
  | lawfulRecognitionVariation
  | recognitionTransportLineage
  | differentiatedRecognizedRoles
  | relevantMutualCompatibility
  | sharedConstitutionalInvariant
  | constitutionalWholeOwnership
  | globalJointFit
  | wholeHeldCapacity
  | selectiveRecognitionLoss
  | selectiveWholeLoss
  | wholeSeatIdentity
  | recognizedPiecesAtSeat
  | civicFieldWholeGround
  deriving DecidableEq, Repr

/- Conditional Recognition and Coherence using the exact inherited Tier D.
   Its seat and civic-field anchors are independently warranted. -/
structure TierC (a : Architecture.{u}) where

  inheritedDensity : TierD a

  State : Type u
  Piece : Type u
  Binding : Type u
  Presentation : Type u
  Whole : Type u
  Invariant : Type u

  leftRecognition : Recognition.World State Piece Binding Presentation
  rightRecognition : Recognition.World State Piece Binding Presentation
  lostRecognition : Recognition.World State Piece Binding Presentation

  leftUpstream : Recognition.UpstreamReady leftRecognition
  rightUpstream : Recognition.UpstreamReady rightRecognition
  leftRecognizes : Recognition.Recognizes leftRecognition
  rightRecognizes : Recognition.Recognizes rightRecognition

  lostUpstream : Recognition.UpstreamReady lostRecognition
  lostNotRecognized : ¬ Recognition.Recognizes lostRecognition
  lossSourcePinned : lostRecognition.content = leftRecognition.content
  lossOriginPinned : lostRecognition.origin = leftRecognition.origin
  lossTargetPinned : lostRecognition.target = leftRecognition.target
  lossAuthorizationPinned : lostRecognition.post = leftRecognition.post

  wholeView : Coherence.World Piece Whole Invariant

  wholeAtSeat : Whole → ScopeIndex → Prop
  wholePinnedToSeat : wholeAtSeat wholeView.candidateWhole a.index
  pieceAtSeat : Piece → ScopeIndex → Prop
  leftPiecePinned : pieceAtSeat wholeView.local₁ a.index
  rightPiecePinned : pieceAtSeat wholeView.local₂ a.index

  fieldCarrierGroundsWhole : inheritedDensity.civic.Carrier → Whole → Prop
  fieldAnchor : inheritedDensity.civic.Consequence
  fieldAnchorRelevant :
    inheritedDensity.civic.relevant inheritedDensity.loss.before fieldAnchor
  fieldAnchorIncorporated :
    inheritedDensity.civic.incorporated inheritedDensity.loss.before fieldAnchor
  fieldAnchorsWhole :
    fieldCarrierGroundsWhole (inheritedDensity.civic.carrierOf fieldAnchor)
      wholeView.candidateWhole
  leftTargetPinned : leftRecognition.target = wholeView.local₁
  rightTargetPinned : rightRecognition.target = wholeView.local₂
  leftFromActualRecognition :
    wholeView.recognized wholeView.local₁ ↔
      Recognition.Recognizes leftRecognition
  rightFromActualRecognition :
    wholeView.recognized wholeView.local₂ ↔
      Recognition.Recognizes rightRecognition
  piecesDiffer : wholeView.local₁ ≠ wholeView.local₂
  mutuallyCompatible :
    wholeView.compatible wholeView.local₁ wholeView.local₂ ∧
    wholeView.compatible wholeView.local₂ wholeView.local₁

  declaredInvariant : Invariant
  leftCarriesInvariant :
    wholeView.carriesInvariant wholeView.local₁ declaredInvariant
  rightCarriesInvariant :
    wholeView.carriesInvariant wholeView.local₂ declaredInvariant
  invariantOwnedByWhole :
    wholeView.wholeOwnsInvariant wholeView.candidateWhole declaredInvariant
  fitsLeft : wholeView.fits wholeView.candidateWhole wholeView.local₁
  fitsRight : wholeView.fits wholeView.candidateWhole wholeView.local₂
  heldAsWhole : wholeView.heldAsOne wholeView.candidateWhole

  lossView : Coherence.World Piece Whole Invariant
  lossSameLeft : lossView.local₁ = wholeView.local₁
  lossSameRight : lossView.local₂ = wholeView.local₂
  lossSameWhole : lossView.candidateWhole = wholeView.candidateWhole
  lossSameRecognition : lossView.recognized = wholeView.recognized
  lossSameCompatibility : lossView.compatible = wholeView.compatible
  lossSameOwnership :
    lossView.wholeOwnsInvariant = wholeView.wholeOwnsInvariant
  lossRecognizedCompatible : Coherence.RecognizedCompatible lossView
  lossNotCoherent : ¬ Coherence.Coheres lossView

  reviewedTierC : Reviewed a.index TierCClaim
  bindingNotOnlyFormal :
    (reviewedTierC.evidence .authorizedBindingSource).kind ≠ .formalConsequence
  invariantNotOnlyFormal :
    (reviewedTierC.evidence .sharedConstitutionalInvariant).kind ≠ .formalConsequence
  wholeNotOnlyFormal :
    (reviewedTierC.evidence .constitutionalWholeOwnership).kind ≠ .formalConsequence
  seatNotOnlyFormal :
    (reviewedTierC.evidence .wholeSeatIdentity).kind ≠ .formalConsequence
  piecesNotOnlyFormal :
    (reviewedTierC.evidence .recognizedPiecesAtSeat).kind ≠ .formalConsequence
  fieldGroundNotOnlyFormal :
    (reviewedTierC.evidence .civicFieldWholeGround).kind ≠ .formalConsequence

theorem tierC_fieldAnchorHasRoute {a : Architecture.{u}} (c : TierC a) :
    c.inheritedDensity.civic.originAdmitted c.inheritedDensity.loss.before c.fieldAnchor ∧
    c.inheritedDensity.civic.persisted c.inheritedDensity.loss.before c.fieldAnchor ∧
    c.inheritedDensity.civic.bounded c.inheritedDensity.loss.before c.fieldAnchor ∧
    c.inheritedDensity.civic.inheritedInDistinctInteraction
      c.inheritedDensity.loss.before c.fieldAnchor ∧
    c.inheritedDensity.civic.incorporatedOnCarrier
      c.inheritedDensity.loss.before c.fieldAnchor
      (c.inheritedDensity.civic.carrierOf c.fieldAnchor) :=
  c.inheritedDensity.civic.incorporatedHasRoute
    c.inheritedDensity.loss.before c.fieldAnchor
    c.fieldAnchorRelevant c.fieldAnchorIncorporated

def tierCtoD {a : Architecture.{u}} (c : TierC a) : TierD a :=
  c.inheritedDensity

theorem tierC_exact_TierD {a : Architecture.{u}} (c : TierC a) :
    tierCtoD c = c.inheritedDensity := by
  rfl

theorem tierC_left_recognized {a : Architecture.{u}} (c : TierC a) :
    c.wholeView.recognized c.wholeView.local₁ :=
  c.leftFromActualRecognition.mpr c.leftRecognizes

theorem tierC_right_recognized {a : Architecture.{u}} (c : TierC a) :
    c.wholeView.recognized c.wholeView.local₂ :=
  c.rightFromActualRecognition.mpr c.rightRecognizes

theorem tierC_recognized_compatible {a : Architecture.{u}} (c : TierC a) :
    Coherence.RecognizedCompatible c.wholeView := by
  exact ⟨c.piecesDiffer,
    tierC_left_recognized c, tierC_right_recognized c,
    c.mutuallyCompatible.1, c.mutuallyCompatible.2⟩

theorem tierC_shared_invariant {a : Architecture.{u}} (c : TierC a) :
    Coherence.SharedInvariant c.wholeView := by
  exact ⟨c.declaredInvariant, c.leftCarriesInvariant,
    c.rightCarriesInvariant, c.invariantOwnedByWhole⟩

theorem tierC_coheres {a : Architecture.{u}} (c : TierC a) :
    Coherence.Coheres c.wholeView := by
  exact ⟨c.heldAsWhole, ⟨c.fitsLeft, c.fitsRight⟩,
    tierC_shared_invariant c⟩

theorem tierC_joint_endpoint {a : Architecture.{u}} (c : TierC a) :
    Coherence.JointWholeHoldEndpoint c.wholeView :=
  Coherence.recognized_coherence_reaches_endpoint
    (tierC_recognized_compatible c) (tierC_coheres c)

theorem tierC_recognition_selective_loss {a : Architecture.{u}} (c : TierC a) :
    Recognition.UpstreamReady c.lostRecognition ∧
      ¬ Recognition.Recognizes c.lostRecognition :=
  ⟨c.lostUpstream, c.lostNotRecognized⟩

theorem tierC_whole_selective_loss {a : Architecture.{u}} (c : TierC a) :
    Coherence.RecognizedCompatible c.lossView ∧
      ¬ Coherence.Coheres c.lossView :=
  ⟨c.lossRecognizedCompatible, c.lossNotCoherent⟩

def tierC_densityRealization {a : Architecture.{u}} (c : TierC a) :
    DensityTranslation.DensityStructuralRealization
      a.Domain c.inheritedDensity.civic.Case
      c.inheritedDensity.civic.Consequence
      c.inheritedDensity.civic.PublicInteraction a.Level a.Scope :=
  densityRealization c.inheritedDensity

end CPGeneral
end StructuralFlow

namespace StructuralFlow
namespace CPGeneral

universe u

inductive ParentClaim where
  | offeredGroundSource
  | constitutionalWholeIdentity
  | wholeGroundOwnership
  | groundScopeAndBurden
  | groundUsableAsInherited
  deriving DecidableEq, Repr

inductive RealClaim where
  | realSeatIdentity
  | constitutionalDomainBasis
  | bearerPowerGround
  | consequenceIncorporation
  | retainedCarrierIdentity
  | publicInteractionSupport
  | differentiatedCoordination
  | bindingContentRecognition
  | wholeInvariantAndFit
  | selectiveHeldAndFailure
  deriving DecidableEq, Repr

/- A scoped, inhabited, whole-owned offer; no descendant is asserted. -/
structure ParentGroundPort (a : Architecture.{u}) (c : TierC a) where
  Ground : Type u
  offered : Ground
  ownedBy : c.Whole → Ground → Prop
  offeredOwned : ownedBy c.wholeView.candidateWhole offered
  belongsToSeat : c.Whole → ScopeIndex → Prop
  wholePinned : belongsToSeat c.wholeView.candidateWhole a.index
  inDeclaredScope : Ground → ScopeIndex → Prop
  groundPinned : inDeclaredScope offered a.index
  availableToDescendant : Ground → Prop
  offeredAvailable : availableToDescendant offered
  reviewedParent : Reviewed a.index ParentClaim
  sourceIsNotFormalOnly :
    (reviewedParent.evidence .offeredGroundSource).kind ≠ .formalConsequence
  ownershipIsNotFormalOnly :
    (reviewedParent.evidence .wholeGroundOwnership).kind ≠ .formalConsequence

def attachOwnedParentGround {a : Architecture.{u}} (c : TierC a)
    (Ground : Type u) (item : Ground)
    (ownedBy : c.Whole → Ground → Prop)
    (hOwned : ownedBy c.wholeView.candidateWhole item)
    (belongsToSeat : c.Whole → ScopeIndex → Prop)
    (hWhole : belongsToSeat c.wholeView.candidateWhole a.index)
    (inDeclaredScope : Ground → ScopeIndex → Prop)
    (hScope : inDeclaredScope item a.index)
    (availableToDescendant : Ground → Prop)
    (hAvailable : availableToDescendant item)
    (reviewed : Reviewed a.index ParentClaim)
    (hSource : (reviewed.evidence .offeredGroundSource).kind ≠ .formalConsequence)
    (hOwnership : (reviewed.evidence .wholeGroundOwnership).kind ≠ .formalConsequence) :
    ParentGroundPort a c where
  Ground := Ground
  offered := item
  ownedBy := ownedBy
  offeredOwned := hOwned
  belongsToSeat := belongsToSeat
  wholePinned := hWhole
  inDeclaredScope := inDeclaredScope
  groundPinned := hScope
  availableToDescendant := availableToDescendant
  offeredAvailable := hAvailable
  reviewedParent := reviewed
  sourceIsNotFormalOnly := hSource
  ownershipIsNotFormalOnly := hOwnership

theorem parentPort_hasGround {a : Architecture.{u}} {c : TierC a}
    (p : ParentGroundPort a c) : Nonempty p.Ground :=
  ⟨p.offered⟩

theorem parentPort_owned {a : Architecture.{u}} {c : TierC a}
    (p : ParentGroundPort a c) :
    p.ownedBy c.wholeView.candidateWhole p.offered :=
  p.offeredOwned

theorem parentPort_fromCoherence {a : Architecture.{u}} {c : TierC a}
    (_p : ParentGroundPort a c) :
    Coherence.JointWholeHoldEndpoint c.wholeView :=
  tierC_joint_endpoint c

/- REAL profile data; compiling this profile does not establish conformance. -/
structure RealDProfile (a : Architecture.{u}) (d : TierD a) where
  index : ScopeIndex
  domain : a.Domain
  level : a.Level
  scope : a.Scope
  burden : a.Burden
  bearer : a.Person
  publicPower : a.PublicPower
  memberCarrier : d.civic.Consequence → d.civic.Carrier
  relevant : d.civic.Case → d.civic.Consequence → Prop
  incorporated : d.civic.Case → d.civic.Consequence → Prop
  distinguished : d.civic.Case → d.civic.Consequence → Prop
  interactionInScope : d.civic.PublicInteraction → Prop
  established : d.civic.Case → d.civic.Consequence → d.civic.PublicInteraction → Prop
  carries : d.civic.Case → d.civic.Consequence → d.civic.PublicInteraction → Prop
  discriminates : d.civic.Case → d.civic.Consequence → d.civic.PublicInteraction → Prop
  jointDistinction : d.civic.Case → d.civic.PublicInteraction → Prop
  differentialConditioning :
    d.civic.Case → d.civic.Consequence → d.civic.Consequence → d.civic.PublicInteraction → Prop
  held : d.civic.Case → Prop
  fails : d.civic.Case → Prop
  reviewedReal : Reviewed index RealClaim

/- Explicit evidence, identity and role-preservation obligations for Tier D. -/
structure RealConformsD (a : Architecture.{u}) (d : TierD a)
    (r : RealDProfile a d) where
  indexPinned : r.index = a.index
  domainPinned : r.domain = a.domain
  levelPinned : r.level = a.level
  scopePinned : r.scope = a.scope
  burdenPinned : r.burden = a.declaredBurden
  bearerPinned : r.bearer = a.bearer
  publicPowerPinned : r.publicPower = a.publicPower
  carrierPinned : ∀ m, r.memberCarrier m = d.civic.carrierOf m
  relevantPreserved : ∀ x m, r.relevant x m ↔ d.civic.relevant x m
  incorporationPreserved : ∀ x m, r.incorporated x m ↔ d.civic.incorporated x m
  memberDistinctionPreserved : ∀ x m, r.distinguished x m ↔ d.civic.discriminatedMember x m
  interactionUniversePreserved : ∀ i,
    r.interactionInScope i ↔ d.civic.fixedInteraction i
  establishmentPreserved : ∀ x m i,
    r.established x m i ↔ d.civic.established x m i
  carriagePreserved : ∀ x m i,
    r.carries x m i ↔ d.civic.carries x m i
  discriminationPreserved : ∀ x m i,
    r.discriminates x m i ↔ d.civic.discriminates x m i
  jointDistinctionPreserved : ∀ x i,
    r.jointDistinction x i ↔ d.civic.jointDistinction x i
  differentialPreserved : ∀ x m n i,
    r.differentialConditioning x m n i ↔
      d.civic.differentialConditioning x m n i
  heldPreserved : ∀ x, r.held x ↔ d.civic.localHeld x
  failurePreserved : ∀ x, r.fails x ↔ d.civic.localFails x
  sourceNotOnlyFormal :
    (r.reviewedReal.evidence .constitutionalDomainBasis).kind ≠ .formalConsequence
  incorporationNotOnlyFormal :
    (r.reviewedReal.evidence .consequenceIncorporation).kind ≠ .formalConsequence

theorem conformingRealD_held {a : Architecture.{u}} {d : TierD a}
    {r : RealDProfile a d} (h : RealConformsD a d r) :
    r.held d.loss.before :=
  (h.heldPreserved d.loss.before).2 (localHeldAtBefore d)

theorem conformingRealD_fails {a : Architecture.{u}} {d : TierD a}
    {r : RealDProfile a d} (h : RealConformsD a d r) :
    r.fails d.loss.after :=
  (h.failurePreserved d.loss.after).2 (localFailsAtAfter d)

/- Stronger REAL profile retaining the exact inherited Tier D. -/
structure RealCProfile (a : Architecture.{u}) (c : TierC a) where
  density : RealDProfile a c.inheritedDensity
  recognizedLeft : Prop
  recognizedRight : Prop
  globalFit : Prop
  sharedInvariant : Prop
  wholeHeld : Prop
  wholeSelectiveLoss : Prop
  reviewedRealC : Reviewed density.index RealClaim

structure RealConformsC (a : Architecture.{u}) (c : TierC a)
    (r : RealCProfile a c) where
  exactDensityConformance : RealConformsD a c.inheritedDensity r.density
  leftRecognitionPreserved :
    r.recognizedLeft ↔ Recognition.Recognizes c.leftRecognition
  rightRecognitionPreserved :
    r.recognizedRight ↔ Recognition.Recognizes c.rightRecognition
  globalFitPreserved :
    r.globalFit ↔ Coherence.GlobalFit c.wholeView
  invariantPreserved :
    r.sharedInvariant ↔ Coherence.SharedInvariant c.wholeView
  wholeHeldPreserved :
    r.wholeHeld ↔ Coherence.JointWholeHoldEndpoint c.wholeView
  wholeLossPreserved :
    r.wholeSelectiveLoss ↔
      (Coherence.RecognizedCompatible c.lossView ∧
       ¬ Coherence.Coheres c.lossView)
  recognitionSourceNotFormalOnly :
    (r.reviewedRealC.evidence .bindingContentRecognition).kind ≠ .formalConsequence
  invariantSourceNotFormalOnly :
    (r.reviewedRealC.evidence .wholeInvariantAndFit).kind ≠ .formalConsequence

theorem conformingRealCtoD {a : Architecture.{u}} {c : TierC a}
    {r : RealCProfile a c} (h : RealConformsC a c r) :
    RealConformsD a c.inheritedDensity r.density :=
  h.exactDensityConformance

theorem conformingRealC_endpoint {a : Architecture.{u}} {c : TierC a}
    {r : RealCProfile a c} (h : RealConformsC a c r) :
    r.wholeHeld :=
  h.wholeHeldPreserved.mpr (tierC_joint_endpoint c)

theorem conformingRealC_selectiveFailure {a : Architecture.{u}} {c : TierC a}
    {r : RealCProfile a c} (h : RealConformsC a c r) :
    r.wholeSelectiveLoss :=
  h.wholeLossPreserved.mpr (tierC_whole_selective_loss c)

/- Separate realization-to-parent-ground mapping and ownership proof. -/
structure RealGroundConforms (a : Architecture.{u}) (c : TierC a)
    (p : ParentGroundPort a c) (r : RealCProfile a c) where
  realConforms : RealConformsC a c r
  RealGround : Type u
  carriedGround : RealGround
  groundMap : RealGround → p.Ground
  mapsToOffered : groundMap carriedGround = p.offered
  groundedWhole : p.ownedBy c.wholeView.candidateWhole (groundMap carriedGround)
  groundScope : p.inDeclaredScope (groundMap carriedGround) a.index

theorem realGroundConforms_owned {a : Architecture.{u}} {c : TierC a}
    {p : ParentGroundPort a c} {r : RealCProfile a c}
    (h : RealGroundConforms a c p r) :
    p.ownedBy c.wholeView.candidateWhole p.offered :=
  h.mapsToOffered ▸ h.groundedWhole

end CPGeneral
end StructuralFlow

