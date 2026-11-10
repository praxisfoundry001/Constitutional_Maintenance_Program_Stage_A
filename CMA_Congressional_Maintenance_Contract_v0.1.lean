/- ===== BEGIN SOURCE 3: SF_APP_CP_Congressional_Repair_Contract_v0.1.lean ===== -/
/-!
Structural Flow — Constitutional Physiology Congressional Repair
Applied diagnostic contract (APP.CP.CONGRESSIONAL_REPAIR)

Requires the established Structural Flow Universal Kernel and the
CP domain-general conditional foundation, in that order.

This application-layer contract does not add an FND, prove a historical
constitutional failure, certify a legal power, or imply a REAL witness.
A diagnostic hypothesis is not a located loss. A source record is not an
independent authentication of its contents. Actual REAL-to-FND conformance
is an optional, separately proved branch.
-/

namespace StructuralFlow
namespace CPRepairApp

universe u

/- Project-local status classes, not replacements for universal dispositions. -/
inductive WorkingStatus where
  | inheritedClosed
  | localCandidate
  | documented
  | inferred
  | contested
  | open
  | noLawfulRoute
  | proposedRepair
  deriving DecidableEq, Repr

inductive FunctionalStatus where
  | active
  | activeLocalCandidate
  | activeRoutingCandidate
  | activeScopeBoundCandidate
  | governedPulseSurface
  | proposedRelation
  | proposedLocalFunction
  deriving DecidableEq, Repr

inductive ObjectDisposition where
  | open
  | coordinationOnly
  | absorbedByExisting
  | locatedCandidate
  | earnedAtDeclaredScope
  | negative
  deriving DecidableEq, Repr

inductive InquiryDisposition where
  | open
  | corroborated
  | disconfirmed
  | contested
  | correctedByExistingMeans
  deriving DecidableEq, Repr

inductive ReviewDisposition where
  | notAttempted
  | open
  | supported
  | rejected
  | contested
  deriving DecidableEq, Repr

inductive FederalInstrument where
  | existingEnforcement
  | oversight
  | appropriations
  | chamberRule
  | ordinaryStatute
  | intergovernmentalArrangement
  | appointmentOrConsent
  | impeachmentProcedure
  | articleV
  | noLawfulRoute
  deriving DecidableEq, Repr

inductive FormalReferral where
  | none
  | scopeOrIdentity
  | tierD
  | tierC
  | realD
  | realC
  | parentGround
  deriving DecidableEq, Repr

/- Every application is attached to one already declared CP architectural
   index. A different scope/level requires a separately supplied Architecture. -/
structure AppliedSeat (a : CPGeneral.Architecture.{u}) where
  index : CPGeneral.ScopeIndex
  exactIndex : index = a.index
  claimID : String
  claimIDPresent : claimID ≠ ""
  governingModuleID : String
  governingModulePresent : governingModuleID ≠ ""
  functionalStatus : FunctionalStatus
  workingStatus : WorkingStatus

/- The hypothesis records a possible survivor/loss contrast WITHOUT proving
   that the held or failed conditions obtain in an actual case. -/
structure DiagnosticHypothesis (a : CPGeneral.Architecture.{u}) where
  seat : AppliedSeat a
  State : Type u
  before : State
  after : State
  levelOf : State → a.Level
  scopeOf : State → a.Scope
  burdenOf : State → a.Burden
  carrierOf : State → a.CivicFunction
  survives : State → Prop
  requiredCapacity : State → Prop
  structuralJobID : String
  weakestShapeID : String
  lostCapacityID : String
  jobPresent : structuralJobID ≠ ""
  minimumPresent : weakestShapeID ≠ ""
  lossPresent : lostCapacityID ≠ ""
  objectDisposition : ObjectDisposition

/- An actual located contrast requires explicit propositions for survivor,
   held-before, lost-after, and same-level/scope/burden/carrier continuity.
   These proof obligations do not independently authenticate the world. -/
structure LocatedContrast {a : CPGeneral.Architecture.{u}}
    (h : DiagnosticHypothesis a) where
  beforeLevel : h.levelOf h.before = a.level
  afterLevel : h.levelOf h.after = a.level
  beforeScope : h.scopeOf h.before = a.scope
  afterScope : h.scopeOf h.after = a.scope
  beforeBurden : h.burdenOf h.before = a.declaredBurden
  afterBurden : h.burdenOf h.after = a.declaredBurden
  sameCarrier : h.carrierOf h.before = h.carrierOf h.after
  survivesBefore : h.survives h.before
  survivesAfter : h.survives h.after
  heldBefore : h.requiredCapacity h.before
  lostAfter : ¬ h.requiredCapacity h.after

/- These are conditional consequences of a supplied contrast, not
   newly proved facts about a public institution. -/
