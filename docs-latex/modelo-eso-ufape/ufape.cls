% ufape.cls - trabalhos acadêmicos da UFAPE (monografia e ESO).
% Uso: \documentclass[monografia]{ufape} ou \documentclass[eso]{ufape}
% Opções: arial, notas, frenteeverso.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufape}[2026/09/30 Modelo UFAPE: monografia e relatório de ESO]

% Opções
\newif\ifufape@eso
\newif\ifufape@arial
\newif\ifufape@notas
\newif\ifufape@duplex
\DeclareOption{monografia}{\ufape@esofalse}
\DeclareOption{eso}{\ufape@esotrue}
\DeclareOption{arial}{\ufape@arialtrue}
\DeclareOption{notas}{\ufape@notastrue}
\DeclareOption{frenteeverso}{\ufape@duplextrue}
\ExecuteOptions{monografia}
\ProcessOptions\relax

\ifufape@duplex
  \LoadClass[12pt,a4paper,twoside,openright]{report}
\else
  \LoadClass[12pt,a4paper,oneside]{report}
\fi

% Pacotes
\RequirePackage[T1]{fontenc}
\RequirePackage[brazilian]{babel}
\RequirePackage[scaled=.92]{helvet}
\ifufape@arial
  \renewcommand{\familydefault}{\sfdefault}
\else
  \IfFileExists{newtxtext.sty}
    {\RequirePackage{newtxtext,newtxmath}}
    {\RequirePackage{mathptmx}}
\fi
\ifufape@duplex
  \RequirePackage[a4paper,inner=3cm,outer=2cm,top=3cm,bottom=2cm,
    headheight=21pt,headsep=26.3pt]{geometry}
\else
  \RequirePackage[a4paper,left=3cm,top=3cm,right=2cm,bottom=2cm,
    headheight=21pt,headsep=26.3pt]{geometry}
\fi
\RequirePackage{etoolbox,indentfirst,graphicx,xcolor,array,
  multirow,enumitem,caption,float,newfloat,titlesec,fancyhdr,eso-pic}
\RequirePackage[titles]{tocloft}
\IfFileExists{xurl.sty}{\RequirePackage{xurl}}{\RequirePackage{url}}
\urlstyle{same}
\@ifundefined{counterwithout}{\RequirePackage{chngcntr}}{}

