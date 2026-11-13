# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

The EduceLab LaTeX paper template: a minimal starting point that users copy (or create from via GitHub's **Use this template**) and then write their own paper in `main.tex`. Changes here should stay minimal and rely only on packages available in a stock TeX Live install. The template is intentionally plain-styled because papers get reformatted for the target venue later.

## Build

Requires TeX Live 2020+ with LuaLaTeX and Biber.

```shell
latexmk            # or: make           -> build/main.pdf
latexmk -gg        # or: make rebuild   (force full rebuild)
latexmk -C         # or: make clean     (remove all generated files incl. PDF)
latexmk -c         # or: make clean-build (remove aux files, keep PDF)
```

There are no tests or linters; a successful `latexmk` run is the check. Output and all aux files go to `build/`.

## How the pieces fit

- `latexmkrc` drives everything: LuaLaTeX (`$pdf_mode = 4`), output to `build/`, default target `main.tex`.
- Bibliography uses **biblatex + biber**, not BibTeX. `refs.bib` is the local bib file.
- `bibtex-refs/` is a git submodule of EduceLab's shared reference library (hosted on GitLab, pinned to a release tag). Enabling it is a single `\input{bibtex-refs/add-all-biblatex}` in `main.tex`; that upstream file lists its `.bib` files with paths relative to `bibtex-refs/`, which resolve because `latexmkrc` passes `--input-directory=bibtex-refs/` to biber. Don't duplicate the upstream `.bib` list in this repo. Upstream follows semver and keeps renamed keys as `ids` aliases, so old citation keys keep working across minor releases.
- CI is GitHub Actions (`.github/workflows/build.yml`): checks out with submodules, runs `latexmk` inside the `texlive/texlive:latest` Docker image, and uploads `${PAPER_NAME}-<datetime>.pdf` as a run artifact. `PAPER_NAME` is the artifact prefix only; the build always compiles `main.tex`.
- `main.tex` content between `%%% BEGIN TEMPLATE TEXT %%%` and `%%% END TEMPLATE TEXT %%%` is example/instructional text meant to be deleted by users. Instructions in that text (build steps, submodule setup) duplicate `README.md`, so keep the two in sync when either changes.