theorem contrast_preserves_scope {a : CPGeneral.Architecture.{u}}
    {h : DiagnosticHypothesis a} (w : LocatedContrast h) :
    h.scopeOf h.before = h.scopeOf h.after := by
  calc
    h.scopeOf h.before = a.scope := w.beforeScope
    _ = h.scopeOf h.after := w.afterScope.symm

theorem contrast_separates_carriage {a : CPGeneral.Architecture.{u}}
    {h : DiagnosticHypothesis a} (w : LocatedContrast h) :
    h.requiredCapacity h.before ∧ ¬ h.requiredCapacity h.after :=
  ⟨w.heldBefore, w.lostAfter⟩

/- CPGeneral.Attestation supplies source/locator/assessor/limitations and
   universal-disposition metadata. Supporting AND contrary traces remain
   visible. No source's assertion is promoted to truth by its presence here. -/
structure EvidenceLedger (a : CPGeneral.Architecture.{u}) where
  supporting : List CPGeneral.Attestation
  contrary : List CPGeneral.Attestation
  successfulRepairs : List CPGeneral.Attestation
  supportPinned : ∀ e, e ∈ supporting → e.index = a.index
  contraryPinned : ∀ e, e ∈ contrary → e.index = a.index
  repairsPinned : ∀ e, e ∈ successfulRepairs → e.index = a.index
  status : InquiryDisposition
  assessorID : String
  assessorPresent : assessorID ≠ ""

/- Handoff from S1 to S2: the inquiry remains permitted even when there is no
   LocatedContrast and no REAL certificate. -/
structure InquiryPacket (a : CPGeneral.Architecture.{u}) where
  hypothesis : DiagnosticHypothesis a
  evidence : EvidenceLedger a
  nonAbsorptionDisposition : ObjectDisposition
  existingRemedyQuestionID : String
  existingRemedyQuestionPresent : existingRemedyQuestionID ≠ ""
  corroborationQuestionID : String
  corroborationQuestionPresent : corroborationQuestionID ≠ ""
  disconfirmationQuestionID : String
  disconfirmationQuestionPresent : disconfirmationQuestionID ≠ ""
  formalReferral : FormalReferral

/- S3 and S4 assess separate matters. These are review records, not theorems
   that a route is lawful or a ten-year estimate is objectively accurate. -/
structure LegalReview (a : CPGeneral.Architecture.{u}) where
  index : CPGeneral.ScopeIndex
  indexPinned : index = a.index
  route : FederalInstrument
  status : ReviewDisposition
  currentLawSource : Option CPGeneral.Attestation
  responsibleActorID : String
  actorPresent : responsibleActorID ≠ ""
  rightsAndLimitsID : String
  limitsPresent : rightsAndLimitsID ≠ ""
  existingRemediesID : String
  remediesPresent : existingRemediesID ≠ ""

structure FiscalDeliveryReview (a : CPGeneral.Architecture.{u}) where
  index : CPGeneral.ScopeIndex
  indexPinned : index = a.index
  status : ReviewDisposition
  tenYearScenarioID : String
  scenarioPresent : tenYearScenarioID ≠ ""
  implementationCarrierID : String
  carrierPresent : implementationCarrierID ≠ ""
  distributionAndUncertaintyID : String
  uncertaintiesPresent : distributionAndUncertaintyID ≠ ""
  officialScoreSource : Option CPGeneral.Attestation

/- S0 can receive an inquiry before legal/fiscal completion. Optional reviews
   do not silently discharge their separate substantive requirements. -/
structure StewardPacket (a : CPGeneral.Architecture.{u}) where
  inquiry : InquiryPacket a
  legal : Option (LegalReview a)
  fiscal : Option (FiscalDeliveryReview a)
  status : ReviewDisposition
  integrationNotesID : String
  notesPresent : integrationNotesID ≠ ""

/- An independently proved actual REAL certificate has a DIFFERENT type from
   any S1 candidate or inquiry. The application contract does not construct
   either certificate from documentation, statuses, or a draft proposal. -/
structure CertifiedRealD (a : CPGeneral.Architecture.{u}) where
  foundation : CPGeneral.TierD a
  profile : CPGeneral.RealDProfile a foundation
  conforms : CPGeneral.RealConformsD a foundation profile

structure CertifiedRealC (a : CPGeneral.Architecture.{u}) where
  foundation : CPGeneral.TierC a
  profile : CPGeneral.RealCProfile a foundation
  conforms : CPGeneral.RealConformsC a foundation profile

/- Exact inherited Tier D conformance is carried by REAL C, never inferred
   from a merely documented whole-level hypothesis. -/
