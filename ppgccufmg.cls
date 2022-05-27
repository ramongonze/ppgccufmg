%% Identificação da classe

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ppgccufmg}[2022/05/26 Classe Uma classe LaTeX para dissertações, teses e propostas do Programa de Pós-Graduação em Ciência da Computação (PPGCC) da Universidade Federal de Minas Gerais (UFMG).]

%% Declarações preliminares
\LoadClass[a4paper, %% Tipo da folha
		   12pt, %% Tamanho da fonte
		   oneside
]{memoir}

%% Pacotes ----------------------------------
\RequirePackage[
	a4paper,
	left=3cm,
	right=2cm,
	top=3cm,
	bottom=2cm
]{geometry} %% Usado para definir tamanho das margens
\RequirePackage{fancyhdr} %% Usado para colocar a numeração no canto superior direito da página
\RequirePackage{pdfpages} %% Inclusão de pdfs
\RequirePackage{tocloft} %% Modificar o sumário, lista de figuras e lista de tabelas
%% ------------------------------------------


%% Comandos auxiliares ----------------------
\newenvironment{recuoesquerdaoitocm}{	
	\begin{flushleft} %% Alinha o texto à esquerda
	\leftskip=5cm %% Adiciona 5cm além da margem esquerda de 3cm, totalizando 8cm
}{\end{flushleft}}
%% ------------------------------------------

%% Definições gerais ------------------------


%% Estilos de páginas -----------------------
%% Define o estilo padrão da maioria das páginas do documento. estilopadrao é uma modificação do estilo 'fancy', do pacote fancyhdr
\fancypagestyle{estilopadrao}[fancydefault]{
	\fancyhf{} %% Reseta o que tem no header e footer (deixa tudo em branco)
	\fancyhead[R]{\thepage} %% Coloca a numeração da página no canto direito do header
	\fancyhead[L]{\rightmark} %% Coloca o nome da seção no canto esquerdo do header
}

%% Altera o estilo plain que é o estilo padrão das páginas do início dos capítulos
\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt} %% Remove a linha to header
	\fancyhead[R]{\thepage} %% Coloca a numeração da página no canto direito do header
	
}

%% Estilo do resumo e do abstract
\fancypagestyle{estiloresumoeabstract}[plain]{
	\fancyhf{} %% Reseta estilo do header e footer
	\fancyhead[R]{}
}

%% Estilo do sumário, lista de figuras e lista de tabelas
\fancypagestyle{estilotocloft}[plain]{
	\fancyhf{}
}

%% Estilo da capa
\fancypagestyle{estilocapa}[plain]{
	\fancyhf{} %% Reseta estilo do header e footer
	\centering %% Centraliza o texto
	\SingleSpacing %% Define o espaçamento entre linhas para 1cm
}

%% ------------------------------------------


%% Define o estilo do nome do capítulo no header
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}

%% Definição da capa
\renewcommand{\maketitle}{
	\begingroup
	\pagestyle{estilocapa}
	\textbf{
		UNIVERSIDADE FEDERAL DE MINAS GERAIS\\
		Instituto de Ciências Exatas\\
		Programa de Pós-Graduação em Ciência da Computação\\
	}
	
	\vspace{5cm}
	
	Autor
	
	\vspace{4cm}
	
	\textbf{TÍTULO: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.}
	
	\vfill
	
	Cidade\\
	Ano
	\clearpage %% Termina a página atual aqui
	\endgroup
}

%% Folha de rosto em português
\newcommand{\folhaderostoportugues}{
	\begingroup
	\pagestyle{estilocapa}
	
	Autor
	
	\vspace{6cm}
	
	\textbf{TÍTULO: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.}
	
	\vspace{2cm}
	
	\begin{recuoesquerdaoitocm}
		\textbf{Versão}
	\end{recuoesquerdaoitocm}

	\vspace{3cm}
	
	\hbox{ %% Comando utilizado para não ultrapassar a margem a direita
		\begin{minipage}{\textwidth}
			\leftskip=5cm
			Dissertação apresentada ao Programa de Pós-Graduação em Ciência da Computação da Universidade Federal de Minas Gerais, como requisito parcial à obtenção do título de Mestre em Ciência da Computação.
			%Tese apresentada ao Programa de Pós-Graduação em Ciência da Computação da Universidade Federal de Minas Gerais, como requisito parcial à obtenção do título de Doutor em Ciência da Computação.
			%Monografia apresentada	como requisito para a conclusão da Graduação em Sistemas de Informação da Universidade Federal de Minas Gerais.
		\end{minipage}
	}

	\vspace{1.5cm}

	\begin{recuoesquerdaoitocm}
		Orientador: Fulano de tal\\	
		Coorientador: Fulana de tal
	\end{recuoesquerdaoitocm}

	\vfill
	
	Cidade\\
	Ano
	\clearpage %% Termina a página atual aqui
	\endgroup
}

%% Folha de rosto em inglês
\newcommand{\folhaderostoingles}{
}