% Fonte e espaçamento
\newlength{\ufapelh}
\ifufape@eso\setlength{\ufapelh}{13.8pt}\else\setlength{\ufapelh}{20.7pt}\fi
\renewcommand\normalsize{%
  \@setfontsize\normalsize\@xiipt{\ufapelh}%
  \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\newcommand{\ufape@nosh}{\spaceskip=\fontdimen2\font plus\fontdimen3\font minus0pt\relax}
\newcommand{\ufape@font}[2]{\fontsize{#1}{#2}\selectfont\ufape@nosh}
\newcommand{\ufape@one}{\ufape@font{12pt}{13.8pt}}
\newcommand{\ufape@blank}[1]{\vspace{#1\ufapelh}}
\AtBeginDocument{\normalsize\ufape@nosh}
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0pt}
\raggedbottom
\hyphenpenalty=10000 \exhyphenpenalty=10000
\tolerance=9999 \emergencystretch=3em
\renewcommand\cleardoublepage{\clearpage\if@twoside\ifodd\c@page\else
  \hbox{}\thispagestyle{empty}\newpage\fi\fi}

% Metadados
\newcommand{\autor}[1]{\def\ufape@autor{#1}}
\newcommand{\titulo}[1]{\def\ufape@titulo{#1}}
\newcommand{\subtitulo}[1]{\def\ufape@subtitulo{#1}}
\newcommand{\curso}[1]{\def\ufape@curso{#1}}
\newcommand{\nomecurso}[1]{\def\ufape@nomecurso{#1}}
\def\ufape@nomecurso{}
\newcommand{\grau}[1]{\def\ufape@grau{#1}}
\newcommand{\orientador}[1]{\def\ufape@orientador{#1}}
\newcommand{\supervisor}[1]{\def\ufape@supervisor{#1}}
\newcommand{\periodo}[1]{\def\ufape@periodo{#1}}
\newcommand{\cidade}[1]{\def\ufape@cidade{#1}}
\newcommand{\ano}[1]{\def\ufape@ano{#1}}
\newcommand{\dataaprovacao}[1]{\def\ufape@dataaprov{#1}}
\newcommand{\logocurso}[1]{\def\ufape@logocurso{#1}}
\def\ufape@autor{Nome do Aluno}
\def\ufape@titulo{Título da monografia}
\def\ufape@subtitulo{subtítulo}
\def\ufape@curso{xxxxxxxx}
\def\ufape@grau{Bacharelado ou Licenciatura}
\def\ufape@orientador{Prof. Dr. Xxxxxxxxxxxxxxxxx}
\def\ufape@supervisor{Nome Completo do Professor}
\def\ufape@periodo{Mês a Mês de Ano}
\def\ufape@cidade{Garanhuns}
\def\ufape@ano{\the\year}
\def\ufape@dataaprov{\underline{\hspace{0.9cm}}/\underline{\hspace{0.9cm}}/\underline{\hspace{0.9cm}}}
\def\ufape@logocurso{}
\newcommand{\ufape@instituicao}{Universidade Federal do Agreste de Pernambuco}
\newcommand{\ufape@INSTITUICAO}{UNIVERSIDADE FEDERAL DO AGRESTE DE PERNAMBUCO}
\newcommand{\ufape@nc}{\ifdefempty{\ufape@nomecurso}{\ufape@curso}{\ufape@nomecurso}}
\ifufape@eso
  \newcommand{\ufape@natureza}{Relatório de Estágio Supervisionado Obrigatório
    apresentado como requisito parcial para a obtenção do título de
    \ufape@grau\ pelo Curso de \ufape@nc\ da \ufape@instituicao-UFAPE.}
  \newcommand{\ufape@naturezacompl}{Professor Supervisor: \ufape@supervisor\par
    Período: \ufape@periodo}
\else
  \newcommand{\ufape@natureza}{Trabalho de Conclusão de Curso apresentado como
    requisito parcial para a obtenção do título de \ufape@grau\ pelo Curso de
    \ufape@nc\ da \ufape@instituicao\ - UFAPE.}
  \newcommand{\ufape@naturezacompl}{Orientador (a): \ufape@orientador.}
\fi
\newcommand{\ufape@tituloline}{%
  \MakeUppercase{\ufape@titulo}%
  \ifdefempty{\ufape@subtitulo}{}{: \ufape@subtitulo}}

% Anotações do modelo original (opção `notas`)
\definecolor{ufapenota}{RGB}{0,0,153}
\newcommand{\nota}[1]{%
  \ifufape@notas\par\vspace{\ifufape@eso 2\fi\ufapelh}{\color{ufapenota}#1}\par\fi}
\newcommand{\ufape@nl}[1]{%
  \par\begingroup\centering\normalfont\normalsize
  \ifufape@notas(#1)\else\mbox{}\fi\par\endgroup}
\newcommand{\ufape@nreq}{Centralizado, negrito, fonte 12, letras maiúsculas}
\newcommand{\ufape@nopc}{Opcional, centralizado, negrito, fonte 12, letras maiúsculas}
\newcommand{\ufape@nfim}{Centralizado, negrito, fonte 12, letras maiúsculas.}
\newcommand{\ufape@cl}[1]{\par\begingroup\centering #1\par\endgroup}
\newcommand{\ufape@top}[1]{\vspace*{\dimexpr #1-\ufapelh\relax}}
\newcommand{\ufape@dy}[2]{\vspace{\dimexpr #1-#2\relax}}
% Atalhos públicos (evitam \makeatletter nos capítulos)
\newcommand{\textocentralizado}[1]{\ufape@cl{#1}}
\newcommand{\linhamodelo}[1]{\ufape@nl{#1}}

% Paginação
\ifufape@duplex
  \fancypagestyle{ufape}{\fancyhf{}\fancyhead[LE,RO]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}}
  \fancypagestyle{plain}{\fancyhf{}\fancyhead[LE,RO]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}}
\else
  \fancypagestyle{ufape}{\fancyhf{}\fancyhead[R]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}}
  \fancypagestyle{plain}{\fancyhf{}\fancyhead[R]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}}
\fi
\pagestyle{empty}

% Títulos (NBR 6024: 5 níveis)
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
\titleformat{\chapter}[block]{\normalfont\bfseries}{\thechapter}{1ex}{\MakeUppercase}
\titleformat{name=\chapter,numberless}[block]{\normalfont\bfseries}{}{0pt}{\MakeUppercase}
\titleformat{\section}[block]{\normalfont}{\thesection}{1ex}{\MakeUppercase}
\titleformat{\subsection}[block]{\normalfont\bfseries}{\thesubsection}{1ex}{}
\titleformat{\subsubsection}[block]{\normalfont}{\thesubsubsection}{1ex}{}
\titleformat{\paragraph}[block]{\normalfont\itshape}{\theparagraph}{1ex}{}
\renewcommand{\theparagraph}{\thesubsubsection.\arabic{paragraph}}
\titlespacing*{\chapter}{0pt}{-\ufapelh}{\ufapelh}
\titlespacing*{\section}{0pt}{\ufapelh}{\ufapelh}
\titlespacing*{\subsection}{0pt}{\ufapelh}{\ufapelh}
\titlespacing*{\subsubsection}{0pt}{\ufapelh}{\ufapelh}
\titlespacing*{\paragraph}{0pt}{\ufapelh}{\ufapelh}
\let\ufape@chapter\chapter
\let\ufape@section\section
\renewcommand{\chapter}{\@ifstar{\ufape@chapter*}{\@dblarg\ufape@chap}}
\def\ufape@chap[#1]#2{\ufape@chapter[\texorpdfstring{\MakeUppercase{#1}}{#1}]{#2}}
\renewcommand{\section}{\@ifstar{\ufape@section*}{\@dblarg\ufape@sect}}
\def\ufape@sect[#1]#2{\ufape@section[\texorpdfstring{\MakeUppercase{#1}}{#1}]{#2}}

% Sumário e listas
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforesubsubsecskip}{0pt}
\setlength{\cftbeforeparaskip}{0pt}
\setlength{\cftbeforefigskip}{0pt}
\setlength{\cftbeforetabskip}{0pt}
\setlength{\cftchapindent}{0pt}   \setlength{\cftchapnumwidth}{1.9cm}
\setlength{\cftsecindent}{0pt}    \setlength{\cftsecnumwidth}{1.9cm}
\setlength{\cftsubsecindent}{0pt} \setlength{\cftsubsecnumwidth}{1.9cm}
\setlength{\cftsubsubsecindent}{0pt} \setlength{\cftsubsubsecnumwidth}{1.9cm}
\setlength{\cftparaindent}{0pt}   \setlength{\cftparanumwidth}{1.9cm}
\renewcommand{\cftchapfont}{\normalfont\bfseries}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont\bfseries}
\renewcommand{\cftsubsubsecfont}{\normalfont}
\renewcommand{\cftparafont}{\normalfont\itshape}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftsubsecpagefont}{\normalfont}
\renewcommand{\cftparapagefont}{\normalfont}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftdotsep}{1.5}
\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}
\setlength{\cftfignumwidth}{2.2cm}
\setlength{\cfttabnumwidth}{2.2cm}
\renewcommand{\cftfigpresnum}{Figura~}
\renewcommand{\cftfigaftersnum}{\space-}
\renewcommand{\cfttabpresnum}{Tabela~}
\renewcommand{\cfttabaftersnum}{\space-}

% Figuras, quadros e tabelas
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\DeclareFloatingEnvironment[fileext=loq,name=Quadro,within=none,
  listname={LISTA DE QUADROS},placement=htbp]{quadro}
\renewcommand{\l@quadro}[2]{%
  \begingroup
    \def\numberline##1{\hb@xt@\@tempdima{Quadro~##1\space-\hfil}}%
    \@dottedtocline{1}{0pt}{2.2cm}{#1}{#2}%
  \endgroup}
\AtBeginDocument{%
  \renewcommand{\@dotsep}{1.5}
  \renewcommand{\l@figure}[2]{%
    \begingroup
      \def\numberline##1{\hb@xt@\@tempdima{Figura~##1\space-\hfil}}%
      \@dottedtocline{1}{0pt}{2.2cm}{#1}{#2}%
    \endgroup}
  \renewcommand{\l@table}[2]{%
    \begingroup
      \def\numberline##1{\hb@xt@\@tempdima{Tabela~##1\space-\hfil}}%
      \@dottedtocline{1}{0pt}{2.2cm}{#1}{#2}%
    \endgroup}}
\DeclareCaptionLabelSeparator{hifen}{\space-\space}
\DeclareCaptionFont{ufapecap}{\fontsize{11pt}{12.65pt}\selectfont}
\DeclareCaptionFont{ufapeone}{\fontsize{12pt}{13.8pt}\selectfont}
\captionsetup{justification=centering,singlelinecheck=false,position=top,
  labelfont=md,textfont=md}
\captionsetup[figure]{font=ufapecap,skip=6pt,labelsep=hifen}
\captionsetup[quadro]{font=ufapecap,skip=6pt,labelsep=hifen}
\captionsetup[table]{font=ufapeone,skip=-1pt,labelsep=endash,format=hang,
  justification=raggedright,singlelinecheck=false,margin={26pt,26pt}}
\ifufape@eso\captionsetup[figure]{labelsep=endash}\fi
\AtBeginEnvironment{figure}{\centering\ufape@font{10pt}{11.5pt}}
\AtBeginEnvironment{table}{\centering\ufape@one}
\AtBeginEnvironment{quadro}{\centering\ufape@font{10pt}{11.5pt}}
\newcommand{\fonte}[2][0pt]{\par\vspace{2pt}{\raggedright\ufape@font{10pt}{11.5pt}%
  \noindent\hspace*{#1}Fonte: #2\par}}
\newcommand{\nc}[1]{\hfill#1\hspace*{3.2pt}}
\newcommand{\tabelaibge}{\ufape@font{7pt}{8.05pt}}
\newcommand{\quadrotexto}{\ufape@font{10pt}{11.5pt}}

% Citação longa (NBR 10520) e listas
\newenvironment{citacaolonga}{%
  \par\vspace{7.5pt}\begingroup\ufape@font{10pt}{11.5pt}%
  \leftskip=4cm \parindent=0pt}{\par\endgroup\vspace{5.8pt}}
\newcommand{\ufape@bullet}{\raisebox{0.28ex}{\rule{3.4pt}{3.4pt}}}
\setlist[itemize]{topsep=0pt,itemsep=0pt,parsep=0pt,partopsep=0pt,
  leftmargin=36pt,labelindent=18pt,labelwidth=18pt,labelsep=0pt,align=left}
\renewcommand{\labelitemi}{\ufape@bullet}

% Pré-textuais
\newcommand{\ufape@pretitle}[2]{%
  \ufape@cl{\bfseries #1}\ufape@nl{#2}\ufape@blank{1}}
\newcommand{\ufape@logos}{%
  \AddToShipoutPictureBG*{%
    \AtPageUpperLeft{%
      \ifufape@eso
        \put(76.6,-106.5){\includegraphics[height=61.8pt]{figuras/logo-ufape.png}}%
      \else
        \put(76.6,-112.4){\includegraphics[height=61.8pt]{figuras/logo-ufape.png}}%
      \fi
      \ifdefempty{\ufape@logocurso}{}{%
        \put(539,-\ifufape@eso 106.5\else 112.4\fi){\makebox(0,0)[br]{%
          \includegraphics[height=61.8pt]{\ufape@logocurso}}}}}}}
\newenvironment{ufape@bloco}{%
  \par\begingroup\ufape@one\leftskip=8cm \parindent=0pt}{\par\endgroup}
\newcommand{\capa}{%
  \clearpage\thispagestyle{empty}\ufape@logos
  \ifufape@eso
    \ufape@top{81pt}%
    \ufape@cl{\bfseries\ufape@INSTITUICAO}\ufape@cl{\bfseries CURSO EM \MakeUppercase{\ufape@curso}}\ufape@nl{\ufape@nreq}
    \ufape@blank{8}\ufape@cl{\bfseries\MakeUppercase{\ufape@autor}}\ufape@nl{\ufape@nreq}
    \ufape@blank{8}\ufape@cl{\bfseries\ufape@tituloline}\ufape@nl{\ufape@nreq}
    \ufape@blank{19}%
  \else
    \ufape@top{41.4pt}%
    \ufape@cl{\bfseries\ufape@INSTITUICAO}\ufape@cl{\bfseries CURSO EM \MakeUppercase{\ufape@curso}}\ufape@nl{\ufape@nreq}
    \ufape@blank{2}\ufape@cl{\bfseries\MakeUppercase{\ufape@autor}}\ufape@nl{\ufape@nreq}
    \ufape@blank{7}\ufape@cl{\bfseries\ufape@tituloline}\ufape@nl{\ufape@nreq}
    \ufape@blank{14}%
  \fi
  \ufape@cl{\MakeUppercase{\ufape@cidade}}\ufape@cl{\ufape@ano}%
  \clearpage}
\newcommand{\folhaderosto}{%
  \cleardoublepage\thispagestyle{empty}
  \ufape@cl{\bfseries\ufape@INSTITUICAO}\ufape@cl{\bfseries CURSO EM \MakeUppercase{\ufape@curso}}\ufape@nl{\ufape@nreq}
  \ifufape@eso
    \ufape@blank{8}\ufape@cl{\bfseries\MakeUppercase{\ufape@autor}}\ufape@nl{\ufape@nreq}
    \ufape@blank{7}\ufape@cl{\bfseries\ufape@tituloline}\ufape@nl{\ufape@nreq}
    \ufape@dy{82pt}{13.8pt}%
  \else
    \ufape@blank{4}\ufape@cl{\bfseries\MakeUppercase{\ufape@autor}}\ufape@nl{\ufape@nreq}
    \ufape@blank{5}\ufape@cl{\bfseries\ufape@tituloline}\ufape@nl{\ufape@nreq}
    \ufape@dy{83pt}{13.8pt}%
  \fi
  \begin{ufape@bloco}\ufape@natureza\par\ufape@dy{27.6pt}{13.8pt}\ufape@naturezacompl\end{ufape@bloco}
  \vfill
  \ufape@cl{\MakeUppercase{\ufape@cidade}}\ufape@cl{\ufape@ano}%
  \vspace{\ifufape@eso 13pt\else 6pt\fi}\clearpage}
\newcommand{\fichacatalografica}{%
  \clearpage\thispagestyle{empty}
  \ufape@top{360pt}%
  \begingroup\ufape@font{10.5pt}{12pt}%
  \ufape@cl{Dados Internacionais de Catalogação na Publicação}%
  \ufape@cl{\ufape@instituicao}%
  \ufape@cl{Sistema Integrado de Bibliotecas}\endgroup
  \par\vspace{-17.7pt}\noindent\hspace*{37.9pt}%
  {\fboxsep=0pt\fboxrule=0.5pt
   \fbox{\parbox[t][203.9pt][t]{378.3pt}{\ufape@font{11pt}{14.5pt}%
     \vspace{28.7pt}%
     \ufape@cl{Ficha Catalográfica}\ufape@dy{49pt}{14.5pt}%
     \begingroup\leftskip=61pt \rightskip=5.8pt \parindent=9pt
     Acesse o endereço eletrônico: \href{https://solicita.ufape.edu.br}{solicita.ufape.edu.br}
     e siga as orientações para solicitação.\par\endgroup
     \ufape@dy{49pt}{14.5pt}%
     \begingroup\leftskip=61pt \rightskip=5.8pt \parindent=14pt
     Em caso de dúvidas, entrar em contato com as bibliotecárias da UFAPE.\par\endgroup}}}
  \clearpage}
\newenvironment{errata}{%
  \cleardoublepage\thispagestyle{empty}\ufape@cl{\bfseries ERRATA}%
  \ufape@dy{\dimexpr 2\ufapelh\relax}{13.8pt}\ufape@one}{%
  \ifufape@notas
  \par\vspace{\ifufape@eso 43.6pt\else 58pt\fi}\noindent\hspace*{\ifufape@eso 122.1pt\else 122.6pt\fi}%
  {\fboxsep=0pt\fboxrule=0.75pt
   \fbox{\hspace*{8.4pt}\parbox[c]{164.1pt}{\color{ufapenota}\sffamily\bfseries\ufape@font{11pt}{15.4pt}%
     \rule{0pt}{15pt}Elemento opcional. Se for necessário corrigir depois que o trabalho
     estiver impresso, deve ser inserida logo após a folha de rosto,
     constituída pela referência do trabalho e pelo texto da errata.
     Apresentada em papel avulso ou encartado, acrescida ao trabalho depois
     de impresso.\rule[-6.5pt]{0pt}{6.5pt}}\hspace*{8.4pt}}}\par
  \fi
  \clearpage}
\newcommand{\errataref}[1]{{\raggedright\noindent #1\par}%
  \vspace{\dimexpr\ufapelh-\ifufape@eso 0.5pt\else 0.4pt\fi\relax}}
\newcommand{\tabelaerrata}[4]{%
  \par\noindent\hspace*{-5.8pt}%
  {\renewcommand{\arraystretch}{1.0}\setlength{\tabcolsep}{0pt}\setlength{\arrayrulewidth}{0.5pt}%
   \begin{tabular}{|*{4}{>{\centering\arraybackslash}p{106.1pt}|}}
     \hline
     \ifufape@eso\rule{0pt}{9.7pt}\else\rule[-9.1pt]{0pt}{20.6pt}\fi
       \textbf{Folha} & \textbf{Linha} & \textbf{Onde se lê} & \textbf{Leia-se}\\ \hline
     \ifufape@eso\rule{0pt}{9.7pt}\else\rule[-9.1pt]{0pt}{20.6pt}\fi
       #1 & #2 & #3 & #4\\ \hline
   \end{tabular}}\par}
\def\ufape@banca{}
\newcommand{\membrobanca}[2]{%
  \appto\ufape@banca{%
    \ufape@cl{\underline{\hspace{7.3cm}}}%
    \ufape@cl{#1}\ufape@cl{#2}\ifufape@eso\ufape@blank{2}\fi}}
\newcommand{\ufape@folhaaprov}{%
  \ufape@cl{\bfseries\MakeUppercase{\ufape@autor}}\ufape@nl{\ufape@nreq}
  \ufape@blank{5}%
  \ufape@cl{\bfseries\ufape@tituloline}\ufape@nl{\ufape@nreq}
  \ifufape@eso\ufape@dy{41.4pt}{13.8pt}\else\ufape@dy{83pt}{13.8pt}\fi
  \begin{ufape@bloco}\ufape@natureza\ifufape@eso\else\par\ufape@dy{27.6pt}{13.8pt}\ufape@naturezacompl\fi\end{ufape@bloco}
  \ifufape@eso\ufape@dy{69pt}{\ufapelh}\else\ufape@dy{34pt}{\ufapelh}\fi
  \par\noindent Aprovado em \ufape@dataaprov\par
  \ufape@blank{\ifufape@eso 2\else 1\fi}\ufape@cl{BANCA EXAMINADORA}\ufape@blank{\ifufape@eso 2\else 1\fi}
  \ufape@banca
  \ifufape@notas\ifufape@eso\else
    \AddToShipoutPictureFG*{\AtPageUpperLeft{\put(36,-551){%
      \color{ufapenota}\sffamily\bfseries\ufape@font{11pt}{13pt}%
      \parbox[t]{3.4cm}{\centering NÃO COLOCAR AS ASSINATURAS DOS PARTICIPANTES DA
      BANCA, APENAS OS NOMES}}}}%
  \fi\fi}
\newcommand{\conteudofolhaaprovacao}{\ufape@folhaaprov}
\newcommand{\folhadeaprovacao}{%
  \cleardoublepage\thispagestyle{empty}\ufape@folhaaprov\clearpage}
\newenvironment{dedicatoria}{%
  \cleardoublepage\thispagestyle{empty}\vspace*{\fill}\par
  \begingroup\leftskip=8cm \parindent=0pt}{\par\endgroup\vspace{6pt}\clearpage}
\newenvironment{epigrafe}{%
  \cleardoublepage\thispagestyle{empty}\vspace*{\fill}\par
  \begingroup\ufape@font{11pt}{12.65pt}\leftskip=8cm \parindent=0pt}{%
  \par\endgroup\vspace{3.5pt}\clearpage}
\newenvironment{agradecimentos}{%
  \cleardoublepage\thispagestyle{empty}\ufape@pretitle{\textbf{AGRADECIMENTOS}}{\ufape@nreq}}{\clearpage}
\newenvironment{resumo}{%
  \cleardoublepage\thispagestyle{empty}\ufape@pretitle{\textbf{RESUMO}}{\ufape@nreq}\setlength{\parindent}{0pt}}{\clearpage}
\renewenvironment{abstract}{%
  \cleardoublepage\thispagestyle{empty}\ufape@pretitle{\textbf{ABSTRACT}}{\ufape@nreq}\setlength{\parindent}{0pt}}{\clearpage}
\newcommand{\palavraschave}[1]{\par\vspace{\ifufape@eso 2\fi\ufapelh}\noindent\textbf{Palavras-chave:} #1\par}
\newcommand{\keywords}[1]{\par\vspace{\ifufape@eso 2\fi\ufapelh}\noindent\textbf{\textit{Keywords:}} #1\par}

% Sumário e listas
\newcommand{\sumario}{%
  \cleardoublepage\thispagestyle{empty}\ufape@pretitle{\textbf{SUMÁRIO}}{\ufape@nreq}%
  \@starttoc{toc}%
  \ifufape@notas\ufape@blank{5}{\color{ufapenota}\noindent Para a elaboração de Sumário, consulte a NBR 6027.\par}\fi
  \clearpage}
\newcommand{\listadefiguras}{%
  \cleardoublepage\thispagestyle{empty}\ufape@pretitle{\textbf{LISTA DE FIGURAS}}{\ufape@nopc}%
  \begingroup\renewcommand{\addvspace}[1]{}\@starttoc{lof}\endgroup\clearpage}
\newcommand{\listadequadros}{%
  \cleardoublepage\thispagestyle{empty}\ufape@pretitle{\textbf{LISTA DE QUADROS}}{\ufape@nopc}%
  \begingroup\renewcommand{\addvspace}[1]{}\@starttoc{loq}\endgroup\clearpage}
\newcommand{\listadetabelas}{%
  \cleardoublepage\thispagestyle{empty}\ufape@pretitle{\textbf{LISTA DE TABELAS}}{\ufape@nopc}%
  \begingroup\renewcommand{\addvspace}[1]{}\@starttoc{lot}\endgroup\clearpage}
\newenvironment{siglas}[1][2.19cm]{%
  \begin{list}{}{%
    \setlength{\leftmargin}{#1}\setlength{\labelwidth}{#1}%
    \setlength{\labelsep}{0pt}\setlength{\itemindent}{0pt}%
    \setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}%
    \setlength{\topsep}{0pt}\setlength{\partopsep}{0pt}%
    \renewcommand{\makelabel}[1]{##1\hfil}}%
  \setlength{\parindent}{0pt}}{\end{list}}
\newcommand{\listadesiglas}[1]{%
  \cleardoublepage\thispagestyle{empty}\ufape@pretitle{\textbf{LISTAS DE ABREVIAÇÕES E SIGLAS}}{\ufape@nopc}%
  \begin{siglas}[2.19cm]#1\end{siglas}\clearpage}
\newcommand{\listadesimbolos}[1]{%
  \cleardoublepage\thispagestyle{empty}\ufape@pretitle{\textbf{LISTA DE SÍMBOLOS}}{\ufape@nopc}%
  \begin{siglas}[1.19cm]#1\end{siglas}\clearpage}

% Texto e pós-textuais
\newcommand{\iniciotexto}{\cleardoublepage\pagestyle{ufape}}
\newenvironment{referencias}{%
  \cleardoublepage\phantomsection
  \ufape@cl{\bfseries REFERÊNCIAS}%
  \addcontentsline{toc}{chapter}{\protect\numberline{}REFERÊNCIAS}%
  \ufape@nl{\ufape@nfim}\vspace{\dimexpr\ufapelh-13.8pt\relax}%
  \begingroup\ufape@one\raggedright\setlength{\parindent}{0pt}%
  \setlength{\parskip}{13.8pt}}{\par\endgroup}
\newcommand{\refitem}[1]{#1\par}
\newcommand{\refnota}[1]{\ifufape@notas\vspace{\ifufape@eso 13.8pt\else 41.4pt\fi}#1\par\fi}
\newcommand{\ufape@posdivisao}[3]{%
  \cleardoublepage\phantomsection
  \ufape@cl{\bfseries\MakeUppercase{#1 #2 -- #3}}%
  \addcontentsline{toc}{chapter}{\protect\numberline{}\texorpdfstring{\MakeUppercase{#1 #2 -- #3}}{#1 #2 -- #3}}%
  \ifufape@eso\ufape@dy{27.6pt}{13.8pt}%
  \else\ufape@nl{\ufape@nfim}\ufape@dy{27pt}{\ufapelh}\fi}
\newcommand{\apendice}[2]{\ufape@posdivisao{Apêndice}{#1}{#2}}
\newcommand{\anexo}[2]{\ufape@posdivisao{Anexo}{#1}{#2}}

% Hiperlinks
\AtEndPreamble{%
  \RequirePackage[hidelinks,linktoc=all,breaklinks=true]{hyperref}
  \hypersetup{pdftitle={\ufape@titulo},pdfauthor={\ufape@autor}}}
\endinput