theorem certifiedRealC_hasD {a : CPGeneral.Architecture.{u}}
    (r : CertifiedRealC a) :
    CPGeneral.RealConformsD a r.foundation.inheritedDensity r.profile.density :=
  CPGeneral.conformingRealCtoD r.conforms

end CPRepairApp
end StructuralFlow

/- ===== END SOURCE 3 ===== -/


/- ===== BEGIN SOURCE 4: S0_Stage_A_Architecture_Invariants_v0.2.lean ===== -/

/-!
S0 — Stage-A Architecture Invariants v0.2
Constitutional Maintenance Program / 120th Congress

Application-level, self-contained Lean 4 model of the frozen F5 family set
and the F4 universal module routing contract. No imported CP proof is
claimed or altered. All cited agency/time and evidence examples are toy
countermodels, NOT assertions about historical law or real-world events.

Machine status at this revision: SOURCE CORRECTED AFTER BROWSER ERRORS;
external Lean 4 compilation still required.
No proof placeholders or new axioms are used.
-/

namespace CMAStageA

/-! LA-F01 — Finite family vocabulary and unique-or-pending ownership. -/

inductive FamilyId where
  | f01 | f02 | f03 | f04 | f05 | f06 | f07
  | f08 | f09 | f10 | f11 | f12 | f13
  deriving DecidableEq, Repr

def allFamilies : List FamilyId :=
  [.f01, .f02, .f03, .f04, .f05, .f06, .f07,
   .f08, .f09, .f10, .f11, .f12, .f13]

theorem allFamilies_count : allFamilies.length = 13 := by decide

theorem allFamilies_nodup : allFamilies.Nodup := by decide

theorem allFamilies_complete (f : FamilyId) : f ∈ allFamilies := by
  cases f <;> decide

structure NonemptyCandidates where
  first : FamilyId
  rest : List FamilyId
  deriving Repr

def NonemptyCandidates.toList (c : NonemptyCandidates) : List FamilyId :=
  c.first :: c.rest

theorem candidates_nonempty (c : NonemptyCandidates) : c.toList ≠ [] := by
  simp [NonemptyCandidates.toList]

inductive OwnerState where
  | pending (candidates : NonemptyCandidates)
            (unresolvedDiscriminator : String)
            (nextEvidenceOwner : String)
  | owned (primary : FamilyId)
          (jobDiscriminator : String)
          (routingDecisionRef : String)
  deriving Repr

def OwnerState.primary? : OwnerState → Option FamilyId
  | .pending _ _ _ => none
  | .owned f _ _ => some f

theorem pending_has_no_primary (c : NonemptyCandidates) (d n : String) :
    (OwnerState.pending c d n).primary? = none := rfl

theorem owned_has_exactly_one_primary (f : FamilyId) (d r : String) :
    (OwnerState.owned f d r).primary? = some f := rfl

theorem primary_cannot_disagree (s : OwnerState) (a b : FamilyId)
    (ha : s.primary? = some a) (hb : s.primary? = some b) : a = b := by
  have h : some a = some b := ha.symm.trans hb
  cases h
  rfl

/-! LA-F02 — Case/module/proposal are separate namespaces, and secondary
    dependencies do not mint a proposal or change primary routing. -/

structure CaseId where
  number : Nat
  deriving DecidableEq, Repr

structure ModuleId where
  number : Nat
  deriving DecidableEq, Repr

structure ProposalId where
  number : Nat
  deriving DecidableEq, Repr

structure ModuleCore where
  moduleId : ModuleId
  sourceCases : List CaseId
  dependentFamilies : List FamilyId
  deriving Repr

inductive ModuleRecord where
  | pending (core : ModuleCore) (candidates : NonemptyCandidates)
            (discriminator nextEvidenceOwner : String)
  | owned (core : ModuleCore) (primary : FamilyId)
          (discriminator decisionRef : String)
          (selectedProposal : Option ProposalId)
  deriving Repr

def ModuleRecord.owner : ModuleRecord → OwnerState
  | .pending _ c d n => .pending c d n
  | .owned _ f d r _ => .owned f d r

def ModuleRecord.primary? (m : ModuleRecord) : Option FamilyId :=
  m.owner.primary?

def ModuleRecord.proposal? : ModuleRecord → Option ProposalId
  | .pending _ _ _ _ => none
  | .owned _ _ _ _ p => p

def addFamilyDependency (xs : List FamilyId) (f : FamilyId) : List FamilyId :=
  if f ∈ xs then xs else f :: xs

def ModuleRecord.addDependency (m : ModuleRecord) (f : FamilyId) : ModuleRecord :=
  match m with
  | .pending core c d n =>
      .pending { core with dependentFamilies := addFamilyDependency core.dependentFamilies f } c d n
  | .owned core p d r selected =>
      .owned { core with dependentFamilies := addFamilyDependency core.dependentFamilies f } p d r selected

