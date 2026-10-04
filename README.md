# Modelos de documentos da UFAPE em LaTeX

Versões em LaTeX dos templates do SIB-UFAPE (monografia e relatório de ESO) e dos
formulários de uma página usados no depósito no Repositório Institucional.

Compila em qualquer distribuição LaTeX, no Overleaf, no Prism ou com o
[Tectonic](https://tectonic-typesetting.github.io/). Sem pacotes fora do padrão,
sem arquivos de configuração.

> **Estes modelos não são oficiais.** Em caso de divergência, vale o template da
> biblioteca ([Orientação de Normalização](https://ufape.edu.br/orientação-normalização)).
> Dúvidas de normalização: [atendimento.sib@ufape.edu.br](mailto:atendimento.sib@ufape.edu.br).

**Índice:** [Modelos disponíveis](#modelos-disponíveis) · [O que editar](#o-que-editar) ·
[Regras de formatação](#regras-de-formatação) · [Comandos](#comandos) ·
[Depósito no Repositório Institucional](#depósito-no-repositório-institucional) ·
[Links oficiais](#links-oficiais)

---

## Modelos disponíveis

### Trabalhos acadêmicos

Usam a classe `ufape.cls`. Cada pasta é independente e traz sua própria cópia da classe
(o arquivo é o mesmo nos dois modelos; a opção muda o comportamento).

| Modelo | Pasta | Espaçamento entre linhas |
|---|---|---|
| Monografia / TCC | [`docs-latex/modelo-monografia-ufape/`](docs-latex/modelo-monografia-ufape/) | 1,5 |
| Relatório de ESO | [`docs-latex/modelo-eso-ufape/`](docs-latex/modelo-eso-ufape/) | simples |

### Formulários de uma página

Não usam `ufape.cls` e não dependem de nenhum outro modelo. Em todos, basta preencher o
bloco de dados no topo do `main.tex`: cada campo tem um `ex.:` no comentário acima.
Caixa marcada = `X` entre as chaves; campo vazio = `{}`.

| Formulário | Pasta |
|---|---|
| Termo de Autorização para Publicação no RI da UFAPE — permissões de acesso (total/parcial), observações A/B/C, patente | [`docs-latex/outros-documentos/modelo-autorizacao-ufape/`](docs-latex/outros-documentos/modelo-autorizacao-ufape/) |
| Declaração de Uso de Inteligência Artificial — ferramentas usadas e finalidade (revisão, tradução, geração de texto, análise de dados, visualização, metodologia) | [`docs-latex/outros-documentos/modelo-declaracao-ia-ufape/`](docs-latex/outros-documentos/modelo-declaracao-ia-ufape/) |
| Termo de Compromisso de Autoria e Originalidade — autenticidade, originalidade e responsabilidades do discente | [`docs-latex/outros-documentos/modelo-termo-plagio-ufape/`](docs-latex/outros-documentos/modelo-termo-plagio-ufape/) |

Os três devem sair com uma página. Confira com `pdfinfo main.pdf`.

---

## Compilando

### No navegador (não precisa instalar nada)

| Onde | Como |
|---|---|
| [Overleaf](https://www.overleaf.com) | Crie um projeto e arraste o `.zip` da pasta do modelo. |
| [Prism](https://prism.openai.com) | Arraste a pasta ou o `.zip` para importar. |

Depois é só abrir o `main.tex` e compilar. Sumário e listas de figuras, quadros e
tabelas são dinâmicos: atualizam sozinhos a cada compilação.

### Localmente, com Tectonic

Motor LaTeX num único executável, que baixa sozinho os pacotes de que o documento precisa.

```bash
# Linux / macOS
curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net | sh
```

```powershell
# Windows (PowerShell)
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://drop-ps1.fullyjustified.net'))
```

Dentro da pasta do modelo:

```bash
tectonic main.tex   # gera o main.pdf ao lado
```

Outras formas de instalar: [binário nas releases](https://github.com/tectonic-typesetting/tectonic/releases)
ou gerenciador de pacotes (o pacote costuma se chamar `tectonic`). Veja o
[guia de instalação](https://tectonic-typesetting.github.io/en-US/install.html).

---

## Estrutura do repositório

```
docs-originais/     .doc e .pdf oficiais da biblioteca, usados como base
docs-latex/
  modelo-monografia-ufape/   main.tex, ufape.cls, pre-textuais/, textuais/, pos-textuais/, figuras/
  modelo-eso-ufape/          main.tex, ufape.cls, pre-textuais/, textuais/, pos-textuais/, figuras/
  outros-documentos/         um formulário por pasta, cada um com main.tex e figuras/
```

---

## O que editar

**Monografia e ESO.** Editar o `main.tex` (metadados) e os arquivos `.tex` de
`pre-textuais/`, `textuais/` e `pos-textuais/`. Não mexer no `ufape.cls` — é o que
controla margens, fontes, espaçamento e paginação.

Apague o texto de exemplo e substitua pelo seu. Em especial:

- o parágrafo de demonstração `\textopadrao{...}` e as chamadas a ele;
- as instruções do Word — no Word elas aparecem em azul; aqui ficam escondidas por
  padrão e só aparecem com a opção `notas`.

**Formulários.** Só o bloco `\newcommand{\F...}` no topo do `main.tex`. O resto do
arquivo é o modelo em si.

**Opções da classe** (em `\documentclass[...]`):

| Opção | Efeito |
|---|---|
| `monografia` / `eso` | escolhe o modelo (padrão: `monografia`) |
| `arial` | usa Arial no lugar de Times |
| `notas` | mostra as instruções azuis vindas do Word |
| `frenteeverso` | margens espelhadas para impressão duplex |

---

## Regras de formatação

Extraídas dos templates oficiais e já implementadas na classe.

| Item | Regra |
|---|---|
| Fonte | Times New Roman ou Arial, tamanho 12, texto justificado |
| Parágrafo | recuo de 1,25 cm, sem espaço entre parágrafos |
| Espaçamento | monografia 1,5; ESO simples (a coordenação pode unificar em 1,5) |
| Espaço simples | citação longa, notas, referências, legendas, fonte das ilustrações, ficha catalográfica, natureza (folha de rosto e de aprovação) |
| Margens | frente: 3 cm esquerda/superior, 2 cm direita/inferior; no verso as margens se invertem |
| Paginação | contadas a partir da capa, numeradas a partir da introdução, no canto superior direito |
| Citação longa | recuo de 4 cm, fonte 10, espaço simples, sem aspas (`citacaolonga`) |
| Citação curta | até 3 linhas, entre aspas no texto |
| Seções | até 5 níveis (`\chapter` a `\paragraph`), conforme NBR 6024; título igual ao do sumário |
| Resumo | 150 a 500 palavras, sem citações |
| Palavras-chave | 3 a 5, minúsculas (exceto nomes próprios), separadas por `;` e com ponto final |
| Referências | ordem alfabética, alinhadas à esquerda, espaço simples, uma linha em branco entre elas (NBR 6023) |
| Assinaturas | a folha de aprovação leva só nomes, sem assinaturas; nenhuma assinatura no corpo do trabalho |

Normas citadas nos templates: NBR 6023 (referências), 6024 (numeração progressiva),
6027 (sumário), 6028 (resumo), 6034 (índice), 10520 (citações), 10719 (relatório
técnico/científico, base do ESO), 14724 (trabalhos acadêmicos) e as normas tabulares
do IBGE.

### Elementos de cada modelo

**Monografia.** Obrigatórios: capa, folha de rosto, ficha catalográfica, folha de
aprovação, resumo, abstract, sumário, introdução, fundamentação, metodologia,
resultados, considerações finais e referências. Opcionais: errata, dedicatória,
agradecimentos, epígrafe, listas de figuras, quadros, tabelas, siglas e símbolos,
apêndices e anexos.

**ESO.** Obrigatórios: capa, folha de rosto, resumo, sumário, introdução,
desenvolvimento, considerações finais, referências, apêndice A (folha de aprovação)
e anexo A (formulário de identificação). Opcionais: errata, agradecimentos, listas,
apêndice B e anexo B. Não tem abstract, dedicatória nem epígrafe — nem ficha
catalográfica, que só é exigida para monografia, dissertação e tese.

**Errata** só entra se você precisar corrigir algo depois de impresso: é um papel
avulso logo após a folha de rosto. Apêndices e anexos que levem assinatura devem
tê-la ocultada.

---

## Comandos

### Metadados (topo do `main.tex`)

`\autor` · `\titulo` · `\subtitulo` · `\curso` · `\nomecurso` · `\grau` · `\cidade` ·
`\ano` · `\dataaprovacao` · `\logocurso` · `\orientador` (monografia) ·
`\supervisor` e `\periodo` (ESO) · `\membrobanca` (repita para cada membro)

`\logocurso` troca o logo da capa; apague a linha para não usar.
`\dataaprovacao` vem como `____/____/____`; só preencha se souber a data.

### Folha e seções

| Comando | O que faz |
|---|---|
| `\capa` | capa |
| `\folhaderosto` | folha de rosto |
| `\fichacatalografica` | folha da ficha catalográfica |
| `\folhadeaprovacao` | folha de aprovação |
| `\conteudofolhaaprovacao` | conteúdo da folha, para reaproveitar no apêndice |
| `\errataref{...}` e `\tabelaerrata{}{}{}{}` | errata |
| `dedicatoria` · `agradecimentos` · `epigrafe` · `resumo` · `abstract` · `referencias` | ambientes de uma página só |

### Listas, sumário e palavras-chave

`\sumario` · `\listadefiguras` · `\listadequadros` · `\listadetabelas` ·
`\listadesiglas{...}` · `\listadesimbolos{...}` · `\palavraschave{...}` ·
`\keywords{...}`

Apague as listas que ficarem vazias, senão elas abrem uma página em branco.
Siglas e símbolos recebem itens no formato `\item[UFAPE] Universidade ...`.

### Corpo do texto

`\iniciotexto` (marca onde a numeração de páginas começa) · `\chapter` ·
`\section` · `\subsection` · `\subsubsection` · `\paragraph` · `citacaolonga`

Título de capítulo sai em maiúsculas automaticamente.

### Figuras, quadros e tabelas

Ambientes `figure`, `quadro` e `table`, com `[H]` para ficarem onde você as colocou.
Use `\caption` em cima e `\fonte{...}` embaixo — é o que as faz entrar sozinhas nas
listas.

| Comando | Uso |
|---|---|
| `\fonte{Elaborado pelo autor (2026)}` | fonte da ilustração, em fonte 10 |
| `\nc{...}` | nota de conteúdo dentro da tabela |
| `\tabelaibge` | corpo da tabela em fonte 7, conforme as normas do IBGE |
| `\quadrotexto` | corpo do quadro em fonte 10 |

### Referências e divisórias

`\refitem{...}` para cada referência (uma entrada por chamada, como no Word) ·
`\apendice{A}{Título}` · `\anexo{A}{Título}`

Referências digitadas à mão, não por `\cite`. `\ref` e `\url` funcionam, e os links
saem clicáveis e sem cor.

### Utilidades

`\textocentralizado{...}` · `\linhamodelo{...}` · `\nota{...}`

---

## Depósito no Repositório Institucional

Fluxo do TCC na UFAPE, na ordem. Tutoriais oficiais de cada passo estão no fim da
seção [Links oficiais](#links-oficiais).

1. **Solicitar a ficha catalográfica** em [solicita.ufape.edu.br](https://solicita.ufape.edu.br).
   Só para monografia, dissertação e tese — ESO e artigo não precisam. A biblioteca
   responde em 4 dias úteis, então peça antes de fechar o trabalho.
2. **Inserir a ficha no arquivo**, depois da folha de rosto e antes da folha de
   aprovação.
3. **Assinar o termo de autorização** de forma eletrônica pelo GOV.BR, pelo autor e
   pelo orientador, e enviá-lo junto com o trabalho. Modelo em
   [`outros-documentos/modelo-autorizacao-ufape/`](docs-latex/outros-documentos/modelo-autorizacao-ufape/).
4. **Baixar o Nada Consta** no [Meu Pergamum](https://ufape.pergamum.com.br/).
5. **Depositar** pelo [Solicita](https://solicita.ufape.edu.br), em
   *Biblioteca → Alunos Concluintes*.

Requisitos do arquivo enviado:

- PDF aberto, versão final, **até 10 MB**;
- sem senha, sem "modo de segurança" ou qualquer chave de proteção — isso inviabiliza
  a publicação no LOGOS e na BDTD;
- folha de aprovação sem assinaturas, e nenhuma assinatura no corpo do trabalho.

Problemas com o depósito: [servicosdigitais.sib@ufape.edu.br](mailto:servicosdigitais.sib@ufape.edu.br).

---

## Links oficiais

**Normalização**

- [Orientação de Normalização (SIB-UFAPE)](https://ufape.edu.br/orientação-normalização) — templates `.doc`/`.pdf` e guia
- [Guia de Orientação de Normalização para Trabalhos Acadêmicos (2025)](https://ufape.edu.br/sites/default/files/2025-02/Guia%20de%20Orienta%C3%A7%C3%A3o%20de%20Normaliza%C3%A7%C3%A3o%20para%20Trabalhos%20Acad%C3%AAmicos%20-%202025.pdf)
- [Gerador de referências ABNT / Vancouver / NLM / MLA8 / APA 7th](https://referenciabibliografica.net/a/pt-br/ref/abnt)
- [Biblioteca Ariano Suassuna](https://ufape.edu.br/biblioteca-ariano-suassuna) · [Manual do Estudante](https://ufape.edu.br/manual-do-estudante)

**Depósito**

- [Depósito de trabalhos de conclusão de curso](https://ufape.edu.br/deposito-trabalhos-academicos-artigos-dissertacoes-eso-monografias) — regras completas e anexos
- [Solicita](https://solicita.ufape.edu.br) · [Meu Pergamum](https://ufape.pergamum.com.br/) · [LOGOS](http://ufape.edu.br/repositoriologos)

**Tutoriais em PDF**

- [Solicitação da ficha catalográfica](https://ufape.edu.br/sites/default/files/2025-02/Solicitação%20Ficha%20Catalográfica%20-%20Tutorial.pdf)
- [Como anexar a ficha catalográfica ao TCC](https://ufape.edu.br/sites/default/files/2025-02/Como%20%20Anexar%20o%20Arquivo%20Contendo%20a%20Ficha%20Catalográfica%20no%20TCC%20-%20Tutorial.pdf)
- [Assinatura eletrônica de documentos no GOV.BR](https://ufape.edu.br/sites/default/files/2025-02/Assinatura%20Eletrônica%20de%20Documentos%20Gov.br%20%20-%20Tutorial.pdf)
- [Depósito de trabalhos acadêmicos no Solicita](https://ufape.edu.br/sites/default/files/2025-03/Depósito%20de%20trabalhos%20Acadêmicos%20-%20Tutorial%20Solicita.pdf)
- [Nada Consta no Meu Pergamum](https://ufape.edu.br/sites/default/files/2026-05/Tutorial%20-%20Nada%20consta%20-%20Meu%20Pergamum.pdf)

**Contato**

- Normalização: [atendimento.sib@ufape.edu.br](mailto:atendimento.sib@ufape.edu.br)
- Depósito e serviços digitais: [servicosdigitais.sib@ufape.edu.br](mailto:servicosdigitais.sib@ufape.edu.br)