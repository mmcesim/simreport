%%
%% simreport.cls
%% -------------------------------------------
%% LaTeX Class Template for Simulation Report
%%
%% Author: Wuqiong Zhao
%% License: MIT
%% Date: 2022/09/05
%% Version: 0.0.1

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simreport}[2022/09/05 Simulation Report]

%% Class and Options
\RequirePackage{xkeyval}
\def\@@ptsize{10pt} % font size
\DeclareOptionX{9pt}{\def\@@ptsize{9pt}}
\DeclareOptionX{10pt}{\def\@@ptsize{10pt}}
\DeclareOptionX{11pt}{\def\@@ptsize{11pt}}
\DeclareOptionX{12pt}{\def\@@ptsize{12pt}}
\def\@@papersize{a4paper}
\DeclareOptionX{a4paper}{\def\@@papersize{a4paper}}
\DeclareOptionX{letterpaper}{\def\@@papersize{letterpaper}}
\def\@@solutionmode{1} % default as the solution mode
\DeclareOptionX{solution}{\def\@@solutionmode{1}} % solution mode
\DeclareOptionX{problem}{\def\@@solutionmode{0}} % problem mode
\def\@twoside{0} % default as oneside
\DeclareOptionX{oneside}{\def\@twoside{0}} % one-side document
\DeclareOptionX{twoside}{\def\@twoside{1}} % two-side document
\ProcessOptionsX\relax
\LoadClass[onecolumn,\@@ptsize]{article}

%% Save title, author and date information
% \RequirePackage{titling}

%% Page Settings
\RequirePackage[\@@papersize,inner=2.0cm,outer=2.0cm,top=1.2cm,bottom=3.5cm]{geometry}

%% Document Propertities
\global\let\@date\today
\global\let\@rtime\@empty
\global\let\@simapp\@empty
\global\let\@version\@empty
\global\let\@logo\@empty
\newcommand{\simapp}[1]{\gdef\@simapp{#1}} % simulation app name
\newcommand{\rtime}[1]{\gdef\@rtime{#1}} % report generation time
\newcommand{\version}[1]{\gdef\@version{#1}} % simulation app version
\newcommand{\logo}[1]{\gdef\@logo{#1}} % simulation app logo

% additional height for footer on the first page
\newcommand{\firstfooteradditionalheight}{\ifx\@logo\@empty30pt\else60pt\fi}
%% Captions Settings
\RequirePackage[font=footnotesize,labelfont=bf]{caption}

%% Header and Footer
\RequirePackage{fancyhdr}
\setlength{\headheight}{52pt}
\setlength{\marginparwidth}{2cm}
\pagestyle{fancy}
\if\@twoside0
  \lhead{\textsc{\@title} -- \@author}
  \rhead{\textsf{\@simapp}}
\else
  \fancyhead[LO]{\textsc{\@title} -- \@author}
  \fancyhead[RE]{\textsf{\@simapp}}
\fi

\RequirePackage{multirow}
\fancypagestyle{firstpage}{
  \renewcommand\headrule{}
  \lhead{}
  \rhead{}
  \cfoot{%
    \vspace*{-\firstfooteradditionalheight}%
    \hrule%
    \begin{center}
      \ifx\@logo\@empty
        Simulated by \@simapp.
        Report generated at \@date\ifx\@rtime\@empty\else, \@rtime\fi.
      \else
        \vspace*{-2.5em}
        \renewcommand{\arraystretch}{2}
        \begin{tabular}{ll@{\hspace{12pt}}|l}
          ~\\
          \multirow{2}{*}{\includegraphics[height=5em]{\@logo}} & Simulated by
          & v\@version \\
          & {\fontsize{20.74}{28}\selectfont\textsf{\@simapp}} &
          Report generated at \@date\ifx\@rtime\@empty\else, \@rtime\fi.
        \end{tabular}
      \fi
    \end{center}
  }
}

\RequirePackage{graphicx}
\renewcommand{\@maketitle}{%
  \begin{center}
    {\huge\textbf{\@title}}\\[1\baselineskip]

    {\large\@author}\vspace*{2\baselineskip}
  \end{center}
}
\renewcommand{\maketitle}{\par
  \begingroup
  \newpage
  \global\@topnum\z@ % Prevents figures from going at top of page.
  \@maketitle
  \endgroup
  \thispagestyle{firstpage}
  \enlargethispage{-\firstfooteradditionalheight} % make room for the footer
}