theorem dependency_edit_preserves_primary (m : ModuleRecord) (f : FamilyId) :
    (m.addDependency f).primary? = m.primary? := by
  cases m <;> rfl

theorem dependency_edit_does_not_mint_proposal (m : ModuleRecord) (f : FamilyId) :
    (m.addDependency f).proposal? = m.proposal? := by
  cases m <;> rfl

theorem pending_module_cannot_have_proposal (core : ModuleCore)
    (c : NonemptyCandidates) (d n : String) :
    (ModuleRecord.pending core c d n).proposal? = none := rfl

-- Purely synthetic fixture; identifiers and roles are not live case records.
def twoDependenciesNoProposal : ModuleRecord :=
  .owned
    { moduleId := ⟨606⟩,
      sourceCases := [⟨6⟩],
      dependentFamilies := [.f04, .f10] }
    .f09 "synthetic monitored-correction job" "synthetic route record" none

theorem two_dependencies_can_have_no_proposal :
    twoDependenciesNoProposal.proposal? = none := rfl

/-! LA-F03 — Agency/power/time-indexed legal permission.
    Interpretation of each grant and effective-date predicate is an
    EXTERNAL PREMISE supplied by a legal reviewer, not by Lean. -/

inductive Agency where
  | forestService | noaa | socialSecurityAdministration | stateDDS
  | congress | court
  deriving DecidableEq, Repr

inductive Power where
  | finalProjectDecision | intergovernmentalAgreement
  | initialMedicalDetermination | oversight
  deriving DecidableEq, Repr

structure TimeKey where
  year : Nat
  month : Nat
  day : Nat
  deriving DecidableEq, Repr

structure InstrumentKey where
  sourceId : String
  edition : String
  deriving DecidableEq, Repr

structure Permission
    (ValidAt : InstrumentKey → TimeKey → Prop)
    (Grants : InstrumentKey → Agency → Power → Prop)
    (agency : Agency) (power : Power) (atTime : TimeKey) where
  instrument : InstrumentKey
  timeWitness : ValidAt instrument atTime
  rolePowerWitness : Grants instrument agency power

-- An artificial one-agency/one-year interpretation shows logical
-- NON-ENTAILMENT; it is not a claim about the 2019 Leech Lake MOU.
def toyValidAt (i : InstrumentKey) (t : TimeKey) : Prop :=
  i.sourceId = "toy-2019" ∧ t.year = 2019

def toyGrants (i : InstrumentKey) (a : Agency) (p : Power) : Prop :=
  i.sourceId = "toy-2019" ∧
  a = .forestService ∧ p = .finalProjectDecision

def toyInstrument : InstrumentKey :=
  { sourceId := "toy-2019", edition := "synthetic-v1" }

def toyTime2019 : TimeKey := ⟨2019, 10, 1⟩
def toyTime2026 : TimeKey := ⟨2026, 11, 6⟩

def toyForestPermission :
    Permission toyValidAt toyGrants .forestService .finalProjectDecision toyTime2019 :=
  { instrument := toyInstrument
    timeWitness := by simp [toyValidAt, toyInstrument, toyTime2019]
    rolePowerWitness := by simp [toyGrants, toyInstrument] }

theorem toy_forest_permission_cannot_be_noaa_permission :
    ¬ Nonempty (Permission toyValidAt toyGrants .noaa .finalProjectDecision toyTime2019) := by
  intro ⟨p⟩
  have h := p.rolePowerWitness
  simp [toyGrants] at h

theorem toy_2019_permission_does_not_extend_to_2026 :
    ¬ Nonempty (Permission toyValidAt toyGrants .forestService .finalProjectDecision toyTime2026) := by
  intro ⟨p⟩
  have h := p.timeWitness
  simp [toyValidAt, toyTime2026] at h

/-! LA-F04 — Stage/program/denominator-indexed measurement alignment.
    Equal signatures and a cited basis are requirements to compare; the
    signatures themselves do not authenticate any agency statistics. -/

inductive Program where
  | titleII | titleXVI | combinedInitial | appeals
  deriving DecidableEq, Repr

inductive DecisionStage where
  | ddsReceiptRelease | initialFilingNotice | appealsInventory
  deriving DecidableEq, Repr

inductive MeasureUnit where
  | elapsedDays | pendingCases
  deriving DecidableEq, Repr

inductive Denominator where
  | stateDDSFolders | nationwideInitialCases | appealedCases
  deriving DecidableEq, Repr

inductive PeriodUnit where
  | month | quarter | fiscalYear
  deriving DecidableEq, Repr

