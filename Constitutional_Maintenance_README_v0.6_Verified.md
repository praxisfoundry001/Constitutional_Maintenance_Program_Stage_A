# Constitutional Maintenance Program

**An open, independently usable research and legislative-development architecture for the 120th United States Congress (2027–2029)**

## Why this project exists

A governmental responsibility is not necessarily fulfilled just because the law assigns it to an institution. The institution may have legal authority but lack usable resources, reliable evidence, operating capacity, or a means of confirming that a required correction occurred. Existing safeguards may also be functioning properly. Neither a disappointing outcome nor a disagreement about policy is, by itself, proof of constitutional failure.

The Constitutional Maintenance Program provides a way to examine those distinctions. It offers a map of **thirteen areas of governmental responsibility**, a practical inquiry tool, and a **Lean formal architecture** that others can inspect, reproduce, and use when developing additional formal tests.

**This is a working starting point, not a completed legislative package.** An inquiry may lead to a better question, a request for records, oversight, action under existing law, a possible legislative proposal, or a finding that no change is warranted.

## The public tools

| Resource | What it is for |
|---|---|
| [Public Prospectus](architecture/Public_Prospectus.txt) | A short explanation of the program, its existing work, and how others can use it |
| [Family Architecture Atlas](architecture/Family_Architecture_Atlas.txt) | The thirteen responsibilities, their boundaries, examples, and optional technical research references |
| [Constitutional Maintenance Inquiry Worksheet](architecture/Constitutional_Maintenance_Inquiry_Worksheet.txt) | A flexible record for a specific governmental question, relevant evidence, and the next action—if any |
| [Lean verification and reproduction guide](formal/VERIFY.md) | How the formal source is organized, how to run it, what the recorded check found, and what the results do not prove |

You can use the Prospectus, Atlas, and Worksheet without knowing Lean or the internal terminology used to develop the architecture. The detailed Atlas codes and original Lean filenames remain available for readers who want to trace the work.

## Start with a question

Begin with a real governmental question that matters to you. Identify the public responsibility, the institution with legal authority, the evidence currently available, and what an existing lawful safeguard might already accomplish. The Inquiry Worksheet can be completed lightly: a clear question, a primary source, contrary evidence or a functioning control, and a possible next step may be enough for an initial inquiry.

You do not have to finish every field, diagnose a failure, or propose a bill. Recording an unresolved question—or explaining why the available evidence indicates that a safeguard worked—is also useful work.

## Working with an LLM and the Lean architecture

The architecture is intended to be **used**, not merely read or verified. A person can bring their question and the public files to a large language model (LLM) to help organize an investigation. The LLM can help relate the question to the thirteen areas, distinguish legal permission from resources and actual performance, identify missing or conflicting evidence, examine existing remedies, and develop possible next actions.

The Lean sources add another capability. For a question where formal precision is useful, an LLM can help a participant inspect the existing definitions, formulate a candidate extension or counterexample, and draft a new Lean statement or test. **New code must actually be checked with Lean.** An LLM's claim that a proof compiles, or that a real-world premise is true, is not a substitute for either verification or evidence.

The human decides which question to pursue, what evidence is trustworthy, which legal authorities matter, and whether any proposed action makes sense. An LLM can assist with analysis and drafting; Lean checks the mathematical statements actually encoded and submitted to it. Neither can establish historical facts, legal conclusions, or practical effectiveness on its own.

### Example starting prompt

You can adapt this prompt for an LLM that supports file uploads:

> I want to examine this governmental question: **[describe the question]**. I have provided the Constitutional Maintenance Program's Public Prospectus, Family Architecture Atlas, Inquiry Worksheet, and, if relevant, its Lean files. Help me identify the responsible institution and legal duty, the best starting sources, any functioning safeguards or competing explanations, and what remains unknown. Do not assume there is a failure or that legislation is needed. Suggest a defensible next inquiry step. If a structural claim could benefit from Lean, distinguish existing verified code from any new formalization and tell me what would need to be compiled and checked. Keep the conclusions open to correction.

An LLM does not need the entire Lean source for every inquiry. Start with the public documents; add the formal files when they help answer a precise architectural or mathematical question. Verify source quotations and legal citations against the underlying records.

## Explore the formal architecture: Kernel → Adapter → Contract

**Play with this.** These sources are offered for independent experimentation as well as reproduction. Use an LLM to explore definitions, challenge assumptions, propose extensions, build a different adapter for another domain, or investigate how the congressional model works. Share what you discover if you want to; no central submission or approval is required for independent investigations, subject to the terms of the release license.

The formal part consists of three readable layers:

| Source | What it does |
|---|---|
| [`Structural_Flow_Universal_Kernel_v1.0.lean`](formal/Structural_Flow_Universal_Kernel_v1.0.lean) | The general mathematical foundation. It can be investigated independently of the congressional project; other applications would need to establish their own assumptions. |
| [`SF_DN_FND_CP_General_v0.8.lean`](formal/SF_DN_FND_CP_General_v0.8.lean) | The constitutional-physiology domain adapter connecting general concepts to models of governmental functions. |
| [`CMA_Congressional_Maintenance_Contract_v0.1.lean`](formal/CMA_Congressional_Maintenance_Contract_v0.1.lean) | The application interface, thirteen-area Stage-A invariants, and bridge back to the upstream architecture. This is a **formal** contract, not an agreement users must sign. |

The files are **appendable source segments**, rather than three separately importable modules. [`formal/VERIFY.md`](formal/VERIFY.md) explains how to assemble them, reproduce the **exact** combined source, check its hash, and run it using Lean 4.34.0.

On **November 9, 2026**, the three-part assembly reproduced the original 632,752-byte combined source with SHA-256 `58a6be8731efaeb83926158225f31fc7be2ffd8edd2afa3a87a4c6b5f8d49290`. The author ran it in Lean 4.34.0 with **exit code 0**, both expected completion markers, and empty captured stderr. This supplements the November 8 run of the same combined source. A separate earlier review of four theorem dependencies is documented in the verification guide.

New experiments and extensions are **not** covered by that check. Work on copies, write down the assumptions, run Lean, record results, and use primary evidence and legal analysis when making claims about actual institutions. Reusing a theorem in a different domain does not by itself establish that the domain satisfies its premises.

## Independent use and collaboration

**Independent use needs no approval.** Congressional offices, researchers, civic organizations, and other interested people can investigate their own questions and reach their own evidence-based conclusions. There is no central submission process, and nobody needs to send findings to the originator. Voluntary feedback, corrections, collaboration, and independent extensions are welcome.

Each inquiry should keep primary sources, contrary evidence, unresolved assumptions, and legal and implementation questions visible. Protect sensitive personal information and confidential government or Tribal-controlled materials in anything shared publicly.

The project is intended to support practical work in and around the 120th Congress. It does not claim congressional sponsorship, an official legal interpretation, a fiscal estimate, or a completed set of bills. The first task is to make the tools available so capable people can begin using, testing, and improving them.
