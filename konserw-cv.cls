\ProvidesClass{konserw-cv}[2013/09/03 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption{print}{\def\@cv@half{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{666666}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \ifdefined\@cv@half
    \colorlet{fillheader}{white}
    \colorlet{header}{gray}
  \else
    \colorlet{fillheader}{gray}
    \colorlet{header}{white}
  \fi
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
\setmainfont[Ligatures={Common,TeX}, Color=textcolor]{Source Sans Pro Light}

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
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{1cm}
%  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}

\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newcommand{\entry}[4]{%
  \parbox[t]{3cm}{#1}&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize #3 }  \\ %
%		\addfontfeature{Color=lightgray} #3 }\\%
    #4\vspace{\parsep}%
  }%
\\}


\newenvironment{skillslist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r  l}
}{%
  \end{tabular*}
}

\newcommand{\skill}[1]{%
 %\parbox{0cm}{\raggedleft \(\bullet\) } 
\parbox{2cm}{ \raggedleft \(\bullet\)  } & \parbox[t]{11.8cm}{%
    \textbf{#1} %
    \vspace{\parsep}%
  }%
\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.5}(1, 3.3)
%  \begin{textblock}{3.75}(1.5, 3.3)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%
% klauzula %
%%%%%%%%%%%%%%

\RequirePackage[counterclockwise]{rotating}

\newenvironment{klauzula_bok}{%
 \begin{textblock*}{3cm}(1.5cm, .77\textheight)
  \begin{flushright}
   \begin{sideways}
    \begin{minipage}{.41\textheight}  
     \begin{center}
%     \obeycr
}{%
%     \restorecr
     \end{center}
    \end{minipage}
   \end{sideways}  
  \end{flushright}
 \end{textblock*}
}

\newenvironment{klauzula}{%
 \begin{textblock*}{\paperwidth}(1cm, .94\paperheight)
   \begin{minipage}{.9\textwidth}  
    \begin{center}
	\footnotesize
   %  \obeycr
}{%
   %  \restorecr
    \end{center}
   \end{minipage}
 \end{textblock*}
}

\newenvironment{klauzula2}{%
 \begin{figure}[!b]
   \begin{minipage}{.9\linewidth}  
	\footnotesize
     \obeycr
}{%
    \restorecr
   \end{minipage}
  \end{figure}
}
%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=1.75cm,right=1.25cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
