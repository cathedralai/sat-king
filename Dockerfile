# sat-king v0 — launch champion: kissat (pinned release), Mode A per CHAMPION-CONTRACT.md
# Reads DIMACS at /input.cnf (mounted by Polaris), prints SAT-competition output,
# exits 10/20/0. Deterministic stdout: -q (only s/v lines), single-threaded.
FROM alpine:3.20 AS build
RUN apk add --no-cache build-base bash
ADD https://github.com/arminbiere/kissat/archive/refs/tags/rel-4.0.2.tar.gz /kissat.tgz
RUN tar xzf /kissat.tgz && cd kissat-rel-4.0.2 && ./configure && make && \
    cp build/kissat /usr/local/bin/kissat

FROM alpine:3.20
COPY --from=build /usr/local/bin/kissat /usr/local/bin/kissat
# Mode A: self-contained entrypoint — Polaris just mounts /input.cnf and runs the image.
# Shell entrypoint (never the bare solver), solver on PATH. -q => deterministic stdout.
ENTRYPOINT ["sh","-c","exec kissat -q /input.cnf"]
