%% ident "@(#)ibeo-doc.cls	0.6 (LAEI) 2020-10-13"
%% Copyright (C) 2020 Ibeo Automotive Systems GmbH
%%
%% 2020-10-13 (0.6)	Lasse Einig (LAEI) lasse.einig@ibeo-as.com
%%		- Add subfigure package
%%		- Add textcomp package for textbullets
%%		- Add ShortTitle command, allowing shorter title in header
%%		- Add short month names for ngerman
%%		- Fix the header length for title
%%      - Add wrapfig package
%%      - Add pdfpages package
%% 2020-01-23 (0.5)	Lasse Einig (LAEI) lasse.einig@ibeo-as.com
%%		- Fix missing dash in Document Identifier if no ConsNo is given and
%%        line break if Identifier is empty
%% 2020-01-22 (0.4)	Lasse Einig (LAEI) lasse.einig@ibeo-as.com
%%		- Added English for Abbreviations and Terms
%% 2020-01-08 (0.3)	Lasse Einig (LAEI) lasse.einig@ibeo-as.com
%%		- Use Corporate date format
%%		- Align math font with corporate font
%%		- Add links to glossary
%%		- Change bold font to semi-bold
%% 2020-01-06 (0.2)	Lasse Einig (LAEI) lasse.einig@ibeo-as.com
%%		- Add bibtex option
%%      - Add Corporate font
%% 2019-11-28 (0.1)	Lasse Einig (LAEI) lasse.einig@ibeo-as.com
%%		- Create class file for Ibeo Documents
%%
%% This file is only for internal use at Ibeo Automotive Systems GmbH
%% an may not be redistributed and/or modified.
%
% ---- Main Data ---------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1999/12/01]%
\ProvidesClass{ibeo-doc}[2020/10/13]%
% ---- Declaration of Options --------------------------------------------------
\newif\if@engl% Add english option to class, LAEI
\@englfalse%
\DeclareOption{engl}{\@engltrue%
	\typeout{-local option: engl             2019/11/28}}%
\newif\if@figindex% Add no Index of Figures to class, LAEI
\@figindextrue%
\DeclareOption{nofigindex}{\@figindexfalse%
	\typeout{-local option: nofigindex       2019/11/28}}%
\newif\if@tabindex% Add no Index of Tables to class, LAEI
\@tabindextrue%
\DeclareOption{notabindex}{\@tabindexfalse%
	\typeout{-local option: notabindex       2019/11/28}}%
\newif\if@abbindex% Add no Index of Abbreviations and Terms to class, LAEI
\@abbindextrue%
\DeclareOption{noabbindex}{\@abbindexfalse%
	\typeout{-local option: noabbindex       2019/11/28}}%
\newif\if@centralgloss% Add central QM glossary to class, LAEI
\@centralglossfalse%
\DeclareOption{centralgloss}{\@centralglosstrue%
	\typeout{-local option: centralgloss     2019/11/28}}%
\newif\if@bibtex% Add BibTeX option to class, LAEI
\@bibtexfalse%
\DeclareOption{bibtex}{\@bibtextrue%
	\typeout{-local option: bibtex           2020/01/06}}%
\newif\if@toc% Add no Index of Abbreviations and Terms to class, LAEI
\@toctrue%
\DeclareOption{notoc}{\@tocfalse%
	\typeout{-local option: notoc            2019/11/28}}%
\newif\if@release% Add no Index of Abbreviations and Terms to class, LAEI
\@releasetrue%
\DeclareOption{norelease}{\@releasefalse%
	\typeout{-local option: norelease        2019/11/28}}%
\newif\if@history% Add no Index of Abbreviations and Terms to class, LAEI
\@historytrue%
\DeclareOption{nohistory}{\@historyfalse%
	\typeout{-local option: nohistory        2019/11/28}}%


\PassOptionsToClass{10pt,a4paper,fleqn}{article}%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}%
\ProcessOptions%
\LoadClass{article}%