structure MeasureSignature where
  program : Program
  stage : DecisionStage
  denominator : Denominator
  unit : MeasureUnit
  periodUnit : PeriodUnit
  cohortDefinition : String
  jurisdiction : String
  observationTime : TimeKey
  deriving Repr

-- Observation dates may differ in a legitimate before/after comparison;
-- stage, definition, cohort and interval type may not silently change.
structure AlignmentWitness (a b : MeasureSignature) where
  sameProgram : a.program = b.program
  sameStage : a.stage = b.stage
  sameDenominator : a.denominator = b.denominator
  sameUnit : a.unit = b.unit
  samePeriodUnit : a.periodUnit = b.periodUnit
  sameCohort : a.cohortDefinition = b.cohortDefinition
  sameJurisdiction : a.jurisdiction = b.jurisdiction
  comparisonBasisRef : String

def toyDDSMeasure : MeasureSignature :=
  { program := .titleII, stage := .ddsReceiptRelease,
    denominator := .stateDDSFolders, unit := .elapsedDays,
    periodUnit := .quarter, cohortDefinition := "toy-initial-medical",
    jurisdiction := "toy-state", observationTime := ⟨2024, 10, 1⟩ }

def toyNationalInitialMeasure : MeasureSignature :=
  { program := .combinedInitial, stage := .initialFilingNotice,
    denominator := .nationwideInitialCases, unit := .elapsedDays,
    periodUnit := .fiscalYear, cohortDefinition := "toy-national-initial",
    jurisdiction := "toy-nation", observationTime := ⟨2024, 10, 1⟩ }

def toyAppealsMeasure : MeasureSignature :=
  { program := .appeals, stage := .appealsInventory,
    denominator := .appealedCases, unit := .pendingCases,
    periodUnit := .fiscalYear, cohortDefinition := "toy-appeals",
    jurisdiction := "toy-nation", observationTime := ⟨2024, 10, 1⟩ }

theorem dds_not_automatically_aligned_with_national_initial :
    ¬ Nonempty (AlignmentWitness toyDDSMeasure toyNationalInitialMeasure) := by
  intro ⟨w⟩
  have h := w.sameStage
  simp [toyDDSMeasure, toyNationalInitialMeasure] at h

theorem dds_not_automatically_aligned_with_appeals :
    ¬ Nonempty (AlignmentWitness toyDDSMeasure toyAppealsMeasure) := by
  intro ⟨w⟩
  have h := w.sameStage
  simp [toyDDSMeasure, toyAppealsMeasure] at h

/-! LA-F05 — Success/ordinary lawful inhibition cannot become a located
    failure solely from a status constructor. Actual status assignment
    always remains a separately sourced empirical/legal judgment. -/

inductive ObservationDisposition where
  | functioning | lawfulControl | inquiryOpen | deficiencyReported | locatedFailure
  deriving DecidableEq, Repr

structure FailureWitness (d : ObservationDisposition) where
  sourceRef : String
  independentlyAdmitted : d = .locatedFailure

theorem functioning_control_is_not_failure_witness :
    ¬ Nonempty (FailureWitness .functioning) := by
  intro ⟨w⟩
  cases w.independentlyAdmitted

theorem lawful_inhibition_is_not_failure_witness :
    ¬ Nonempty (FailureWitness .lawfulControl) := by
  intro ⟨w⟩
  cases w.independentlyAdmitted

/-! LA-F06 — Statutory authority, spendable funds, operating carrier,
    delivered action, adverse finding and verified repair are independent
    evidence slots. No implication between these slots is supplied. -/

structure EvidenceRef where
  citation : String
  deriving DecidableEq, Repr

structure CarriageEvidence where
  lawfulAuthority : Option EvidenceRef
  fundsAvailable : Option EvidenceRef
  carrierOperating : Option EvidenceRef
  actDelivered : Option EvidenceRef
  deficiencyFound : Option EvidenceRef
  repairVerified : Option EvidenceRef
  deriving Repr

def toyLawWithoutDelivery : CarriageEvidence :=
  { lawfulAuthority := some ⟨"synthetic-law"⟩,
    fundsAvailable := none,
    carrierOperating := none,
    actDelivered := none,
    deficiencyFound := none,
    repairVerified := none }

def toyFindingWithoutVerifiedRepair : CarriageEvidence :=
  { lawfulAuthority := none,
    fundsAvailable := none,
    carrierOperating := none,
    actDelivered := none,
    deficiencyFound := some ⟨"synthetic-finding"⟩,
    repairVerified := none }

theorem legal_record_does_not_supply_delivery :
    toyLawWithoutDelivery.lawfulAuthority = some ⟨"synthetic-law"⟩ ∧
    toyLawWithoutDelivery.actDelivered = none := by
  constructor <;> rfl

