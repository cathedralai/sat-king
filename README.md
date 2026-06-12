# sat-king — the reigning SAT champion image

The king-of-the-hill arena's artifact: a digest-pinned, deterministic SAT solver image,
served as an attested service via Polaris. Contract: reads DIMACS at `/input.cnf`,
prints SAT-competition output (`s ...` / `v ... 0`), exits 10 (SAT) / 20 (UNSAT) / 0.

v0 launch champion: **kissat rel-4.0.2** (Mode A — self-contained entrypoint).
Pull by digest, never `:latest`. Crowning a new king = a new digest in the
current-champion manifest; the image contract never changes.