% ---- Initialization ----------------------------------------------------------
\if@engl% LAEI
	\RequirePackage[english]{babel}% english
\else%
	\RequirePackage[ngerman]{babel}% german
\fi%
\RequirePackage[utf8]{inputenc}% special characters, LAEI->utf8
\RequirePackage[T1]{fontenc}% encoding
\RequirePackage{ifthen}% logic operations, LAEI
\RequirePackage{mathptmx}% math font adjustment
\RequirePackage{amsmath}% math stuff
\RequirePackage{amssymb}% for natural numbers etc. \mathbb{}
\RequirePackage[subfigure]{tocloft}% dots in TOC for section
\RequirePackage{subfigure} % LAEI
\RequirePackage[table]{xcolor}% colors
\RequirePackage[% page borders
	lmargin = 2.1cm,%
	rmargin = 2.1cm,%
	tmargin = 2.6cm,%
	bmargin = 5.0cm%
]{geometry}%
\RequirePackage{here}% figures command [H]
\RequirePackage{fancyhdr}% page style
\RequirePackage{calc}% counters
\RequirePackage{lastpage}% page count for last page \pageref(LastPage)
\RequirePackage{graphicx}% graphics
\RequirePackage{titlesec}% section title manipulation
\RequirePackage[font={small,color=B}]{caption}% smaller captions
\RequirePackage{eso-pic}% vertical text on the side
\RequirePackage[% links, load as last package
	plainpages=false,%
	colorlinks=true,%
	linkcolor=R,%
	citecolor=R,%
	filecolor=R,%
	menucolor=R,%
	urlcolor=R%
]{hyperref}%
\RequirePackage{wrapfig}
\RequirePackage{pdfpages}

% ---- Use Corporate font ------------------------------------------------------
\RequirePackage[regular,semibold,default]{sourcesanspro}
\RequirePackage[Symbol]{upgreek}% upright greek letters
\RequirePackage{textgreek}
\RequirePackage{textcomp}% LAEI for textbullets

% ---- Use Corporate date ------------------------------------------------------
\RequirePackage[short,nodayofweek]{datetime}

