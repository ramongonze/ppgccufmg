%%
%% Copyright (C) 2022 by Ramon Gonçalves Gonze
%%

%% Identificação da classe %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ppgccufmg}[2022/05/26 Classe Uma classe LaTeX para dissertações, teses e propostas do Programa de Pós-Graduação em Ciência da Computação (PPGCC) da Universidade Federal de Minas Gerais (UFMG).]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% DECLARAÇÕES PRELIMINARES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Comandos auxiliares ======================
\newenvironment{recuoesquerdaoitocm}{	
	\begin{flushleft} %% Alinha o texto à esquerda
	\leftskip=5cm %% Adiciona 5cm além da margem esquerda de 3cm, totalizando 8cm
}{\end{flushleft}}
%% ==========================================

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  OPÇÕES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{portugues}{\def\idiomapt} %% Define português como sendo o idioma do documento
\DeclareOption{english}{\def\idiomaen} %% Define inglês como sendo o idioma do documento
\DeclareOption{msc}{\def\msc} %% Dissertação de mestrado
\DeclareOption{phd}{\def\phd} %% Tese de doutorado
\DeclareOption{mscproposta}{\def\mscproposta} %% Proposta de dissertação de mestrado
\DeclareOption{phdproposta}{\def\phdproposta} %% Proposta de tese de doutorado

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper, %% Tipo da folha
	12pt, %% Tamanho da fonte
	oneside
]{memoir}

%% OUTRAS DECLARAÇÕES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pacotes ==================================
\RequirePackage[
	a4paper,
	left=3cm,
	right=2cm,
	top=3cm,
	bottom=2cm
]{geometry} %% Usado para definir tamanho das margens
\RequirePackage{fancyhdr} %% Usado para colocar a numeração no canto superior direito da página
\RequirePackage{pdfpages} %% Inclusão de pdfs
\RequirePackage{xkeyval} %% Utilizar keys no comando ppgccufmg
\RequirePackage{xstring} %% Utilizar \IfStrEq
%% ==========================================

%% Estilos de páginas =======================

%% Define o estilo padrão da maioria das páginas do documento. estilopadrao é uma modificação do estilo 'fancy', do pacote fancyhdr
\fancypagestyle{estilopadrao}[fancydefault]{
	\fancyhf{} %% Reseta o que tem no header e footer (deixa tudo em branco)
	\fancyhead[R]{\thepage} %% Coloca a numeração da página no canto direito do header
	\fancyhead[L]{\nouppercase{\rightmark}} %% Coloca o nome da seção no canto esquerdo do header
}

%% Altera o estilo plain que é o estilo padrão das páginas do início dos capítulos
\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt} %% Remove a linha to header
	\fancyhead[R]{\thepage} %% Coloca a numeração da página no canto direito do header
}

%% Estilo da capa
\fancypagestyle{estilocapa}[plain]{
	\fancyhf{} %% Reseta estilo do header e footer
	\centering %% Centraliza o texto
	\SingleSpacing %% Define o espaçamento entre linhas para 1cm
}

%% ==========================================