theorem finding_record_does_not_supply_repair :
    toyFindingWithoutVerifiedRepair.deficiencyFound = some ⟨"synthetic-finding"⟩ ∧
    toyFindingWithoutVerifiedRepair.repairVerified = none := by
  constructor <;> rfl

/-! LA-F07 — A continuing obligation has its own stable identity;
    a carrier can retire while succession remains unresolved. Only an
    expressly supplied lawful-end witness can label a duty ended. -/

structure ObligationId where
  key : String
  deriving DecidableEq, Repr

structure CarrierId where
  key : String
  deriving DecidableEq, Repr

inductive SuccessorDisposition where
  | carried (newCarrier : CarrierId) (evidence : EvidenceRef)
  | unresolved
  | lawfullyEnded (evidence : EvidenceRef)
  deriving Repr

structure SuccessionRecord where
  obligation : ObligationId
  oldCarrier : CarrierId
  oldCarrierRetired : Bool
  successor : SuccessorDisposition
  deriving Repr

def SuccessionRecord.retireCarrier (s : SuccessionRecord) : SuccessionRecord :=
  { s with oldCarrierRetired := true }

def SuccessionRecord.dutyEnded (s : SuccessionRecord) : Bool :=
  match s.successor with
  | .lawfullyEnded _ => true
  | .carried _ _ => false
  | .unresolved => false

theorem carrier_retirement_preserves_obligation (s : SuccessionRecord) :
    s.retireCarrier.obligation = s.obligation := rfl

theorem carrier_retirement_preserves_successor_status (s : SuccessionRecord) :
    s.retireCarrier.successor = s.successor := rfl

def toyUnresolvedSuccession : SuccessionRecord :=
  { obligation := ⟨"synthetic-duty"⟩,
    oldCarrier := ⟨"synthetic-office"⟩,
    oldCarrierRetired := true,
    successor := .unresolved }

theorem retired_carrier_with_unresolved_live_duty :
    toyUnresolvedSuccession.oldCarrierRetired = true ∧
    toyUnresolvedSuccession.dutyEnded = false := by
  constructor <;> rfl

end CMAStageA

-- A visible completion marker for browser-based Lean checks.
-- Seeing this marker alone is NOT sufficient if any errors appear above it.
#eval "CMA_STAGE_A_END_OF_FILE_REACHED"

/- ===== END SOURCE 4 ===== -/


/- ===== BEGIN SOURCE 5: S0_Stage_A_Universal_Kernel_CP_Bridge_v0.1.lean ===== -/
/-!
Stage A -> Structural Flow Universal Kernel / CP foundation / Congressional APP
Bridge v0.1 (application-only; no upstream edits).

COMPILE ORDER:
  Structural_Flow_Universal_Kernel_v1.0.lean
  SF_DN_FND_CP_General_v0.8.lean
  SF_APP_CP_Congressional_Repair_Contract_v0.1.lean
  S0_Stage_A_Architecture_Invariants_v0.2.lean (remove its initial `import Init`)
  THIS FILE

This source must not be compiled alone: it intentionally depends on all
four preceding source bodies. Core admission in this bridge is an EXPLICIT
EXTERNAL PREMISE, not inferred from Lean, legal sources, or a civic REAL.
A clean build establishes faithful type-level connection and conditional
kernel gating, not authentic facts or an unconditional REAL certificate.
-/

namespace StructuralFlow
namespace CMAStageABridge

open UniversalTranslationContract

/-! Seven exact Stage-A source properties registered as kernel object burdens. -/
inductive SchemaBurden where
  | familyOwnership
  | dependencyNoProposal
  | authorityActorTime
  | stageAlignedMeasurement
  | functioningNotFailure
  | deliveryNotImplied
  | dutySuccession
  deriving DecidableEq, Repr

/-! These are deliberately downstream. Stage-A schema admission cannot close
    legal applicability, budgets, delivery, or observed outcomes. -/
inductive DownstreamQuestion where
  | applicableLaw
  | spendingAuthority
  | deliveredFunction
  | actualOutcome
  deriving DecidableEq, Repr

/-! Each property is a proposition taken from the checked Stage-A v0.2
    SOURCE, not a new premise inserted into this bridge. -/
