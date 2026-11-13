# LaTeX Paper Template
A basic template for writing in LaTeX, quickly.

## Requirements

* TeX Live/MacTeX 2020+ (though older will likely work)
* LuaLaTeX
* Biber

This project tries to use minimal and widely-available LaTeX packages. Any
recent TeX Live installation should provide all of the packages you need.

## Using this template
### As a standalone project
Download a [ZIP file](https://github.com/educelab/latex-template/archive/refs/heads/main.zip)
or [Tarball](https://github.com/educelab/latex-template/archive/refs/heads/main.tar.gz)
containing the latest version of the source code. Open `main.tex` in your
favorite plain text editor and begin writing!

### As a git project
1. On this repository's GitHub page, click **Use this template** →
   **Create a new repository**
2. Set the name and details for your new repository and click
   **Create repository**
3. Clone your new repository with `git clone --recurse-submodules` so that the
   `bibtex-refs` submodule is downloaded too (or run
   `git submodule update --init` after cloning)
4. Open `main.tex` in your favorite plain text editor and begin writing!

## Build a PDF
This project provides a `latexmkrc` file to make compilation of your document
easy. Latexmk is an excellent program which automatically runs LaTeX and Biber
the correct number of times needed to resolve all references.
To build a PDF using this system, open a shell in the root of this project and
run:

```shell
latexmk
```

The compiled PDF can be found in `build/main.pdf`.

As a convenience, we also provide a `Makefile` that aliases `latexmk` under various configurations:
```shell
make               # latexmk
make rebuild       # latexmk -gg
make clean         # latexmk -C
make clean-build   # latexmk -c
```

## EduceLab BibTeX References
The [BibTeX References](https://gitlab.com/educelab/publications/bibtex-refs)
library is included as the `bibtex-refs` git submodule. To use it, uncomment
`\input{bibtex-refs/add-all-biblatex}` in `main.tex` and cite entries with
`\cite{}` as usual. If your project is not a git clone, download a copy of
`bibtex-refs` and place it in the root of this project.

The submodule is pinned to a release of the library. To move to a newer one:

```shell
git -C bibtex-refs fetch --tags
git -C bibtex-refs checkout <tag>   # e.g. v2.0.0
git add bibtex-refs && git commit -m "Update bibtex-refs"
```

Releases follow semver; see the library's `CHANGELOG.md` before taking a new
major version.

## Automatic GitHub Actions Builds
This template provides a GitHub Actions workflow
(`.github/workflows/build.yml`) that builds your document on every push and
pull request using the official [TeX Live Docker image](https://hub.docker.com/r/texlive/texlive).
The `bibtex-refs` submodule is checked out automatically. The resulting PDF is
attached to each workflow run as a downloadable artifact in the **Actions** tab
of your repository.