%% Parâmetros ppgcc =========================
\define@key{ppgcc}{autor}{\defautor{#1}}
\define@key{ppgcc}{titulopt}{\deftitulopt{#1}} %% Título em português
\define@key{ppgcc}{tituloen}{\deftituloen{#1}} %% Título em inglês
\define@key{ppgcc}{cidade}{\defcidade{#1}}
\define@key{ppgcc}{ano}{\defano{#1}}
\define@key{ppgcc}{versaopt}{\defversaopt{#1}} %% Versão do documento em português
\define@key{ppgcc}{versaoen}{\defversaoen{#1}} %% Versão do documento em português
\define@key{ppgcc}{orientador}{\deforientador{#1}}
\define@key{ppgcc}{orientadora}{\deforientadora{#1}}
\define@key{ppgcc}{coorientador}{\defcoorientador{#1}}
\define@key{ppgcc}{coorientadora}{\defcoorientadora{#1}}
\define@key{ppgcc}{fichacatalografica}{\deffichacatalografica{#1}}
\define@key{ppgcc}{folhadeaprovacao}{\deffolhadeaprovacao{#1}}
\define@key{ppgcc}{resumo}{\defresumo{#1}}
\define@key{ppgcc}{abstracten}{\defabstracten{#1}}
\define@key{ppgcc}{palavraschave}{\defpalavraschave{#1}} %% Palavras-chave do resumo em português
\define@key{ppgcc}{keywords}{\defkeywords{#1}} %% Palavras-chave do abstract em inglês
\define@key{ppgcc}{epigrafe}{\defepigrafe{#1}} %% Texto do epígrafe
\define@key{ppgcc}{epigrafeautor}{\defepigrafeautor{#1}} %% Autor do epígrafe
\define@key{ppgcc}{dedicatoria}{\defdedicatoria{#1}}
\define@key{ppgcc}{agradecimentos}{\defagradecimentos{#1}}
\define@key{ppgcc}{listadefiguras}{\deflistadefiguras{#1}} %% Flag que decide se adiciona ou não a lista de figuras no documento
\define@key{ppgcc}{listadetabelas}{\deflistadetabelas{#1}} %% Flag que decide se adiciona ou não a lista de tabelas no documento
\define@key{ppgcc}{listascustomizadas}{\deflistascustomizadas{#1}}


%% Definições dos parâmetros ppgcc
\newcommand{\defautor}[1]{\def\autor{#1}}
\newcommand{\deftitulopt}[1]{\def\titulopt{#1}}
\newcommand{\deftituloen}[1]{\def\tituloen{#1}}
\newcommand{\defcidade}[1]{\def\cidade{#1}}
\newcommand{\defano}[1]{\def\ano{#1}}
\newcommand{\defversaopt}[1]{\def\versaopt{#1}}
\newcommand{\defversaoen}[1]{\def\versaoen{#1}}
\newcommand{\deforientador}[1]{\def\orientador{#1}}
\newcommand{\deforientadora}[1]{\def\orientadora{#1}}
\newcommand{\defcoorientador}[1]{\def\coorientador{#1}}
\newcommand{\defcoorientadora}[1]{\def\coorientadora{#1}}
\newcommand{\deffichacatalografica}[1]{\def\fichacatalografica{#1}}
\newcommand{\deffolhadeaprovacao}[1]{\def\folhadeaprovacao{#1}}
\newcommand{\defresumo}[1]{\def\resumo{#1}}
\newcommand{\defabstracten}[1]{\def\abstracten{#1}}
\newcommand{\defpalavraschave}[1]{\def\palavraschave{#1}}
\newcommand{\defkeywords}[1]{\def\keywords{#1}}
\newcommand{\defepigrafe}[1]{\def\epigrafe{#1}}
\newcommand{\defepigrafeautor}[1]{\def\epigrafeautor{#1}}
\newcommand{\defdedicatoria}[1]{\def\dedicatoria{#1}}
\newcommand{\defagradecimentos}[1]{\def\agradecimentos{#1}}
\newcommand{\deflistadefiguras}[1]{\def\listadefiguras{#1}}
\newcommand{\deflistadetabelas}[1]{\def\listadetabelas{#1}}
\newcommand{\deflistascustomizadas}[1]{\def\listascustomizadas{#1}}
%% ==========================================

%% Comandos gerais ==========================

%% Comando para resetar o estilo plain (remover tudo do header e footer). Deve ser utilizado para as páginas de capítulos que devem estar sem numração. *** O comando deve ser utilizado dentro de \begingroup\endgroup ***
\newcommand{\resetaplain}{
	\fancypagestyle{plain}{
		\fancyhf{}
		\renewcommand{\headrulewidth}{0pt} %% Remove a linha to header
	}
}

%% Define o estilo do sumário, lista de figuras e lista de tabelas
\newcommand{\tocloftpagestyle}[1]{%
	\def\@cftpagestyle{\thispagestyle{#1}}}
\tocloftpagestyle{empty}

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

	\autor
	
	\vspace{4cm}
	
	\textbf{\titulopt}
	
	\vfill
	
	\cidade\\
	\ano
	\clearpage %% Termina a página atual aqui
	\endgroup
}

%% Folha de rosto em português ou inglês
\newcommand{\folhaderosto}[1]{
	\begingroup
	\pagestyle{estilocapa}
	
	\autor
	
	\vspace{6cm}
	
	\IfStrEq{#1}{pt}{%
		\textbf{\titulopt}
	}{%
		\textbf{\tituloen}	
	}
	
	\vspace{2cm}
	
	\begin{recuoesquerdaoitocm}
		\IfStrEq{#1}{pt}{%
			\textbf{Versão} \textbf{\versaopt}
		}{%
			\textbf{\versaoen} \textbf{Version}	
		}
	\end{recuoesquerdaoitocm}

	\vspace{3cm}
	
	\hbox{ %% Comando utilizado para não ultrapassar a margem a direita
		\begin{minipage}{\textwidth}
			\leftskip=5cm
			
			%% Dissertações
			\ifx\msc\undefined\else
				\IfStrEq{#1}{pt}{%
					Dissertação apresentada ao Programa de Pós-Graduação em Ciência da Computação da Universidade Federal de Minas Gerais, como requisito parcial à obtenção do título de Mestre em Ciência da Computação.
				}{%
					Thesis presented to the Graduate Program in Computer Science of the Federal University of Minas Gerais in partial fulfillment of the requirements for the degree of Master in Computer Science.
				}
			\fi
			
			%% Tese
			\ifx\phd\undefined\else
				\IfStrEq{#1}{pt}{%
					Tese apresentada ao Programa de Pós-Graduação em Ciência da Computação da Universidade Federal de Minas Gerais, como requisito parcial à obtenção do título de Doutor em Ciência da Computação.
				}{%
					Dissertation presented to the Graduate Program in Computer Science of the Federal University of Minas Gerais in partial fulfillment of the requirements for the degree of Doctor in Computer Science.
				}
			\fi
			
			%% Proposta de dissertação
			\ifx\mscproposta\undefined\else
				\IfStrEq{#1}{pt}{%
					Proposta de dissertação apresentada ao Programa de Pós-Graduação em Ciência da Computação da Universidade Federal de Minas Gerais, como requisito parcial à obtenção do título de Mestre em Ciência da Computação.
				}{%
					Thesis proposal presented to the Graduate Program in Computer Science of the Federal University of Minas Gerais in partial fulfillment of the requirements for the degree of Master in Computer Science.
				}
			\fi
			
			%% Proposta de doutorado
			\ifx\phdproposta\undefined\else
				\IfStrEq{#1}{pt}{%
					Proposta de tese apresentada ao Programa de Pós-Graduação em Ciência da Computação da Universidade Federal de Minas Gerais, como requisito parcial à obtenção do título de Doutor em Ciência da Computação.
				}{%
					Dissertation propostal presented to the Graduate Program in Computer Science of the Federal University of Minas Gerais in partial fulfillment of the requirements for the degree of Doctor in Computer Science.
				}
			\fi
		\end{minipage}
	}

	\vspace{1.5cm}

	\begin{recuoesquerdaoitocm}
		\IfStrEq{#1}{pt}{%
			\ifx\orientador\undefined
				Orientadora: \orientadora\\
			\else
				Orientador: \orientador\\
			\fi
		}{%
			\ifx\orientador\undefined
				Advisor: \orientadora\\
			\else
				Advisor: \orientador\\
			\fi
		}
		
		\IfStrEq{#1}{pt}{%
			\ifx\coorientador\undefined
				\ifx\coorientadora\undefined\else
					Coorientadora: \coorientadora\\
				\fi
			\else
				Coorientador: \coorientador\\
			\fi
		}{%
			\ifx\coorientador\undefined
				\ifx\coorientadora\undefined\else
					Co-Advisor: \coorientadora\\
				\fi
			\else
				Co-Advisor: \coorientador\\
			\fi
		}
	\end{recuoesquerdaoitocm}

	\vfill
	
	\cidade\\
	\ano
	\clearpage %% Termina a página atual aqui
	\endgroup
}

%% Ficha catalográfica. O parâmetro deve ser o nome do arquivo com a extensão .pdf
\newcommand{\fazfichacatalografica}[1]{
	\includepdf[pages=-]{#1}
}

%% Folha de aprovação. O parâmetro deve ser o nome do arquivo com a extensão .pdf
\newcommand{\fazfolhadeaprovacao}[1]{
	\includepdf[pages=-]{#1}
}

%% Dedicatória. O parâmetro deve ser o nome do arquivo com a extensão .tex contendo a dedicatória.
\newcommand{\fazdedicatoria}[1]{
	\begingroup
		\pagestyle{empty}
		\leftskip=5cm % Somado a 3cm da margem esquerda = 8cm
		\vspace*{\fill}
		\noindent \textit{\input{#1}}
		\clearpage
	\endgroup
}

%% Agradecimentos. O parâmetro deve ser o nome do arquivo com a extensão .tex contendo os agradecimentos.
\newcommand{\fazagradecimentos}[1]{
	\begingroup
		\resetaplain
		\ifx\idiomapt\undefined
			\chapter*{Acknowledgments}
		\else
			\chapter*{Agradecimentos}
		\fi
		\input{#1}
		\clearpage
	\endgroup
}

%% Epígrafe. O primeiro parâmetro é o próprio epígrafe e o segundo parâmetro o autor.
\newcommand{\fazepigrafe}[2]{
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
\newcommand{\fazresumo}[1]{
	\begingroup
		\resetaplain
		\chapter*{Resumo}
		\input{#1}
		
		\vspace{1cm}
		\noindent\textbf{Palavras-chave:} \palavraschave
		\clearpage
	\endgroup
}

%% Abstract. O primeiro parâmetro deve ser o nome do arquivo com a extensão .tex contendo o abstract, e o segundo parâmetro uma lista com as palavras-chave.
\newcommand{\fazabstracten}[1]{
	\begingroup
		\resetaplain
		\chapter*{Abstract}
		\input{#1}
		
		\vspace{1cm}
		\noindent\textbf{Keywords:} \keywords
		\clearpage
	\endgroup
}

%% Ambiente para apêndices
\newenvironment{apendices}{
	\appendix
}{}

%% Verifica se todos os parâmetros obrigatórios foram passados
\newcommand{\verificaobrigatorios}{
	%% Verifica se o autor(a) foi definido
	\ifx\autor\undefined
		\ClassError{ppgccufmg}{Autor(a) não definido}{Defina o autor(a)}
	\fi
	
	%% Verifica se o título em português foi definido
	\ifx\titulopt\undefined
		\ClassError{ppgccufmg}{Título em português não definido}{Defina o título em português}
	\fi
	
	%% Verifica se a cidade foi definida
	\ifx\cidade\undefined
		\ClassError{ppgccufmg}{Cidade não definida}{Defina a cidade}
	\fi
	
	%% Verifica se a cidade foi definida
	\ifx\ano\undefined
		\ClassError{ppgccufmg}{Ano não definido}{Defina o ano}
	\fi
	
	%% Verifica se a versão em português foi definida
	\ifx\versaopt\undefined
		\ClassError{ppgccufmg}{Versão em português não definida}{Defina a versão em português}
	\fi
	
	%% Verifica se o resumo em português foi passado
	\ifx\resumo\undefined
		\ClassError{ppgccufmg}{Resumo em português não encontrado}{Indique o arquivo .tex contendo o resumo em português}
	\fi
	
	%% Verifica se o abstract em inglês foi passado
	\ifx\abstracten\undefined
		\ClassError{ppgccufmg}{Abstract em inglês não encontrado}{Indique o arquivo .tex contendo o abstract em inglês}
	\fi	
	
	%% Verifica se as palavras-chave em português foram definidas
	\ifx\palavraschave\undefined
		\ClassError{ppgccufmg}{Palavras-chave do resumo em português não definidas}{Defina as palavras-chave}
	\fi
	
	%% Verifica se as palavras-chave em português foram definidas
	\ifx\keywords\undefined
		\ClassError{ppgccufmg}{Palavras-chave do abstract em inglês não definidas}{Defina as palavras-chave}
	\fi
	
	%% Se o usuário definiu o idioma como sendo inglês ---------
	
	%% Verifica se o título em inglẽs foi passado
	\ifx\idiomaen\undefined\else
		\ifx\tituloen\undefined
			\ClassError{ppgccufmg}{Título em inglês não definido}{Defina o título em inglês}
		\fi
	\fi
	
	%% Verifica se a versão do documento em inglẽs foi passada
	\ifx\idiomaen\undefined\else
		\ifx\versaoen\undefined
			\ClassError{ppgccufmg}{Versão em inglês não definida}{Defina a versão em inglês}
		\fi
	\fi
	
	%% ---------------------------------------------------------

	%% Verificar se algum orientador(a) foi definido
	\ifx\orientador\undefined
		\ifx\orientadora\undefined
			\ClassError{ppgccufmg}{Orientador(a) não definido}{Defina o(a) orientador(a)}
		\fi
	\fi
}

%% Comando principal que desenha todos os elementos pré-textuais (capa, folha de rosto, abstract, ...)
\newcommand{\ppgccufmg}[1]{%
	
	%% Executa os parâmetros passados pelo usuário
	\setkeys{ppgcc}{#1}
	
	\pagestyle{estilopadrao} %% Define 'estilopadrao' como sendo o estilo 'global' das páginas
	
	\verificaobrigatorios

	\maketitle %% Capa
	
	%% Comando utilizado para que a capa não conte na numeração das páginas
	\cleardoublepage
	\setcounter{page}{1}
	
	\folhaderosto{pt} %% Folha de rosto em português

	\ifx\idiomaen\undefined\else
		\folhaderosto{en} %% Folha de rosto em inglês
	\fi
	
	\ifx\fichacatalografica\undefined\else
		\fazfichacatalografica{\fichacatalografica}
	\fi
	
	\ifx\folhadeaprovacao\undefined\else
		\fazfolhadeaprovacao{\folhadeaprovacao}
	\fi
	
	\ifx\dedicatoria\undefined\else
		\fazdedicatoria{\dedicatoria}
	\fi
	
	\ifx\agradecimentos\undefined\else
		\fazagradecimentos{\agradecimentos}
	\fi
	
	\ifx\epigrafe\undefined\else
		\ifx\epigrafeautor\undefined
			\ClassError{ppgccufmg}{Autor do epígrafe não definido}{Defina o autor do epígrafe.}
		\fi
		\fazepigrafe{\epigrafe}{\epigrafeautor}
	\fi
	
	\fazresumo{\resumo}
	
	\fazabstracten{\abstracten}
	
	\begingroup
	\resetaplain
	
	\ifx\listadefiguras\undefined\else
		\listoffigures* %% Lista de figuras
		\clearpage
	\fi
	
	\ifx\listadetabelas\undefined\else
		\listoftables* %% Lista de tabelas
		\clearpage
	\fi
	
	\ifx\listascustomizadas\undefined\else
		\listascustomizadas*
	\fi
	
	\clearpage
	
	%% TODO: Comando para adicionar outros elementos pré-textuais, como por exemplo lista de algoritmos, erratas, ...
	
	\begin{KeepFromToc}
		\addtocontents{toc}{\protect\thispagestyle{empty}}
		\tableofcontents* %% Sumário
	\end{KeepFromToc}
	\endgroup
}

%% ==========================================

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

