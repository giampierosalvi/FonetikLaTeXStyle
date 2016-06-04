%% 
%% FILE: qpsr.cls
%%
%% USAGE:    \documentclass[a4paper,twoside,12pt]{qpsr}
%%
%% PURPOSE: LaTeX2e class file for the QPSR publication.
%%
%% ADDITIONAL COMMANDS:
%%  \affiliation{} still very rudimental
%%  \abstracttext{} use this in the preamble to define the abstract
%%     text. Then \maketitle is sufficient to create the abstract
%%  \volume{} defines the QPSR volume
%%  \pubyear{} defines publication year
%%  \firstpage{} defines the first page of the document
%% The last two are used for the headers (ask Cathrin for the values)
%% 
%% Copyright 2004 Giampiero Salvi 
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
%\PassOptionsToClass{twocolumn}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\RequirePackage{fancyhdr}
\RequirePackage{times}
\RequirePackage{balance}
\RequirePackage{lastpage}
\RequirePackage[round]{natbib}
\setlength{\bibhang}{0.8em}
\setlength{\bibsep}{0em}
\newcommand{\bibfont}{\small}
\RequirePackage{caption2}
\renewcommand{\captionfont}{\itshape}

% ******************************
% Font stuff
% ******************************
%\renewcommand\normalsize{%
%   \@setfontsize\normalsize\@ixpt{12}%
%   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
 %  \abovedisplayshortskip \z@ \@plus2\p@
%   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
%   \def\@listi{\leftmargin\leftmargini
%               \topsep 4\p@ \@plus2\p@ \@minus2\p@
%               \parsep 2\p@ \@plus\p@ \@minus\p@
%               \itemsep \parsep}%
%   \belowdisplayskip \abovedisplayskip
%}

% ******************************
% 
% ******************************

%\pagestyle{empty}

%
% Page layout
%

\setlength\oddsidemargin{0.8in}
\setlength\evensidemargin{0.8in}
\setlength\marginparwidth {0in}
\setlength\textwidth{6.3in}
\setlength\topmargin{1.1in}
\setlength\textheight{8.8in}
\setlength\columnsep{0.2in}
\setlength\headheight{0in}
\setlength\headsep{0in}
\setlength\hoffset{-1.0in}
\setlength\voffset{-1.0in}
\addtolength{\voffset}{-1.8cm}
\addtolength{\hoffset}{.5cm}
%\setlength\parskip{0pt}
%\parindent 1.5em
\columnsep 0.8cm 
\textheight=24.7cm \textwidth=16cm
% sections are not numbered
\setcounter{secnumdepth}{0}

\renewcommand{\baselinestretch}{.9}
% how bad straching can be before an overfull box is produced
\tolerance=9999


\def\maketitle{\par
 \begingroup
   \renewcommand\thefootnote{\fnsymbol{footnote}}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
     \long\def\@makefntext##1{\parindent 1em\noindent
             \hb@xt@1.8em{%
                 \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
   \twocolumn[\@maketitle]%
   \@thanks
 \endgroup
 \setcounter{footnote}{0}%
 \let\maketitle\relax
 \let\@maketitle\relax
% \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax}
 \gdef\@thanks{}\let\thanks\relax}

\newcommand{\IC@affiliation}{}
\newcommand{\affiliation}[1] {\renewcommand{\IC@affiliation}{#1}}
\newcommand{\IC@abstract}{}
\newcommand{\abstracttext}[1] {\renewcommand{\IC@abstract}{#1}}

\def\@maketitle{%
  \vbox to 1.25in{%
    \hsize\textwidth
    \linewidth\hsize
    \vfil
    %\centering
    {\huge\bfseries \noindent \@title \par}
    \vskip 2em
    {\normalsize \fontsize{11}{15}\itshape \@author \par}
    \vskip 1em
    {\large \noindent \itshape \IC@affiliation \par} 
    \vskip 1em
    \vfil}
  \parbox{13.0 cm}{%
    {\fontsize{13}{16} \selectfont \itshape \bfseries \abstractname \par}
    \vskip 1em
    \fontsize{11}{14} \selectfont \itshape \IC@abstract} \vskip 2em
}
\def\copyrightspace{%
  \footnotetext[0]{\mbox{}\vrule \@height 97\p@ \@width \z@}}

\renewcommand{\@seccntformat}[1]{{\csname the#1\endcsname}.\quad}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-1.25ex plus -1ex minus -.2ex}%
                                   {1.5ex plus .2ex}%
                                   {\normalfont\LARGE\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1.25ex plus -1ex minus -.2ex}%
                                     {1.5ex plus .2ex}%
                                     {\normalfont\Large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-1.25ex plus -1ex minus -.2ex}
                                     {1.5ex plus .2ex}%
                                     {\normalfont\bfseries}}
\renewcommand{\abstractname}{\textit{\textbf{Abstract}}}
\renewenvironment{abstract}%
  {\section*{\abstractname}}{\par}

%%%%%%%%%% headers and footers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\IC@volume}{}
\newcommand{\volume}[1] {\renewcommand{\IC@volume}{#1}}
\newcommand{\IC@pubyear}{}
\newcommand{\pubyear}[1] {\renewcommand{\IC@pubyear}{#1}}
\newcommand{\IC@firstpage}{}
\newcommand{\firstpage}[1] {\renewcommand{\IC@firstpage}{#1}%
  \setcounter{page}{\IC@firstpage}%
}
\pagestyle{fancy}
\fancyfoot[CE,CO]{} % get rid of the central page numbering
\fancyfoot[LE,RO]{\large \thepage} %pages on left-odd,right-even sides
\fancyfoot[LO]{\it Speech, Music and Hearing, KTH, Stockholm,
  Sweden\\ TMH-QPSR Volume \IC@volume:\IC@firstpage -\pageref{LastPage},\IC@pubyear}
\fancyhead[LE]{\large \it \@author : \@title }
\fancyhead[RE]{} \fancyhead[LO]{}%get rid of everything else other than what you specified
\fancyhead[RO]{\large \it TMH-QPSR, KTH, Vol. \IC@volume/\IC@pubyear}
\renewcommand{\headrulewidth}{0pt}       % edit these for changing
%\renewcommand{\headheight}{15pt}       % edit these for changing
\addtolength{\headsep}{1cm}
\gdef\@author{}\gdef\@title{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