def SchemaClaim : SchemaBurden → Prop
  | .familyOwnership =>
      ∀ (s : CMAStageA.OwnerState) (a b : CMAStageA.FamilyId),
        s.primary? = some a → s.primary? = some b → a = b
  | .dependencyNoProposal =>
      ∀ (m : CMAStageA.ModuleRecord) (f : CMAStageA.FamilyId),
        (m.addDependency f).primary? = m.primary? ∧
        (m.addDependency f).proposal? = m.proposal?
  | .authorityActorTime =>
      ∀ (V : CMAStageA.InstrumentKey → CMAStageA.TimeKey → Prop)
        (G : CMAStageA.InstrumentKey → CMAStageA.Agency → CMAStageA.Power → Prop)
        (agency : CMAStageA.Agency) (power : CMAStageA.Power)
        (atTime : CMAStageA.TimeKey),
        Nonempty (CMAStageA.Permission V G agency power atTime) →
          ∃ key : CMAStageA.InstrumentKey,
            V key atTime ∧ G key agency power
  | .stageAlignedMeasurement =>
      ∀ (a b : CMAStageA.MeasureSignature),
        Nonempty (CMAStageA.AlignmentWitness a b) →
          a.program = b.program ∧
          a.stage = b.stage ∧
          a.denominator = b.denominator ∧
          a.periodUnit = b.periodUnit
  | .functioningNotFailure =>
      (¬ Nonempty (CMAStageA.FailureWitness .functioning)) ∧
      (¬ Nonempty (CMAStageA.FailureWitness .lawfulControl))
  | .deliveryNotImplied =>
      (CMAStageA.toyLawWithoutDelivery.lawfulAuthority =
          some ⟨"synthetic-law"⟩ ∧
       CMAStageA.toyLawWithoutDelivery.actDelivered = none) ∧
      (CMAStageA.toyFindingWithoutVerifiedRepair.deficiencyFound =
          some ⟨"synthetic-finding"⟩ ∧
       CMAStageA.toyFindingWithoutVerifiedRepair.repairVerified = none)
  | .dutySuccession =>
      ∀ (s : CMAStageA.SuccessionRecord),
        s.retireCarrier.obligation = s.obligation ∧
        s.retireCarrier.successor = s.successor

/-! Proofs from the exact previously browser-checked Stage-A source. -/
theorem all_schema_claims_proved (b : SchemaBurden) : SchemaClaim b := by
  cases b with
  | familyOwnership =>
      intro s a c h1 h2
      exact CMAStageA.primary_cannot_disagree s a c h1 h2
  | dependencyNoProposal =>
      intro m f
      exact ⟨CMAStageA.dependency_edit_preserves_primary m f,
             CMAStageA.dependency_edit_does_not_mint_proposal m f⟩
  | authorityActorTime =>
      intro V G agency power atTime witness
      obtain ⟨p⟩ := witness
      exact ⟨p.instrument, p.timeWitness, p.rolePowerWitness⟩
  | stageAlignedMeasurement =>
      intro a b witness
      obtain ⟨w⟩ := witness
      exact ⟨w.sameProgram, w.sameStage, w.sameDenominator, w.samePeriodUnit⟩
  | functioningNotFailure =>
      exact ⟨CMAStageA.functioning_control_is_not_failure_witness,
             CMAStageA.lawful_inhibition_is_not_failure_witness⟩
  | deliveryNotImplied =>
      exact ⟨CMAStageA.legal_record_does_not_supply_delivery,
             CMAStageA.finding_record_does_not_supply_repair⟩
  | dutySuccession =>
      intro s
      exact ⟨CMAStageA.carrier_retirement_preserves_obligation s,
             CMAStageA.carrier_retirement_preserves_successor_status s⟩

/-! Universal core obligations are not bypassed by the seven proofs.
    A human/legal/technical review would have to supply these independent
    witnesses for any claimed translation admission. An arbitrary True
    substitute would not constitute genuine admission. -/
structure CoreAdmission where
  evidenceJob : CoreBurden → Prop
  separatelyWarranted : ∀ b, evidenceJob b

/-! A specimen World for the SCHEMA only. The seven registered obligations
    are grounded in actual Stage-A source proofs. Kernel core discharge is
    CONDITIONAL on CoreAdmission. Every real-world downstream duty remains OPEN. -/
def schemaWorld (core : CoreAdmission) :
    World SchemaBurden DownstreamQuestion where
  coreState := fun _ => .discharged
  coreEvidence := fun b d => d = .discharged ∧ core.evidenceJob b
  coreWarrant := by
    intro b
    exact ⟨rfl, core.separatelyWarranted b⟩
  objectRequired := fun _ => True
  objectState := fun _ => .discharged
  objectEvidence := fun b d => d = .discharged ∧ SchemaClaim b
  objectWarrant := by
    intro b _
    exact ⟨rfl, all_schema_claims_proved b⟩
  domainEntryRequired := fun _ => False
  domainDownstreamRequired := fun _ => True
  domainRoleDisjoint := by
    intro b h
    exact h.1
  domainState := fun _ => .open
  domainEvidence := fun _ d => d = .open
  domainWarrant := by
    intro b _
    rfl

