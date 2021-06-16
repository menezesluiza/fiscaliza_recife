
# Fiscaliza Recife

Este aplicativo tem como objetivo facilitar o acesso e entendimento do conteúdo das bases de **dados abertos** orçamentários da **Prefeitura do Recife**.

O Fiscaliza Recife possui três abas para visualização dos dados: comparativo, receitas e despesas. Na primeira é mostrada uma visão temporal (anual ou mensal) das despesas e receitas. A aba despesas mostra o total de despesas da Prefeitura com visões geral, mensal, por função e modalidade de licitação, e a aba receitas exibe os dados gerais, mensais, por categoria e fonte de origem. Em ambos os casos é possível alternar escolher entre a visão total ou por órgão. 

## Demo:


https://user-images.githubusercontent.com/48093105/122121170-af85c200-ce01-11eb-810a-3bef3a8d7a2f.mp4



## Sobre:

Esse aplicativo é desenvolvido em Flutter/Dart, com suporte (até o momento) para dispositivos Android, com backend rodando no Firebase. Para a geração dos gráficos, foi utilizada a library charts_flutter.

- [Documentação Flutter](https://flutter.dev/docs/)

Todos os dados utilizados são fornecidos pela Prefeitura do Recife, pela iniciativa de dados abertos. Para inserção no aplicativo, eles foram manipulados utilizando os scripts presentes na pasta 'auxilares'.

- [Dados Abertos Recife](http://dados.recife.pe.gov.br/)

## Árvore de Widgets

![Árvore de Widgets](https://github.com/menezesluiza/fiscaliza_recife/blob/master/images/arvore_widgets_V2.png)

## Gráfico de Navegação

![Gráfico de Navegação](https://github.com/menezesluiza/fiscaliza_recife/blob/master/images/grafico_navegacao_new.png)

### Desenvolvido por: 

Desenvolvido por Luíza Menezes para a disciplina Fundamentos de Programação Aplicada (PPGIA/UFRPE)
