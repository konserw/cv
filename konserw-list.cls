\ProvidesClass{konserw-list}[2014/10/03 cover letter class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{letter}%
}
\ProcessOptions\relax
\LoadClass{letter}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{666666}

\ifdefined\@cv@print
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}

\newfontfamily\bodyfont[Ligatures={Common,TeX}]{Source Sans Pro}
\newfontfamily\thinfont[Ligatures={Common,TeX}]{Source Sans Pro ExtraLight}
\newfontfamily\headingfont[Ligatures={Common,TeX}]{Source Sans Pro Black}
\defaultfontfeatures{Ligatures={Common,TeX}}
\setmainfont[Ligatures={Common,TeX}, Color=textcolor]{Source Sans Pro}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3.5cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
%  \vspace{1cm}
%  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\pagestyle{empty}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\RequirePackage[left=2cm,top=4cm,right=2cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}


%%%%%%%%%%%%%%%%%%%
% Letter
%%%%%%%%%%%%%%%%%

\let\@texttop\relax

\renewcommand*{\opening}[2]{{%
\ifx\@empty\fromaddress
%\thispagestyle{firstpage}%
{\raggedleft \@date\par}%
 \else % home address
% \thispagestyle{empty}%
 \ignorespaces%
 \raggedleft #2 dn. \@date\par%
 \raggedright \fromaddress \\*[2\parskip]%
 \fi
 \vspace{2\parskip}%
 {\raggedleft \toname \\ \toaddress \par}%
 \vspace{2\parskip}%
 #1\par\nobreak%
 }}
 
%\newcommand*{\opening}[1]{\ifx\@empty\fromaddress
% \thispagestyle{firstpage}%
% {\raggedleft\@date\par}%
% \else % home address
% \thispagestyle{empty}%
% {\raggedleft\begin{tabular}{l@{}}\ignorespaces
% \fromaddress \\*[2\parskip]%
 %\@date \end{tabular}\par}%
% \fi
% \vspace{2\parskip}%
% {\raggedright \toname \\ \toaddress \par}%
% \vspace{2\parskip}%
% #1\par\nobreak}

\RequirePackage[absolute,overlay]{textpos}

\renewcommand*{\closing}[1]{%
 \vspace{3\parskip}%
 {%
 \ignorespaces%
 \bfseries %
 \raggedleft #1  %
 %\vspace{2\parskip}%
 \par\nobreak% 
 }%
}