theorem schema_conforms_under_core_admission (core : CoreAdmission) :
    StructuralConforms (schemaWorld core) := by
  refine ⟨?_, ?_, ?_⟩
  · intro b
    rfl
  · intro b _
    rfl
  · intro b h
    exact False.elim h

theorem schema_downstream_remains_open (core : CoreAdmission) :
    DomainBurdenOpen (schemaWorld core) := by
  exact ⟨.applicableLaw, trivial, rfl⟩

theorem kernel_source_carrier_gate_retained (core : CoreAdmission) :
    (schemaWorld core).coreState CoreBurden.sourceCarrierPin =
      Disposition.discharged :=
  UniversalTranslationComposition.structuralConforms_sourceCarrierPinned
    (schema_conforms_under_core_admission core)

/-! On a different registered World, a required OPEN schema burden BLOCKS
    kernel structural conformance. This calls the inherited kernel theorem;
    it does not silently identify OPEN with success or failure. -/
theorem required_open_schema_blocks_conformance
    (w : World SchemaBurden DownstreamQuestion)
    (b : SchemaBurden)
    (required : w.objectRequired b)
    (openAt : w.objectState b = .open) :
    ¬ StructuralConforms w :=
  knownOpen_blocks_gatingPass (KnownOpen.object b required openAt)

theorem required_failed_schema_blocks_conformance
    (w : World SchemaBurden DownstreamQuestion)
    (b : SchemaBurden)
    (required : w.objectRequired b)
    (failedAt : w.objectState b = .violated) :
    ¬ StructuralConforms w :=
  knownFailure_blocks_gatingPass (KnownFailure.object b required failedAt)

/-! This is the actual CP foundation / Congressional APP binding. It does
    NOT construct a CP Architecture; a competent external source must supply
    that architecture and an AppliedSeat. Exact index matching is inherited
    from CPRepairApp.AppliedSeat, not guessed from a family label. -/
def moduleCore : CMAStageA.ModuleRecord → CMAStageA.ModuleCore
  | .pending core _ _ _ => core
  | .owned core _ _ _ _ => core

universe u

structure RegisteredCivicModule (a : CPGeneral.Architecture.{u}) where
  record : CMAStageA.ModuleRecord
  seat : CPRepairApp.AppliedSeat a
  moduleKey : CMAStageA.ModuleId → String
  moduleIDPinned : seat.governingModuleID = moduleKey (moduleCore record).moduleId
  family : CMAStageA.FamilyId
  ownerPinned : record.primary? = some family
  kernelWorld : World SchemaBurden DownstreamQuestion
  allSchemaBurdensRequired : ∀ b, kernelWorld.objectRequired b
  dischargeSound : ∀ b,
    kernelWorld.objectEvidence b .discharged → SchemaClaim b

/-! One combined result that actually USES all four inherited layers:
    CMA owner uniqueness, CP scope pin, APP module identity, and kernel
    source-carrier/core and schema-object gates. -/
theorem registered_kernel_CP_scope_and_schema
    {a : CPGeneral.Architecture.{u}}
    (r : RegisteredCivicModule a)
    (h : StructuralConforms r.kernelWorld) :
    r.seat.index = a.index ∧
    r.seat.governingModuleID = r.moduleKey (moduleCore r.record).moduleId ∧
    r.record.primary? = some r.family ∧
    r.kernelWorld.coreState CoreBurden.sourceCarrierPin = .discharged ∧
    (∀ b : SchemaBurden, SchemaClaim b) := by
  refine ⟨r.seat.exactIndex,
          r.moduleIDPinned,
          r.ownerPinned,
          UniversalTranslationComposition.structuralConforms_sourceCarrierPinned h,
          ?_⟩
  intro b
  have hDischarged : r.kernelWorld.objectState b = .discharged :=
    h.2.1 b (r.allSchemaBurdensRequired b)
  have hEvidence : r.kernelWorld.objectEvidence b .discharged := by
    simpa only [hDischarged] using
      (r.kernelWorld.objectWarrant b (r.allSchemaBurdensRequired b))
  exact r.dischargeSound b hEvidence

theorem registered_owner_unique
    {a : CPGeneral.Architecture.{u}}
    (r : RegisteredCivicModule a)
    (other : CMAStageA.FamilyId)
    (h : r.record.primary? = some other) :
    r.family = other :=
  CMAStageA.primary_cannot_disagree r.record.owner r.family other
    r.ownerPinned h

/-! Avoid mistaking a functioning control for a REAL certificate.
    CertifiedRealD/C requires actual CPGeneral premises and conformance.
    Nothing above builds either certificate. -/

end CMAStageABridge
end StructuralFlow

#eval "CMA_STAGE_A_KERNEL_CP_BRIDGE_END_OF_FILE_REACHED"

/- ===== END SOURCE 5 ===== -/
