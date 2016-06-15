%% 
%% FILE: fonetik.cls
%%
%% USAGE:    \documentclass{fonetik}
%%
%% PURPOSE: LaTeX2e class file for the Fonetik conference.
%%
%% ADDITIONAL COMMANDS:
%%  \affil{} for the affiliation (from package affil-it)
%% 
%% Copyright 2016 Giampiero Salvi 
%% 
%% The author is not responsible for the layout definition, but
%% only for its implementation
%% 
%% This system is distributed in the hope that it will be useful, 
%% but WITHOUT ANY WARRANTY; without even the implied warranty of 
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
%% 
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{fonetik}
\DeclareOption{a5paper}
    {\ClassError{proc}{Option `a5paper' not supported}{}}
\DeclareOption{b5paper}
    {\ClassError{proc}{Option `b5paper' not supported}{}}
\DeclareOption{onecolumn}%
    {\ClassError{proc}{Option `onecolumn' not supported}{}}
\DeclareOption{titlepage}%
    {\ClassError{proc}{Option `titlepage' not supported}{}}
\PassOptionsToClass{twoside,10pt,twocolumn}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\RequirePackage[paperwidth=165mm,
                paperheight=242mm,
                top=0mm,
                lmargin=22.5mm,
                rmargin=22.5mm,
                tmargin=17.5mm,
                bmargin=18.5mm]{geometry}
\RequirePackage{times}
\RequirePackage[affil-it]{authblk}
\RequirePackage{etoolbox}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titling}
%\RequirePackage{fontspec}
% gap between columns
\setlength{\columnsep}{6mm}
% disable section numbering
\setcounter{secnumdepth}{0}
% disable page numbering
\pagenumbering{gobble}
% lift up title
\setlength{\droptitle}{-2.5em}
% Specify different font for section headings
\makeatletter
\patchcmd{\@maketitle}{\LARGE \@title}{\fontsize{12}{13}\bfseries\@title}{}{}
\makeatother
\renewcommand\Authfont{\fontsize{10}{11}\itshape}
\renewcommand\Affilfont{\fontsize{10}{11}\itshape}
\titleformat*{\section}{\fontsize{11}{12}\bfseries}
\titleformat*{\subsection}{\fontsize{10}{11}\bfseries}
\titleformat*{\subsubsection}{\fontsize{10}{11}\itshape}
% specify spacing at section headings
\titlespacing\section{0pt}{6pt plus 4pt minus 2pt}{3pt plus 2pt minus 2pt}
\titlespacing\subsection{0pt}{6pt plus 4pt minus 2pt}{3pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{6pt plus 4pt minus 2pt}{3pt plus 2pt minus 2pt}
% disable date
\date{\vspace{-5ex}}
% amount of indentation for paragraphs after the first
\setlength{\parindent}{6mm}
% this is to balance the columns in the last page. Ugly as hell, but required
\RequirePackage{flushend}
\endinput
