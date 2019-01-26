%# -*- coding: utf-8-unix -*-
%==================================================
%% tjuthesis.cls for TJU Master Thesis
%%==================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tjuthesis}[2018/01/09 v0.10 Tongji University Template]
\def\version{v0.10}


\newif\iftju@coursepaper\tju@coursepaperfalse
\newif\iftju@bachelor\tju@bachelorfalse
\newif\iftju@master\tju@masterfalse
\newif\iftju@doctor\tju@doctorfalse
\newif\iftju@english\tju@englishfalse
\newif\iftju@review\tju@reviewfalse
\newif\iftju@submit\tju@submitfalse


\DeclareOption{coursepaper}{\tju@coursepapertrue}
\DeclareOption{bachelor}{\tju@bachelortrue}
\DeclareOption{master}{\tju@mastertrue}
\DeclareOption{doctor}{\tju@doctortrue}
\DeclareOption{english}{\tju@englishtrue}
\DeclareOption{review}{\tju@reviewtrue}
\DeclareOption{submit}{\tju@submittrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax



\iftju@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\else
  \PassOptionsToClass{scheme=chinese}{ctexbook}
\fi
\iftju@coursepaper
  \PassOptionsToClass{zihao=-4}{ctexbook}
\else
  \iftju@bachelor
    \PassOptionsToClass{zihao=5}{ctexbook}
  \else
    \PassOptionsToClass{zihao=-4}{ctexbook}
    \iftju@master\relax\else
      \iftju@doctor\relax\else
        \ClassError{tjuthesis}%
          {You have to specify one of thesis options: coursepaper, bachelor, master or doctor.}{}
      \fi
    \fi
  \fi
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8]{ctexbook}

%% tjuthesis.cls segments
% 0. Import tjuthesis.cfg & define variables
% 1. Import and configure LaTeX packages.
% 2. Define general-purpose LaTeX commands.
% 3. Configure the imported packages, also extend LaTeX command in tjuthesis
% 4. Draw the tjuthesis

%==========
% Segment 0. Import tjuthesis.cfg & define variables
%==========

\AtEndOfClass{\input{template/tjuthesis/tjuthesis.cfg}}