% ---- Silence warnings --------------------------------------------------------
\RequirePackage{silence}% silence filecontents warning, LAEI
\WarningFilter{latex}{File `releaseInfo.tex' already exists on the system}% supress file overwrite warning for releaseInfo table, LAEI
\WarningFilter{latex}{Writing or overwriting file `./releaseInfo.tex'}%
\WarningFilter{latex}{File `changeHistory.tex' already exists on the system}% supress file overwrite warning for releaseInfo table, LAEI
\WarningFilter{latex}{Writing or overwriting file `./changeHistory.tex'}%
\WarningFilter{latex}{Writing or overwriting file `./terms.tex'}%
\WarningFilter{latex}{Writing or overwriting file `./abbreviations.tex'}%
\WarningFilter{latex}{Tab has been converted to Blank Space}% supress blank space warnings, LAEI

% ---- Indentation -------------------------------------------------------------
\setlength{\parindent}{0pt}% do not indent paragraphs, LAEI
\setlength{\parskip}{.5em}% vertical separation of paragraphs, LAEI


% ---- Parameters --------------------------------------------------------------
\graphicspath{{images/}}% custom directory for images, LAEI->common path
\setlength{\headheight}{65pt}% fancyhead head spacing

% ---- Ibeo Colors -------------------------------------------------------------
\definecolor{R}{rgb}{0.819608, 0.054902, 0.133333}% ibeo Red
\definecolor{W}{rgb}{1, 1, 1}% ibeo White
\definecolor{G}{rgb}{0.698039, 0.682353, 0.686275}% ibeo Gray
\definecolor{B}{rgb}{0, 0, 0}% full Black (this is the main text font)
\definecolor{LG}{rgb}{0.94902, 0.94902, 0.94902}% lighter Gray

%Vertical text on the side
\AddToShipoutPictureBG{%
	\AtPageLowerLeft{%
		\if@engl% LAEI
			\put(\LenToUnit{1cm},\LenToUnit{3cm}){%
				\rotatebox{90}{\color{B} \tiny FLT-QM-003 / Document template / As at: 12. Sep. 2019}
			}%
		\else%
			\put(\LenToUnit{1cm},\LenToUnit{3cm}){%
	 			\rotatebox{90}{\color{B} \tiny FLT-QM-003 / Dokumentenvorlage / Stand: 10. Apr. 2019}%
	 		}%
 		\fi%
 	}%
}%

% ---- Commands ----------------------------------------------------------------
\renewcommand{\familydefault}{\sfdefault}% Sans Serif

\if@engl% LAEI
	\addto\captionsenglish{% Short captions
		\renewcommand{\figurename}{\color{B}Fig.}%
		\renewcommand{\tablename}{\color{B}Tab.}%
	}%
\else%
	\addto\captionsngerman{% Short captions
		\renewcommand{\figurename}{\color{B}Abb.}%
		\renewcommand{\tablename}{\color{B}Tab.}%
	}%
\fi%

\renewcommand{\baselinestretch}{1.3}% Line spacing
\renewcommand{\arraystretch}{1.1}% Table row spacing
\renewcommand{\headrule}{% Horizontal header  line
	{\color{R}\hrule width\headwidth height .5pt \vskip-\headrulewidth}%
}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}% Section dots TOC
\newcommand{\hlineRed}{% Red horizontal tabular line
	\noalign{\global\arrayrulewidth=1pt}\arrayrulecolor{R}\hline\arrayrulecolor{B}\noalign{\global\arrayrulewidth=0.4pt}%
}

% ---- Input Definitions for Document ------------------------------------------
\def\docTitle#1{\gdef\@docTitle{#1}}
\def\@docTitle{\#Document title\#}
\def\docShortTitle#1{\gdef\@docShortTitle{#1}}
\def\@docShortTitle{}
\def\docType#1{\gdef\@docType{#1}}
\def\@docType{\#Type\#}
\def\docOrg#1{\gdef\@docOrg{#1}}
\def\@docOrg{\#Org\#}
\def\docConsNo#1{\gdef\@docConsNo{#1}}
\def\@docConsNo{\#cons.No\#}
\def\docDateVersion#1{\gdef\@docDateVersion{#1}}
\def\@docDateVersion{\#Date/Version\#}
\def\docStatus#1{\gdef\@docStatus{#1}}
\def\@docStatus{\#Status\#}
\def\docArchive#1{\gdef\@docArchive{#1}}
\def\@docArchive{\#computer system, path of folder or paper archive\#}
\def\docScope#1{\gdef\@docScope{#1}}
\def\@docScope{Ibeo AS GmbH}
\def\docConfidentiality#1{\gdef\@docConfidentiality{#1}}
\def\@docConfidentiality{confidential}
\def\docRevision#1{\gdef\@docRevision{#1}}
\def\@docRevision{in case of changes}

\AtBeginDocument{%
\color{B}
% ---- Header and Footer -------------------------------------------------------
\pagestyle{fancy}
\rhead{\includegraphics[scale=0.5]{logo/Logo.pdf}\vspace{4pt}}
\lhead{\color{B}%
	\large\bfseries\ifx\@docType\empty\else\@docType\fi\ifx\@docOrg\empty\else-\@docOrg\fi\ifx\@docConsNo\empty\leavevmode\else-\@docConsNo\fi\\[5pt]% LAEI
	\parbox{11.5cm}{\ifx\@docShortTitle\empty\@docTitle\else\@docShortTitle\fi}\\[5pt]%
	\normalsize\normalfont\@docDateVersion\;\@docStatus\vspace{4pt}%
}%
\chead{}%
\cfoot{}%
\lfoot{\color{B}%
	\scriptsize%
	\begin{minipage}{8.5cm}%
		All rights pertaining to this document are exclusively held by Ibeo Automotive Systems GmbH. Any non-authorized copying, reproduction or distribution is not permitted. Confidentiality: This document and/or its contents are confidential.%
	\end{minipage}%
}
\rfoot{\color{B}%
	\scriptsize%
	\begin{minipage}{4cm}%
	\raggedleft%
	\phantom{A}\\%
	\phantom{S}\\%
	\if@engl% LAEI
		page%
	\else%
		Seite%
	\fi\ \thepage\
	\if@engl% LAEI
		of%
	\else%
		von%
	\fi\ \pageref*{LastPage}%
	\end{minipage}%
}%

%Page style for TOC, LOF and LOT
\addtocontents{toc}{\protect\thispagestyle{fancy}}%
\addtocontents{lof}{\protect\thispagestyle{fancy}}%
\addtocontents{lot}{\protect\thispagestyle{fancy}}%
	
%Titlepage
\begin{table} [H]
	\raggedleft
	\footnotesize
	\color{B}
	\begin{tabular} [h] {p{25mm} p{25mm}}
		\if@engl% LAEI
			Scope of validity%
		\else%
			Geltungsbereich%
		\fi & \@docScope \\ \hline
		\if@engl% LAEI
			Confidentiality
		\else%
			Vertraulichkeit%
		\fi & \@docConfidentiality \\ \hline
		\if@engl% LAEI
			Revision%
		\else%
			Reversionierung%
		\fi & \@docRevision \\ \hline
		\if@engl% LAEI
			Repository%
		\else%
			Archiv%
		\fi & \@docArchive \\
	\end{tabular}
\end{table}

\begin{center}
	\vspace{10mm}
	{%
	\huge%
	\@docTitle%
	\normalsize%
	}
	\vspace{20mm}
\end{center}

\if@release
	{\footnotesize \noindent
	\if@engl% LAEI
		Release information%
	\else%
	Freigabeinformation%
	\fi }\vspace{-3mm}
	\begin{table} [H]
		\color{B}
		\begin{tabular} [h] {p{30mm} | p{30mm} | p{30mm} | p{28mm} | p{28mm} }
			\rowcolor{LG}
			\if@engl% LAEI
				& Surname & First name & Process role & Date \\%
			\else%
				& Nachname & Vorname & Prozessrolle & Datum \\%
			\fi \hlineRed
			\input{releaseInfo.tex}
		\end{tabular}
	\end{table}
\fi

\if@history
	{\footnotesize \noindent
	\if@engl% LAEI
		Change history%
	\else%
		Änderungshistorie%
	\fi }\vspace{-3mm}
	\begin{table} [H]
		\color{B}
		\begin{tabular} [h] {p{30mm} | p{30mm} | p{60mm} | p{30mm}}
			\rowcolor{LG}
			\if@engl% LAEI
				Date/Version& Review reference & Change description & Author \\%
			\else%
				Datum/Version & Freigabenachweis & Änderungsbeschreibung & Autor \\%
			\fi \hlineRed
			\input{changeHistory.tex}
		\end{tabular}
	\end{table}
	\newpage
\else
	\if@release
		\newpage
	\fi
\fi

\if@toc
	%TOC: table of content
	\if@engl% LAEI
		\renewcommand{\contentsname}{Table of Contents}
	\else
		\renewcommand{\contentsname}{Inhaltsverzeichnis}
	\fi
	\begingroup
		\hypersetup{linkcolor=B}
		\tableofcontents
	\endgroup
	\newpage
\fi

\renewcommand{\thesection}{\roman{section}}% switch to roman section numbers

\if@abbindex
	%LOA: list of abbreviations
	\if@engl% LAEI
		\section{Index of Abbreviations and Terms}%
	\else%
		\section{Abkürzungs- und Begriffsverzeichnis}%
	\fi%
	\begin{table} [H]
		\color{B}
		\begin{tabular} [h] {p{20mm} | p{139mm}}
			\rowcolor{LG}
			\if@engl% LAEI
				Term & Description \\ \hlineRed
			\else%
				Begriff & Beschreibung \\ \hlineRed
			\fi%
			\input{terms.tex}
			\end{tabular}
		\end{table}

	\begin{table} [H]
		\color{B}
		\begin{tabular} [h] {p{20mm} | p{139mm}}
			\rowcolor{LG}
			\if@engl% LAEI
				Abbreviation & Denotation \\ \hlineRed
			\else%
				Abkürzung & Bedeutung \\ \hlineRed
			\fi
			\input{abbreviations.tex}
		\end{tabular}
	\end{table}

	\if@centralgloss
		\if@engl% LAEI
			Additionally, the central glossary of the QM-System is used for this document.\\\null\hfill\footnotesize{\url{https://confluence.ibeo.as/display/QM/Glossar}}
		\else%
			Zusätzlich wird das zentrale Glossar des QM-System für dieses Dokument verwendet.\\\null\hfill\footnotesize{\url{https://confluence.ibeo.as/display/QM/Glossar}}
		\fi%
	\fi
\else
	\if@centralgloss
		\if@engl% LAEI
			The central glossary of the QM-System is used for this document.\\\null\hfill\footnotesize{\url{https://confluence.ibeo.as/display/QM/Glossar}}
		\else%
			Das zentrale Glossar des QM-System wird für dieses Dokument verwendet.\\\null\hfill\footnotesize{\url{https://confluence.ibeo.as/display/QM/Glossar}}
		\fi%
	\fi
\fi

\if@bibtex% LAEI
	%LOF: list of figures
	\renewcommand{\refname}{\vspace{-8mm}}
	\if@engl% LAEI
		\section{References and Documents}
	\else
		\section{Referenzen und Dokumente}
	\fi
	\bibliography{bib}
	\bibliographystyle{unsrt}
\fi

\if@figindex% LAEI
	%LOF: list of figures
	\renewcommand{\listfigurename}{\vspace{-8mm}}
	\if@engl% LAEI
		\section{Index of Figures}
	\else
		\section{Abbildungsverzeichnis}
	\fi
	\begingroup
		\hypersetup{linkcolor=black}{%
			\let\oldnumberline\numberline%
			\renewcommand{\numberline}{\figurename~\oldnumberline}%
			\listoffigures%
		}
	\endgroup
\fi
\if@tabindex% LAEI
	%LOT: list of tables
	\renewcommand{\listtablename}{\vspace{-8mm}}
	\if@engl% LAEI
		\section{Index of Tables}
	\else
		\section{Tabellenverzeichnis}
	\fi
	\begingroup
		\hypersetup{linkcolor=black}{%
			\let\oldnumberline\numberline%
			\renewcommand{\numberline}{\tablename~\oldnumberline}%
			\listoftables%
		}
	\endgroup
\fi

\renewcommand{\thesection}{\arabic{section}}% switch to arabic numbers
\renewcommand*{\theHsection}{chX.\the\value{section}}% redefinition for unique identifiers
\setcounter{section}{0} %reset section counter
}

% Add short month name for ngerman LAEI
\providecommand{\shortmonthnamengerman}[1][\month]{%
	\@orgargctr=#1\relax%
	\ifcase\@orgargctr%
		\PackageError{datetime}%
		{Invalid Month number \the\%@orgargctr}%
		{Month numbers should go from 1 to 12}%
		\or Jan%
		\or Feb%
		\or M\"ar%
		\or Apr%
		\or Mai%
		\or Jun%
		\or Jul%
		\or Aug%
		\or Sep%
		\or Okt%
		\or Nov%
		\or Dez%
	\else%
		\PackageError{datetime}%
		{Invalid Month number \the\@orgargctr}%
		{Month numbers should go from 1 to 12}%
	\fi%
}%
\let\shortmonthnamengerman\shortmonthnamengerman%

