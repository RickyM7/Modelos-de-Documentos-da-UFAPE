# Modelos LaTeX - UFAPE

Reprodução dos templates oficiais do SIB-UFAPE em LaTeX:

| Pasta | Modelo |
|---|---|
| [`modelo-monografia-ufape/`](/docs-latex/modelo-monografia-ufape/) | Monografia / TCC (espaçamento 1,5) |
| [`modelo-eso-ufape/`](/docs-latex/modelo-eso-ufape/) | Relatório de ESO (espaçamento simples) |

## Outros

| Pasta | Descrição |
|---|---|
| [`modelo-autorizacao-ufape/`](/docs-latex/modelo-autorizacao-ufape/) | Termo de Autorização para Publicação no RI da UFAPE, com estilo modificado para melhor visualização (preencha o bloco `DADOS` no `main.tex` e compile) |

Cada pasta é independente e tem sua cópia de `ufape.cls` (o arquivo é o mesmo; a opção `monografia` ou `eso` escolhe o modelo).

## Usar

- [Overleaf](https://www.overleaf.com): faça upload do `.zip` da pasta do modelo.
- [Prism (OpenAI)](https://prism.openai.com): arraste a pasta ou o `.zip` para importar.

Abra o `main.tex` e aperte compilar. O sumário e as listas de figuras, quadros e tabelas são dinâmicos: atualizam sozinhos a cada compilação. Apague as listas que ficarem vazias no `main.tex`.

## O que editar

Edite só o `main.tex` (dados) e os arquivos em `pre-textuais/`, `textuais/` e `pos-textuais/`. Não mexa na `ufape.cls`. Apague `\textopadrao` e `\refnota` ao escrever o seu texto: são só demonstração do Word.

Opções da classe: `[monografia]` ou `[eso]`, mais `arial` (Arial no lugar de Times), `notas` (mostra as instruções azuis do Word) e `frenteeverso` (margens espelhadas).

## Elementos

Monografia. Obrigatórios: capa, folha de rosto, ficha catalográfica, folha de aprovação, resumo, abstract, sumário, introdução, fundamentação, metodologia, resultados, considerações finais, referências. Opcionais: errata, dedicatória, agradecimentos, epígrafe, listas de figuras/quadros/tabelas/siglas/símbolos, apêndices, anexos.

ESO. Obrigatórios: capa, folha de rosto, resumo, sumário, introdução, desenvolvimento, considerações finais, referências, apêndice A (folha de aprovação) e anexo A (formulário de identificação). Opcionais: errata, agradecimentos, listas, apêndice B, anexo B. Não tem abstract nem dedicatória/epígrafe.

## Regras (dos documentos oficiais)

- Fonte Times New Roman ou Arial, tamanho 12, justificado, recuo de 1,25 cm, sem espaço entre parágrafos. Padrão: Times (`arial` troca para Arial).
- Monografia: espaçamento 1,5. ESO: espaçamento simples (a coordenação pode padronizar 1,5 para todo o documento).
- Espaço simples sempre em: citação longa, notas, referências, legendas, fonte das ilustrações, ficha catalográfica e texto de natureza (folha de rosto/aprovação).
- Citação longa: recuo de 4 cm, fonte 10, espaço simples, sem aspas (`citacaolonga`). Citação curta (até 3 linhas): entre aspas no texto.
- Margens: frente 3 cm esquerda/superior e 2 cm direita/inferior; no verso inverte. Páginas contadas da capa, numeradas da introdução, número no canto superior direito.
- Seções até 5 níveis (`\chapter` a `\paragraph`), conforme NBR 6024. Títulos iguais no texto e no sumário.
- Resumo: 150 a 500 palavras, sem citações. Palavras-chave em minúsculas (salvo nomes próprios), 3 a 5, separadas por `;` e com ponto final.
- Referências em ordem alfabética, alinhadas à esquerda, em espaço simples, com uma linha em branco entre elas (NBR 6023).
- Banca só com nomes, sem assinaturas. Apêndices/anexos com assinatura devem ter a assinatura ocultada.
- Ficha catalográfica: solicite em https://solicita.ufape.edu.br. Errata só se precisar corrigir após impresso: papel avulso logo após a folha de rosto.
- NBRs citadas no modelo: 6023 (referências), 6024 (numeração), 6027 (sumário), 6028 (resumo), 6034 (índice), 10520 (citações), 10719 (relatório técnico, ESO), 14724 (trabalhos acadêmicos) e normas tabulares do IBGE.

## Comandos

Metadados: `\autor \titulo \subtitulo \curso [\nomecurso] \grau \cidade \ano` + `\orientador` (monografia) ou `\supervisor \periodo` (ESO). `\logocurso{...}` troca o logo da capa; apague a linha para não usar.

Estrutura: `\capa \folhaderosto [\fichacatalografica] [errata] \folhadeaprovacao`, ambientes `dedicatoria agradecimentos epigrafe resumo abstract`, `\listadefiguras \listadequadros \listadetabelas \listadesiglas \listadesimbolos \sumario`, `\iniciotexto`, `\chapter \section \subsection \subsubsection \paragraph`, `citacaolonga`, `figure/table/quadro` com `[H]` + `\fonte{}`, `referencias` com `\refitem{}`, `\apendice{A}{...} \anexo{A}{...}`.

Figuras, quadros e tabelas entram com `\caption` em cima e `\fonte` embaixo; entram sozinhas nas listas. Referências digitadas à mão com `\refitem` (como no Word). Links do sumário, listas, `\ref` e `\url` são clicáveis sem cor.