% Chinese variables
\newcommand\classification[1]{\def\tju@value@classification{#1}}
\newcommand\studentnumber[1]{\def\tju@value@studentnumber{#1}}
\newcommand\confidential[1]{\def\tju@value@confidential{#1}}
\newcommand\school[1]{\def\tju@value@school{#1}}
\newcommand\chinesedegree[1]{\def\tju@value@chinesedegree{#1}}
\renewcommand\title[1]{%
  \def\tju@value@chinesetitle{\tju@title@handler{#1}}%
  \def\tju@value@chinesecovertitle{\tju@covertitle@handler{#1}}}
\renewcommand\author[1]{\def\tju@value@author{#1}}
\newcommand\advisor[1]{\def\tju@value@advisor{#1}}
\newcommand\coadvisor[1]{\def\tju@value@coadvisor{#1}}
\newcommand\major[1]{\def\tju@value@major{#1}}
\newcommand\coursename[1]{\def\tju@value@coursename{#1}}
\newcommand\submitdate[1]{\def\tju@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\tju@value@defenddate{#1}}
\newcommand\institute[1]{\def\tju@value@institute{#1}}
\newcommand\chairman[1]{\def\tju@value@chairman{#1}}
\newcommand\keywords[1]{\def\tju@value@keywords{#1}}
\newcommand\cnacademicdegree[1]{\def\tju@value@cnacademicdegree{#1}}

% English variables
\newcommand\englishtitle[1]{\def\tju@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\tju@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\tju@value@englishadvisor{#1}}
\newcommand\englishcoadvisor[1]{\def\tju@value@englishcoadvisor{#1}}
\newcommand\englishschool[1]{\def\tju@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\tju@value@englishinstitute{#1}}
\newcommand\englishinstitutemaster[1]{\def\tju@value@englishinstitutemaster{#1}}
\newcommand\englishdate[1]{\def\tju@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\tju@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\tju@value@englishmajor{#1}}
\newcommand\englishstudentid[1]{\def\tju@value@englishstudentid{#1}}
\newcommand\englishkeywords[1]{\def\tju@value@englishkeywords{#1}}
\newcommand\enacademicdegree[1]{\def\tju@value@enacademicdegree{#1}}

%==========
% Segment 1. Import LaTeX packages.
%==========

\RequirePackage{etoolbox}
\RequirePackage{geometry} %设置版面
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage[titles]{tocloft}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage[opentype]{sourcecodepro}
\RequirePackage{upgreek}
\RequirePackage{wasysym}
\RequirePackage{anyfontsize}
\RequirePackage{metalogo,doc}
\RequirePackage{array}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{textcomp}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
\RequirePackage{siunitx}
\RequirePackage{xparse}
\RequirePackage{tikz}
\RequirePackage{makecell}
\usetikzlibrary{shapes.geometric, arrows}

% Make hyperref to set PDF metadata (author, title, subject, keywords)
\AtBeginDocument{
  \hypersetup{
    bookmarksnumbered,
    colorlinks,
    urlcolor=black,
    linkcolor=black,
    citecolor=black,
    plainpages=false,
    pdfstartview=FitH,
    pdfauthor={\tju@value@author},
    pdftitle={\tju@value@chinesetitle},
    pdfsubject={\tju@value@school\tju@value@chinesedegree\tju@label@thesis},
    pdfkeywords={\tju@value@keywords},
  }
}
\RequirePackage{hyperref}
\pdfstringdefDisableCommands{%
  \let\\\@empty%
  \let\tju@title@handler\@empty}

%==========
% Segment 2. Define general-purpose LaTeX commands.
%==========
\geometry{
  paper      = a4paper,
  top        = 3.5cm,
  bottom     = 4.0cm,
  left       = 3.3cm,
  right      = 2.8cm,
}
\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)
\renewcommand{\cftchapfont}{\bfseries\heiti}  % 目录章节标题（黑体加粗）

% User defined command list
%% \me \mi \mj \dif \cleardoublepage \cndash \CJKLaTeX

% A new column type
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

% E-mail
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

% upper math letter
\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\mathrm{d}}

% patch commands
\patchcmd\cleardoublepage
  {\newpage}
  {\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter
  {\thispagestyle{\CTEX@chapter@pagestyle}}
  {}{}{}
\patchcmd\@chapter
  {\if@twocolumn}
  {\addtocontents{loa}{\protect\addvspace{10\p@}}%
   \if@twocolumn}
  {}{}
\patchcmd\tableofcontents
  {\chapter}
  {\cleardoublepage%
   \pdfbookmark[0]{\contentsname}{toc}%
   \chapter}
  {}{}

% CJK-LaTeX Logo \CJKLaTeX
\newcommand{\CJKLaTeX}{CJK--\LaTeX}

% cndash
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%==========
% Segment 3. Configure the imported packages, also extend LaTeX command in tjuthesis
%==========

%% 行距缩放因子
\linespread{1.3}

%% CTeX Settings
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
\ctexset{%
  contentsname   = \tju@contentsname,
  listfigurename = \tju@listfigurename,
  listtablename  = \tju@listtablename,
  autoindent     = true,
  chapter={%
    format       = \zihao{3}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = {15\p@},
    afterskip    = {12\p@},
  },
  section={%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsection={%
    format       = \zihao{-4}\normalfont,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsubsection={%
    format       = \normalsize\normalfont,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true,
}

\floatname{algorithm}{\tju@label@algo}
\renewcommand{\algorithmicrequire}{\textbf{\tju@algorithmicrequire}}
\renewcommand{\algorithmicensure}{\textbf{\tju@algorithmicensure}}
\renewcommand{\listalgorithmname}{\tju@listalgorithmname}
\renewcommand{\lstlistingname}{\tju@value@listingname}

% bullets in the item
\renewcommand{\labelitemi}{\ensuremath{\bullet}}

%% Graphic path & file extension
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% Caption setting in caption and bicaption pacakge
\DeclareCaptionFont{kaishu}{\kaishu}
\captionsetup{format=plain,labelformat=simple,labelsep=space,justification=centering,font={small,kaishu}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\captionsetup[sub]{font=footnotesize}

\DeclareCaptionOption{bi-first}[]{%
    \def\tablename{\tju@tablename}
    \def\figurename{\tju@figurename}
}
\DeclareCaptionOption{bi-second}[]{%
    \def\tablename{Table}
    \def\figurename{Figure}
}

% Set fontnote font size in threeparttable
\appto\TPTnoteSettings{\footnotesize}

% Ref https://github.com/tjug/TJUThesis/issues/186
\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法、代码的编号为"3-1"的形式，即分隔符由.变为短杠
\AtBeginDocument{%
  \renewcommand{\theequation}{\thechapter--\arabic{equation}}
  \renewcommand{\thefigure}{\thechapter--\arabic{figure}}
  \renewcommand\p@subfigure{\thefigure}
  \renewcommand{\thetable}{\thechapter--\arabic{table}}
  \renewcommand{\thealgorithm}{\thechapter--\arabic{algorithm}}
  \renewcommand{\thelstlisting}{\thechapter--\arabic{lstlisting}}
}

% 图表索引前加下“图”，“表”关键词
\iftju@master
  \renewcommand*\cftfigpresnum{\tju@figurename~}
  % \newlength{\tju@cftfignumwidth@tmp}
  % \settowidth{\tju@cftfignumwidth@tmp}{\cftfigpresnum}
  % \addtolength{\cftfignumwidth}{\tju@cftfignumwidth@tmp}
  \renewcommand{\cftfigaftersnumb}{\enspace~}
  \renewcommand*\cfttabpresnum{\tju@tablename~}
  % \newlength{\tju@cfttabnumwidth@tmp}
  % \settowidth{\tju@cfttabnumwidth@tmp}{\cfttabpresnum}
  % \addtolength{\cfttabnumwidth}{\tju@cfttabnumwidth@tmp}
  \renewcommand{\cfttabaftersnumb}{\enspace~}
\fi
% 使用enumitem宏包配制列表环境
% 紧凑间距
\setlist{nosep}
% 列表和段落头对齐
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent} % Only the level 1

% 流程图定义基本形状
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{io} = [trapezium, trapezium left angle=75, trapezium right angle=105, minimum width=1cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-9pt,belowcaptionskip=9pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em,
  % 改变双引号和单引号的样式
  literate={"}{\textquotedbl}1,
  upquote=true
}

% Setting Package siunitx
\sisetup{detect-all} % Detecting fonts

% 定理环境
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\tju@label@algo~}[chapter]
  \newtheorem{thm}{\tju@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\tju@label@lem~}
  \newtheorem{prop}[thm]{\tju@label@prop~}
  \newtheorem{cor}[thm]{\tju@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\tju@label@defn~}[chapter]
  \newtheorem{conj}{\tju@label@conj~}[chapter]
  \newtheorem{exmp}{\tju@label@exmp~}[chapter]
  \newtheorem{rem}{\tju@label@rem~}
  \newtheorem{case}{\tju@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\tju@label@thm~}
  \newtheorem{blem}[thm]{\tju@label@lem~}
  \newtheorem{bprop}[thm]{\tju@label@prop~}
  \newtheorem{bcor}[thm]{\tju@label@cor~}
  \renewcommand{\proofname}{\bfseries\tju@label@proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following definitions add Switch statement to LaTeX algorithmicx package
% It's based on Werner's answer on stackoverflow
% http://tex.stackexchange.com/questions/53357/switch-cases-in-algorithmic

% New definitions
\algnewcommand\algorithmicswitch{\textbf{switch}}
\algnewcommand\algorithmiccase{\textbf{case}}
\algnewcommand\algorithmicdefault{\textbf{default}}

% New "environments"
% using \algtext*{<env>} removes any typesetting of that command
\algdef{SE}[SWITCH]{Switch}{EndSwitch}[1]{\algorithmicswitch\ (#1)}{\algorithmicend\ \algorithmicswitch}%
%\algtext*{EndSwitch}%
\algdef{SE}[CASE]{Case}{EndCase}[1]{\algorithmiccase\ #1:}{\algorithmicend\ \algorithmiccase}%
\algtext*{EndCase}%
\algdef{SE}[DEFAULT]{Default}{EndDefault}{\algorithmicdefault\ :}{\algorithmicend\ \algorithmicdefault}%
\algtext*{EndDefault}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following add some extra commands to LaTeX algorithmicx package

% Assert
\algnewcommand\algorithmicassert{\texttt{assert}}
\algnewcommand\Assert[1]{\State \algorithmicassert(#1)}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==========
% Segment 4. Draw the tjuthesis
%==========

\renewcommand\maketitle{%
  \pdfbookmark[0]{\tju@titlepage}{titlepage}
  \iftju@coursepaper
    \makechinesetitle@coursepaper
  \else
    \iftju@bachelor
      \makechinesetitle@bachelor
    \else
      \iftju@master
        \makechinesetitle@master
        \makeenglishtitle@master
      \else
        \makechinesetitle
        \makeenglishtitle
      \fi
    \fi
  \fi
}

\ExplSyntaxOn
\tl_new:N        \l__tju_tmp_tl
\seq_new:N       \l__tju_tmp_seq
\NewDocumentCommand{ \tju@covertitle@handler } { O { \\ } m }
  {
    \seq_set_split:Nnn \l__tju_tmp_seq { #1 } { #2 }
    \seq_pop_right:NN  \l__tju_tmp_seq \l__tju_tmp_tl
    \seq_map_inline:Nn \l__tju_tmp_seq { \underline { \makebox [ 300pt ] { ##1 } } \\ }
    \underline { \makebox [ 300pt ] { \l__tju_tmp_tl } }
  }
\NewDocumentCommand{ \tju@title@handler } { O { \\ } m }
  {
    \seq_set_split:Nnn \l__tju_tmp_seq { #1 } { #2 }
    \seq_map_inline:Nn \l__tju_tmp_seq { ##1 }
  }
\ExplSyntaxOff

% “绘制”硕士论文模板中文标题页
\newcommand\makechinesetitle@master{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\songti\zihao{-2} ~\\[35pt] \tju@label@statement}
  \vskip\stretch{1}
  {\heiti\zihao{2}\tju@value@chinesetitle}
  \vskip\stretch{1.2}
  {\fangsong\zihao{4}}
  \zihao{4}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.25}
  \begin{tabular}{>{\begin{CJKfilltwosides}[t]{7\ccwd}\heiti }r<{\end{CJKfilltwosides}}l}
    \iftju@review
      \tju@label@author        & \enspace ~ \\
      \tju@label@studentnumber & \enspace ~ \\
      \tju@label@advisor       & \enspace ~ \\
      \ifx\tju@value@coadvisor\undefined\else
        \tju@label@coadvisor     & \enspace ~ \\
      \fi
    \else
      \tju@label@author        & \enspace {\tju@value@author} \\
      \tju@label@studentnumber & \enspace {\tju@value@studentnumber} \\
      \tju@label@advisor       & \enspace {\tju@value@advisor} \\
      \ifx\tju@value@coadvisor\undefined\else
        \tju@label@coadvisor     & \enspace {\tju@value@coadvisor} \\
      \fi
    \fi
      \tju@label@cnacademicdegree & \enspace {\tju@value@cnacademicdegree } \\
      \tju@label@major         & \enspace {\tju@value@major} \\
      \tju@label@institute         & \enspace {\tju@value@institute} \\
      \tju@label@defenddate    & \enspace {\tju@value@defenddate} \\
      \tju@label@school        & \enspace {\tju@value@school}
  \end{tabular}
  \end{center}
  \vskip \stretch{0.25}
  \cleardoublepage
}
% “绘制”硕士论文模板英文标题页
\newcommand\makeenglishtitle@master{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{-2} ~\\[35pt] \tju@label@englishstatement}
      \vskip\stretch{1}
      {\zihao{2} \textbf{\MakeUppercase{\tju@value@englishtitle}} \vskip 1pt}
      \vskip \stretch{1}
      {\normalfont\zihao{4}}
      \zihao{4}
      \def\tabcolsep{1pt}
      \def\arraystretch{1.3}
      \begin{tabular}{ll}
        \iftju@review
          \textbf{\tju@label@englishauthor} & \enspace ~ \\
          \textbf{\tju@label@englishstudentid} & \enspace ~ \\
          \textbf{\tju@label@englishadvisor}       & \enspace ~ \\
          \ifx\tju@value@englishcoadvisor\undefined\else
            \textbf{\tju@label@englishcoadvisor}     & \enspace ~ \\
          \fi
        \else
          \textbf{\tju@label@englishauthor} & \enspace \tju@value@englishauthor \\
          \textbf{\tju@label@englishstudentid} & \enspace \tju@value@englishstudentid \\
          \textbf{\tju@label@englishadvisor}      & \enspace \tju@value@englishadvisor \\
          \ifx\tju@value@englishcoadvisor\undefined\else
            \textbf{\tju@label@englishcoadvisor}    & \enspace \tju@value@englishcoadvisor \\
          \fi
        \fi
        \textbf{\tju@label@enacademicdegree}   & \enspace \tju@value@enacademicdegree \\
        \textbf{\tju@label@englishmajor}         & \enspace \tju@value@englishmajor \\
        \textbf{\tju@label@englishinstitutemaster}        & \enspace \makecell[l]{\tju@value@englishinstitutemaster} \\
        \textbf{\tju@label@englishdate}    & \enspace \tju@value@englishdate \\
        \textbf{\tju@label@englishschool}        & \enspace \tju@value@englishschool
      \end{tabular}
  \end{center}
  \vskip \stretch{0.4}
  \cleardoublepage
}

% “绘制”中文标题页
\newcommand\makechinesetitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\zihao{-3}\tju@label@statement}
  \vskip\stretch{1}
  {\heiti\zihao{3}\tju@value@chinesetitle}
  \vskip\stretch{1}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.5}
  \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}\heiti}r<{\end{CJKfilltwosides}}@{：}c}
    \iftju@review
      \tju@label@author        &  \\ \cline{2-2}
      \tju@label@studentnumber & \makebox[150pt]{} \\ \cline{2-2}
      \tju@label@advisor       &  \\ \cline{2-2}
      \ifx\tju@value@coadvisor\undefined\else
        \tju@label@coadvisor     &  \\ \cline{2-2}
      \fi
    \else
      \tju@label@author        & \tju@value@author \\ \cline{2-2}
      \tju@label@studentnumber & \makebox[150pt]{\tju@value@studentnumber} \\ \cline{2-2}
      \tju@label@advisor       & \tju@value@advisor \\ \cline{2-2}
      \ifx\tju@value@coadvisor\undefined\else
        \tju@label@coadvisor     & \tju@value@coadvisor \\ \cline{2-2}
      \fi
    \fi
    \tju@label@major         & \tju@value@major \\ \cline{2-2}
    \tju@label@defenddate    & \tju@value@defenddate \\ \cline{2-2}
  \end{tabular}
  \vskip 30pt
  \end{center}
  \cleardoublepage
}

% “绘制”英文标题页
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{4} \tju@label@englishstatement}
      \vspace{20pt} \vskip\stretch{1}
      {\huge\tju@value@englishtitle \vskip 1pt}
      \vskip \stretch{1}
    \iftju@review
      \vskip \stretch{1}
      \vskip 3pt
      \vskip \stretch{2}
    \else
      {\normalfont\zihao{4}\tju@value@englishauthor}
      \vskip \stretch{1}
      {\normalfont\zihao{4}\tju@label@englishadvisor}
      \vskip 2pt
      {\normalfont\zihao{4}\tju@value@englishadvisor}
      \vskip 5pt
      \ifx\tju@value@englishcoadvisor\undefined\else
        {\normalfont\zihao{4}\tju@label@englishcoadvisor}
        \vskip 2pt
        {\normalfont\zihao{4}\tju@value@englishcoadvisor}
        \vskip \stretch{2}
      \fi
    \fi
    \normalfont\tju@value@englishinstitute \vskip 30pt
    \normalfont\tju@value@englishdate \vskip 20pt
  \end{center}
  \cleardoublepage
}

% “绘制”学士论文中文标题页
\newcommand\makechinesetitle@bachelor{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \kaishu
    \vspace*{20pt} \vskip 7pt
    \includegraphics{tjulogo}
    \vskip 30pt
    {\fontsize{32}{32}\tju@value@chinesedegree\tju@label@thesis}
    \vskip 15pt
    {\zihao{-2}\MakeUppercase{Thesis of \tju@value@englishdegree}}
    \vskip 15pt
    \includegraphics{tjubadge}
    \vskip \stretch{2}
    {
      \zihao{2}
      \begin{tabular}{r@{：}l}
        \tju@label@title & {\zihao{-2}\parbox[t]{320pt}{\tju@value@chinesecovertitle}}
      \end{tabular}
    }
    \vskip \stretch{1}
    {
      \zihao{3}
      \def\arraystretch{1.1}
      \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}}r<{\end{CJKfilltwosides}}@{：}c}
        \iftju@review
          \tju@label@author        &  \\ \cline{2-2}
          \tju@label@studentnumber & \makebox[180pt]{} \\ \cline{2-2}
        \else
          \tju@label@author        & \tju@value@author \\ \cline{2-2}
          \tju@label@studentnumber & \makebox[180pt]{\tju@value@studentnumber} \\ \cline{2-2}
        \fi
          \tju@label@major         & \tju@value@major \\ \cline{2-2}
        \iftju@review
          \tju@label@advisor       &  \\ \cline{2-2}
        \else
          \tju@label@advisor       & \tju@value@advisor \\ \cline{2-2}
        \fi
        \tju@label@institute     & \tju@value@institute \\ \cline{2-2}
      \end{tabular}
    }
  \end{center}
  \cleardoublepage
}

% “绘制”课程论文标题页
\newcommand\makechinesetitle@coursepaper{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \kaishu
    \vspace*{20pt} \vskip 7pt
    \includegraphics{tjulogo}
    \vskip 30pt
    {\fontsize{32}{32}\tju@label@coursepaper}
    \vskip 15pt
    \includegraphics{tjubadge}
    \vskip \stretch{2}
    {
      \zihao{2}
      \begin{tabular}{r@{：}l}
        \tju@label@title & {\zihao{-2}\parbox[t]{320pt}{\tju@value@chinesecovertitle}}
      \end{tabular}
    }
    \vskip \stretch{1}
    {
      \zihao{3}
      \def\arraystretch{1.1}
      \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}}r<{\end{CJKfilltwosides}}@{：}c}
      \tju@label@coursename    & \tju@value@coursename \\ \cline{2-2}
      \tju@label@author        & \tju@value@author \\ \cline{2-2}
      \tju@label@studentnumber & \makebox[180pt]{\tju@value@studentnumber} \\ \cline{2-2}
      \tju@label@institute     & \tju@value@institute \\ \cline{2-2}
      \tju@label@major         & \tju@value@major \\ \cline{2-2}
      \end{tabular}
    }
  \end{center}
  \cleardoublepage
}

% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    ~\\[70pt]
    % \linespread{1.5}
    {\zihao{-2}\heiti \textbf{\tju@value@school}} \\[12pt]
    {\zihao{-2}\heiti \textbf{\tju@label@original}} \\[12pt]
  \end{center}
  \vskip 10pt
  {\par\linespread{2}\zihao{4}本人郑重声明：所呈交的学位论文《\tju@value@chinesetitle》，\tju@label@originalcontent\par}
  \vskip 80pt
  {\zihao{4}\hspace{13em}\tju@label@authorsign\hrulefill\hspace{1.5em}}
  \vskip 40pt
  {\zihao{4}\hspace{11em}\tju@label@originalDate\hspace{1em}}
  \cleardoublepage
}

% 授权声明
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    ~\\[30pt]
    {\zihao{-2}\bfseries\heiti \tju@value@school} \\[12pt]
    {\zihao{-2}\bfseries\heiti \tju@label@authorization} \\[12pt]
  \end{center}
  \vskip 10pt
  {\par\linespread{1.5}\zihao{4}\tju@label@authorizationcontent\par}
  \vskip 150pt
  {\zihao{4} \tju@label@authorsign\hrulefill\hspace{3em}\tju@label@Supervisorsign\hrulefill}
  \vskip 40pt
  {\zihao{4} \tju@label@originalDate\hfill\hspace{3em}\tju@label@originalDate}
  \cleardoublepage
}

% fancyhdr页眉页脚设置
\iftju@english
  \def\tju@value@titlemark{\tju@value@englishtitle}
  \newcommand\tju@fancyhead{\footnotesize\kaishu}
  \newcommand\tju@fancyfoot[2]{\small --~~Page~~{\bfseries{#1}}~~of~~{\bfseries{#2}}~~--}
\else
  \def\tju@value@titlemark{\tju@value@chinesetitle}
  \newcommand\tju@fancyhead{\small\kaishu}
  \newcommand\tju@fancyfoot[2]{\small 第~{\bfseries{#1}}~页\,共~{\bfseries{#2}}~页}
\fi
\def\markboxwidth{0.75\textwidth}
\AtBeginDocument{\pagenumbering{Alph}}

\iftju@coursepaper
  %% 本科学位论文页眉页脚设置
  %% 前言页眉页脚
  \fancypagestyle{front}{%
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/tjubanner}}
    \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\tju@fancyhead\tju@value@titlemark}}}
    \fancyfoot[C]{\tju@fancyfoot{\thepage}{\lastpageref{pagesLTS.Roman}}}
    \renewcommand{\headheight}{32pt}
  }
  %% 正文页眉页脚
  \fancypagestyle{main}{%
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/tjubanner}}
    \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\tju@fancyhead\tju@value@titlemark}}}
    \fancyfoot[C]{\tju@fancyfoot{\thepage}{\lastpageref{pagesLTS.arabic}}}
    \renewcommand{\headheight}{32pt}
  }
\else
  \iftju@bachelor
  %% 本科学位论文页眉页脚设置
    %% 前言页眉页脚
    \fancypagestyle{front}{%
      \fancyhf{}
      \fancyhead[L]{\includegraphics{figure/tjubanner}}
      \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\tju@fancyhead\tju@value@titlemark}}}
      \fancyfoot[C]{\tju@fancyfoot{\thepage}{\lastpageref{pagesLTS.Roman}}}
      \renewcommand{\headheight}{32pt}
    }
    %% 正文页眉页脚
    \fancypagestyle{main}{%
      \fancyhf{}
      \fancyhead[L]{\includegraphics{figure/tjubanner}}
      \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\tju@fancyhead\tju@value@titlemark}}}
      \fancyfoot[C]{\tju@fancyfoot{\thepage}{\lastpageref{pagesLTS.arabic}}}
      \renewcommand{\headheight}{32pt}
    }
    %% 英文大摘要
    \fancypagestyle{biglast}{%
      \fancyhf{}
      \fancyhead[L]{\includegraphics{figure/tjubanner}}
      \fancyhead[R]{\parbox[b]{\markboxwidth}{\raggedleft\nouppercase{\tju@fancyhead\tju@value@titlemark}}}
      \fancyfoot[C]{\tju@fancyfoot{\theCurrentPageLocal}{\lastpageref{pagesLTS.roman.local}}}
      \renewcommand{\headheight}{32pt}
    }
  \else
  %% 研究生学位论文页眉页脚设置
    \if@twoside
    %% 双面打印页眉页脚
      \fancypagestyle{front}{%
        \fancyhf{}
        \fancyhead[LO,RE]{\small\kaishu\tju@value@school\tju@value@chinesedegree\tju@label@thesis}
        \fancyhead[LE,RO]{\nouppercase{\tju@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
      \fancypagestyle{main}{%
        \fancyhf{}
        \fancyhead[LO,RE]{\small\kaishu\tju@value@school\tju@value@chinesedegree\tju@label@thesis}
        \fancyhead[LE,RO]{\nouppercase{\tju@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
    \else
    %% 单面打印页眉页脚
      \fancypagestyle{front}{%
        \fancyhf{}
        \fancyhead[L]{\small\kaishu\tju@value@school\tju@value@chinesedegree\tju@label@thesis}
        \fancyhead[R]{\nouppercase{\tju@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
      \fancypagestyle{main}{%
        \fancyhf{}
        \fancyhead[L]{\small\kaishu\tju@value@school\tju@value@chinesedegree\tju@label@thesis}
        \fancyhead[R]{\nouppercase{\tju@fancyhead\leftmark}}
        \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
        \renewcommand{\headheight}{32pt}
      }
    \fi
  \fi
\fi

\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \iftju@coursepaper
    \pagestyle{front}
  \else
    \iftju@bachelor
      \pagestyle{front}
    \else
      \pagestyle{main}
    \fi
  \fi
  \pagenumbering{Roman}
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{main}
  \pagenumbering{arabic}
}

% 中英文摘要+关键词
\newenvironment{abstract}{%
  \cleardoublepage
  \pdfbookmark[0]{\tju@label@abstract}{abstract}
  \chapter*{%
    \tju@value@chinesetitle
    \vskip 20pt
    \tju@label@chineseabstract
  }
  \zihao{4} \markboth{\tju@label@chineseabstract}{}
}{
  \vspace{2ex}\noindent
  {\zihao{4} \textbf{\tju@label@keywords}{\tju@value@keywords}}
}
\newenvironment{englishabstract}{%
  \cleardoublepage
  \chapter*{%
    \MakeUppercase\tju@value@englishtitle
    \vskip 20pt
    \MakeUppercase\tju@label@englishabstract
  }
  \zihao{4} \markboth{\tju@label@englishabstract}{}
}{
  \vspace{2ex}\noindent
  {\zihao{4} \textbf{\tju@label@englishkeywords}{\tju@value@englishkeywords}}
}

% 主要符号对照表
\newenvironment{nomenclaturename}{\cleardoublepage
\chapter{\tju@nomenclature}{}}{}

\newenvironment{publications}[1]
     {\chapter{\tju@label@publications}%
      \@mkboth{\MakeUppercase\tju@label@publications}
              {\MakeUppercase\tju@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

\newenvironment{patents}[1]
     {\chapter{\tju@label@patents}%
      \@mkboth{\MakeUppercase\tju@label@patents}
              {\MakeUppercase\tju@label@patents}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `patents' environment}}%
      \endlist}

\newenvironment{projects}[1]
     {\chapter{\tju@label@projects}%
      \@mkboth{\MakeUppercase\tju@label@projects}
              {\MakeUppercase\tju@label@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

\newenvironment{resume}%
  {\chapter{\tju@label@resume}}%
  {}

\newenvironment{resumesection}[1]%
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}%
  {\endlist}

\newenvironment{resumelist}[1]%
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}}%
  {\endlist}

\renewenvironment{thanks}{%
  \chapter*{%
    \tju@label@thanks
    \markboth{\tju@label@thanks}{}
  }
  \addcontentsline{toc}{chapter}{\tju@label@thanks}
}{}

\newenvironment{summary}{%
  \chapter*{%
    \tju@label@summary
    \markboth{\tju@label@summary}{}
  }
  \addcontentsline{toc}{chapter}{\tju@label@summary}
}{}

\newenvironment{bigabstract}{%
  \cleardoublepage
  \pagenumbering{roman}
  \pagestyle{biglast}
  \chapter*{%
    \bfseries
    \MakeUppercase\tju@value@englishtitle
    \vskip 20pt
  }
}{\cleardoublepage}

\endinput

%%
%% End of file `tjuthesis.cls'.
