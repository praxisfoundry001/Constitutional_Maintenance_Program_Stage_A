# Three-part Lean contract — reproducibility note

**Status:** three-part distribution verified by the author on November 9, 2026. This is a packaging refactor only, **not** a new mathematical or domain conclusion. The first two `.lean` files are the exact frozen source bytes. The third file combines the unchanged body of the congressional APP contract, the Stage-A invariant definitions (with its mid-file `import Init` omitted as in the verified combined check), and the unchanged bridge. Their provenance dividers remain visible.

## Why these three files

- `Structural_Flow_Universal_Kernel_v1.0.lean`: general foundation, reusable beyond this congressional application.
- `SF_DN_FND_CP_General_v0.8.lean`: conditional domain foundation for constitutional physiology.
- `CMA_Congressional_Maintenance_Contract_v0.1.lean`: congressional repair application interface + 13-area Stage-A architecture + bridge registering its seven schema burdens with the upstream formal interfaces.

These are **three appendable source segments**, not three independently importable Lean modules. The code is intended to be assembled in the order above. Calling the third file a "contract" denotes a formal application interface, not a contract that human users must accept or an independent proof of any legal/empirical conclusion.

## Reproduce the exact successful source (Windows PowerShell 5.1)

Run the following from the directory containing the three `.lean` files, after installing Lean 4.34.0. It writes a generated combined check and stops unless the combined source matches the **exact SHA-256** of the source that passed Lean 4.34.0 on November 8 **and November 9**, 2026.

```powershell
$kernel = 'Structural_Flow_Universal_Kernel_v1.0.lean'
$adapter = 'SF_DN_FND_CP_General_v0.8.lean'
$contract = 'CMA_Congressional_Maintenance_Contract_v0.1.lean'
$output = 'CMA_Generated_Combined_Check.lean'
$header = "`n`n/- ===== BEGIN SOURCE 1: Structural_Flow_Universal_Kernel_v1.0.lean ===== -/`n"
$middle1 = "`n/- ===== END SOURCE 1 ===== -/`n`n`n/- ===== BEGIN SOURCE 2: SF_DN_FND_CP_General_v0.8.lean ===== -/`n"
$middle2 = "`n/- ===== END SOURCE 2 ===== -/`n`n`n"

$stream = [System.IO.File]::Create((Join-Path (Get-Location).Path $output))
try {
    $b = [Text.Encoding]::UTF8.GetBytes($header); $stream.Write($b, 0, $b.Length)
    $b = [IO.File]::ReadAllBytes((Resolve-Path $kernel).Path); $stream.Write($b, 0, $b.Length)
    $b = [Text.Encoding]::UTF8.GetBytes($middle1); $stream.Write($b, 0, $b.Length)
    $b = [IO.File]::ReadAllBytes((Resolve-Path $adapter).Path); $stream.Write($b, 0, $b.Length)
    $b = [Text.Encoding]::UTF8.GetBytes($middle2); $stream.Write($b, 0, $b.Length)
    $b = [IO.File]::ReadAllBytes((Resolve-Path $contract).Path); $stream.Write($b, 0, $b.Length)
} finally {
    $stream.Dispose()
}

$expected = '58a6be8731efaeb83926158225f31fc7be2ffd8edd2afa3a87a4c6b5f8d49290'
$actual = (Get-FileHash -Algorithm SHA256 -LiteralPath $output).Hash.ToLowerInvariant()
if ($actual -ne $expected) { throw "Combined source hash mismatch: $actual" }
Write-Host "Exact verified source reproduced: $actual"
lean --version
& lean $output
if ($LASTEXITCODE -ne 0) { throw "Lean failed with exit code $LASTEXITCODE" }
Write-Host 'Lean completed successfully.'
```

## Recorded reproducibility results

**Source identity:** the three distributed files assembled in the order above reproduce a combined source of **632,752 bytes** with SHA-256:

`58a6be8731efaeb83926158225f31fc7be2ffd8edd2afa3a87a4c6b5f8d49290`

**November 8, 2026:** A user-recorded Windows PowerShell check under Lean 4.34.0 passed with exit code 0, both completion markers present, and empty captured stderr. A separate sample of four declarations found no `sorryAx`: two reported no axioms and two reported only `propext`.

**November 9, 2026:** The same user assembled the three distributed files using the recorded PowerShell procedure. The generated combined source matched the exact hash above. Lean 4.34.0 (`x86_64-w64-windows-gnu`, commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`) ran from **21:09:15 to 21:09:39 UTC−07:00**, exited with code **0**, printed both expected markers, and produced a **0-byte stderr log**. The PowerShell transcript of the run was provided to the project; the complete original logs remain on the user's laptop unless separately archived. This publication environment independently checked the combined source hash and packaging, **not** the Lean execution.

Expected standard output on the recorded run:

```text
"CMA_STAGE_A_END_OF_FILE_REACHED"
"CMA_STAGE_A_KERNEL_CP_BRIDGE_END_OF_FILE_REACHED"
```

Successful compilation means Lean accepts the encoded declarations and proofs under their stated premises. The four-declaration axiom review is a *sample*, not a comprehensive check of all theorem dependencies. The combined file must be reassembled before running; the individual three files are not presently independent importable modules.

### Distributed component hashes

| File | SHA-256 |
|---|---|
| `Structural_Flow_Universal_Kernel_v1.0.lean` | `b455ec869d062f0fc05d239c5006c843165cd598edbd8c35eae442ff471689a3` |
| `SF_DN_FND_CP_General_v0.8.lean` | `46038e9dae55a9c57ff7cd1131b7650cf6acc6bd4df966fdde83673cf2bea0da` |
| `CMA_Congressional_Maintenance_Contract_v0.1.lean` | `872deb1bb55cf743371fbf8faa72908d27de44f7f691c2d36caf6be858c4e042` |


## For human + LLM experimentation

Start with a question worth investigating and the relevant primary records. Give an LLM the Prospectus, Atlas, Inquiry Worksheet, this verification note, and the smallest formal source relevant to the task. For other domains, begin with the general Kernel and explicitly define and test new domain assumptions rather than importing constitutional conclusions. Ask it to identify the particular assumptions, declarations, and obligations it would use. Keep new ideas in a separate copy and run Lean on any proposed extensions. Distinguish what the model proves from what evidence and law establish. No approval of the original author is needed to investigate or propose alternatives, subject to the final reuse license.

**Scope limit:** The assembled model proves only the claims encoded at their stated conditional scope. Core admission, certified real civic applications, historical facts, legal sufficiency, fiscal sufficiency, and legislative feasibility remain separate tasks.