%% Ficha catalográfica. O parâmetro deve ser o nome do arquivo com a extensão .pdf
\newcommand{\fichacatalografica}[1]{
	\includepdf[pages=-]{#1}
}

%% Folha de aprovação. O parâmetro deve ser o nome do arquivo com a extensão .pdf
\newcommand{\folhadeaprovacao}[1]{
	\includepdf[pages=-]{#1}
}

%% Dedicatória. O parâmetro deve ser o nome do arquivo com a extensão .tex contendo a dedicatória.
\newcommand{\dedicatoria}[1]{
	\begingroup
		\pagestyle{empty}
		\leftskip=5cm % Somado a 3cm da margem esquerda = 8cm
		\vspace*{\fill}
		\noindent \textit{\input{#1}}
		\clearpage
	\endgroup
}

%% Agradecimentos. O parâmetro deve ser o nome do arquivo com a extensão .tex contendo os agradecimentos.
\newcommand{\agradecimentos}[1]{
	\chapter*{Agradecimentos}
	\input{#1}
	\clearpage
}

%% Epígrafe. O primeiro parâmetro é o próprio epígrafe e o segundo parâmetro o autor.
\newcommand{\epigrafe}[2]{
	\begingroup
	\pagestyle{empty}
	\vspace*{\fill}
		\raggedleft
		``\textit{#1}''\\
		(#2)
	\clearpage
	\endgroup
}

%% Resumo. O primeiro parâmetro deve ser o nome do arquivo com a extensão .tex contendo o resumo, e o segundo parâmetro uma lista com as palavras-chave.
\newcommand{\resumo}[2]{
	\begingroup
		\pagestyle{estiloresumoeabstract}
		\chapter*{Resumo}
		\input{#1}
		
		\vspace{1cm}
		\noindent\textbf{Palavras-chave:} #2
		\clearpage
	\endgroup
}

%% Abstract. O primeiro parâmetro deve ser o nome do arquivo com a extensão .tex contendo o abstract, e o segundo parâmetro uma lista com as palavras-chave.
\renewcommand{\abstract}[2]{
	\begingroup
		\pagestyle{estiloresumoeabstract}
		\chapter*{Abstract}
		\input{#1}
		
		\vspace{1cm}
		\noindent\textbf{Keywords:} #2
		\clearpage
	\endgroup
}

%% Comando principal que desenha todos os elementos pré-textuais (capa, folha de rosto, abstract, ...)
\newcommand{\ppgccufmg}{%
	\pagestyle{estilopadrao} %% Define 'estilopadrao' como sendo o estilo 'global' das páginas
	
	%% Define o estilo do sumário, lista de figuras e lista de tabelas
%	\tocloftpagestyle{plain}
	
	\maketitle %% Capa
	
%	\setcounter{page}{1} %% Comando utilizado para que a capa não conte na numeração das páginas
	
%	\folhaderostoingles %% Folha de rosto em inglês

	\folhaderostoportugues %% Folha de rosto em português	
	
	\fichacatalografica{fichacatalografica.pdf}
	
	\folhadeaprovacao{folhadeaprovacao.pdf}
	
	\dedicatoria{dedicatoria.tex}
	
	\agradecimentos{agradecimentos.tex}
	
	\epigrafe{Truth and lie are opposite things.}{Unkown}
	
	\resumo{resumo.tex}{Visão Computacional, Redes, Sabotagens}
	
	\abstract{abstract.tex}{Computer Vision, Networks, Sabotage}
	
	\listoffigures* %% Lista de figuras
	
	\clearpage
	
	\listoftables* %% Lista de tabelas
	
	\clearpage
	
	%% TODO: Comando para adicionar outros elementos pré-textuais, como por exemplo lista de algoritmos, erratas, ...
	
	\begin{KeepFromToc}
		\tableofcontents %% Sumário
	\end{KeepFromToc}
}

%% ------------------------------------------

%% Comandos que serão exercutados logo após o comando \begin{document}
\AtBeginDocument{
	\setsecnumdepth{subsection} %% Define a profundidade das seções (permite capítulo, seção e sub-seção)
	\OnehalfSpacing %% Espaçamento de 1,5cm entre linhas
	\setlength{\parindent}{1.25cm} %% Recuo de 1,25 cm à esquerda em parágrafos
	\setheadfoot{\baselineskip}{1.5cm} %% Define o tamanho do header e o espaço entre o header e o texto
	\setlength{\beforechapskip}{0cm} %% Remove o espaçamento adicional de 2cm antes dos títulos dos capítulos
	\setlength{\afterchapskip}{1.5cm} %% Espaçamento depois do título de um capítulo
	\setbeforesecskip{1.5cm} %% Espaçamento antes do título da seção
	\setaftersecskip{1.5cm} %% Espaçamento depois do título da seção
	\setbeforesubsecskip{1.5cm} %% Espaçamento antes do título da sub-seção
	\setaftersubsecskip{1.5cm} %% Espaçamento depois do título da sub-seção
}



