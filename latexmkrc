$pdf_mode = 4;  # LuaLaTeX
$lualatex = 'lualatex -interaction=nonstopmode -file-line-error %O %S';
$biber = 'biber --input-directory=bibtex-refs/ %O %S';
$bibtex_use = 2;
$silent = 1;
$out_dir = 'build';
@default_files = ('main.tex');
