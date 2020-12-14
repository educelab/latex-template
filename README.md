# Latex Paper Template
A basic template for writing in Latex, quickly.

## Requirements

* TexLive/MacTex 2020+ (though older will likely work)
* LuaTeX
* Biber

This project tries to use minimal and widely-available LaTeX packages. Any
recent TexLive installation should provide all of the packages you need.

## Using this template
### As a standalone project
Download a [ZIP file](https://code.cs.uky.edu/seales-research/template-projects/latex-paper-template/-/archive/master/latex-paper-template-master.zip)
or [Tarball](https://code.cs.uky.edu/seales-research/template-projects/latex-paper-template/-/archive/master/latex-paper-template-master.tar.gz)
containing the latest version of the source code. Open `main.tex` in your
favorite plain text editor and begin writing!

### As a git project
This project is enabled as a template project for the EduceLab group on our
[private GitLab server](https://code.cs.uky.edu). This means you can
instantiate a new Git project through the GitLab interface:

1. On the **New project** page, select the **Create from template** option.
2. In the template selector list, select the **Group** tab
3. Find **Latex Paper Template** and click **Use template**
4. Set the name and details for your new project and click **Create project**
5. Clone your new project to your computer
    - If you are planning on using the [BibTex References](https://code.cs.uky.edu/seales-research/papers/bibtex-refs) project, you can clone with `git clone --recursive` (git 1.9-2.12) or `git clone --recurse-submodules` (git 2.13+)
6. Open `main.tex` in your favorite plain text editor and begin writing!

### Build a PDF
This project provides a `latexmk` file to make compilation of your document
easy. Latexmk is an excellent program which automatically runs Latex and BibTex
the correct number of times needed to resolve all references.
To build a PDF using this system, open a shell in the root of this project and
run:

```shell
latexmk
```

The compiled PDF can be found in `build/main.pdf`, and a
compressed version can be found in `build/main-compressed.pdf`.

As a convenience, we also provide a `Makefile` that aliases `latexmk` under various configurations:
```shell
make               # latexmk
make rebuild       # latexmk -gg
make clean         # latexmk -C
make clean-build   # latexmk -c
```

## Automatic GitLab CI Builds
This template provides a `.gitlab-ci.yml` file which enables automatic CI
builds of your document when you push to a GitLab server. To use, make sure
your GitLab project has access to a Docker CI runner tagged `docker`, then push
your document changes to your repository. The build status and resulting PDFs
can be found in the **CI/CD** section of your repository.

### bibtex-refs submodule
If you are using the BibTex references submodule in your project, you need to
customize the CI configuration so that GitLab can access this (currently)
private project when doing CI builds.

First, open `.gitlab-ci.yml` and uncomment `GIT_SUBMODULE_STRATEGY: normal`.
Next, open `.gitmodules` and change the URL for `bibtex-refs` to that project's
*relative location* to your project on the GitLab server. For example:

```shell
# BibTex References URL
https://code.cs.uky.edu/seales-research/papers/bibtex-refs.git

# Paper in personal namespace
https://code.cs.uky.edu/my-name/my-paper.git                 # Paper URL
../../seales-research/papers/bibtex-refs.git                 # .gitmodules

# Paper in group namespace
https://code.cs.uky.edu/seales-research/papers/my-paper.git  # Paper URL
../bibtex-refs.git                                           # .gitmodules
```

Add and commit both of these changes to your repository.
