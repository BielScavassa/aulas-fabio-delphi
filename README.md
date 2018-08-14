# Curso de Delphi - Monde

Bem vindo ao curso de Delphi da Monde!

O Objetivo deste curso é ensinar de forma detalhada a linguagem Object Pascal utilizada pelo Delphi e as melhores práticas de desenvolvimento utilizando o Delphi.

## Como aproveitar melhor este curso?

- Assista os vídeos na ordem das aulas
- Após assistir, clone o repositório caso não tenha feito, abra o exemplo da aula, analise e faça testes com o código
- Tenha certeza que você entendeu 100% do código do exemplo e do conteúdo da aula
- Caso não entenda alguma parte, pergunte aos colegas de equipe
- Acesse os links das aulas e leia a documentação
- Responda as pergutas no final da aula, você deverá ser capaz de responder todas sem dificuldade
- Caso não consiga responder alguma pergunta, peça ajuda

**O importante é absorver 100% do conteúdo sem que haja nenhuma dúvida sobre a aula, portanto faça sem pressa.**

## Aula 01

[Vídeo - Estrutura de um aplicativo Delphi](https://drive.google.com/open?id=1Rl1kDKau39PQRJbN61FObfdJL7_lH4wb)

### Conteúdo
- Ordem inicialização
- Escopo
- Uses
- Search Path
- Resources

### Links
- [Programs and Units](http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Programs_and_Units_(Delphi))

### Perguntas
- O que é uma diretiva de compilação?
- Qual a diferença entre as sessões interface e implementation?
- Para que serve as sessões initialization e finalization?
- Qual a diferença entre o Search Path e o Library Path?
- Qual a melhor prática para colocar os caminhos no Search Path?

## Aula 02

[Vídeo - Expressões, variáveis e tipos primitivos](https://drive.google.com/open?id=1DiArQ2RWG_aSTCQU621KBfNon4Y_Fauc)

### Conteúdo
- Expressões
- Variáveis
- Tipos (string, numéricos, Boolean, Variant)
- Constantes

### Links
- [Expressions](http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Expressions_(Delphi))
- [String Types](http://docwiki.embarcadero.com/RADStudio/Berlin/en/String_Types_(Delphi))
- [Variables](http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Variables_(Delphi))
- [Declared Constants](http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Declared_Constants)
- [Variant Types](http://docwiki.embarcadero.com/RADStudio/Berlin/en/Variant_Types_(Delphi))
- [Simple Types](http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Simple_Types_(Delphi)#Enumerated_Types)

### Perguntas
- O que é uma expressão?
- Qual a diferença de uma variável e uma constante?
- O que acontece quando passa uma variant com um valor incompatível com o tipo do parâmetro de um método?

## Aula 03

[Vídeo - Classes](https://drive.google.com/open?id=1dN3v3RuRIFgzN-8TGDkbDV_SYix3A57d)

### Conteúdo
- Classes e Objeto
- Properties
- Exceptions
- Classes estáticas

### Links
- [Classes and Objects](http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Classes_and_Objects_(Delphi))
- [Exceptions](http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Exceptions)

### Perguntas
- Qual a diferença entre uma classe e um objeto?
- O que o método .Free do TObject faz?
- O que um construtor retorna?
- Qual a forma correta de tratar exceptions?
- O que acontece na execução do programa quando uma exception é levantada?
- Porque não consigo acessar um Field em um class method?

## Aula 04

[Vídeo - Componentes](https://drive.google.com/open?id=1RzzcCYCbiqtVypkFeemFe9w-h9_vuN1_)

### Conteúdo
- Componentes
- Eventos

### Links
- [TComponent](http://docwiki.embarcadero.com/Libraries/Tokyo/en/System.Classes.TComponent)

### Perguntas
- Qual a diferença de um componente para uma classe normal?
- Qual a função do Parent de um componente?
- O que é um evento?

## Aula 05

[Vídeo - Parte 1](https://drive.google.com/open?id=1QXL_EPNHPqrqUyx92hG9DDwZGuKrqNS9)

[Vídeo - Parte 2](https://drive.google.com/open?id=1uQ6JFXbHxBRBKRywJExV3XZX9qgDD7a8)

### Conteúdo
- dbExpress
- TSQLConnection
- TSQLQuery
- TDataSetProvider
- TClienteDataSet
- TDataSource

### Links
- [dbExpress Controls](http://docwiki.embarcadero.com/RADStudio/Tokyo/en/DBExpress_Controls)
- [TDataSetProvider](http://docwiki.embarcadero.com/Libraries/Tokyo/en/Datasnap.Provider.TDataSetProvider)

### Perguntas
- Qual a função do TDataSetProvider?
- O que é CachedUpdates?
- O que o ApplyUpdates(0) faz?
- O que é a opção poPropagateChanges do TDataSetProvider?
- O que o método Cancel do TClientDataset faz?
- Qual a diferença entre upWhereAll e upWhereKeyOnly no UpdateMode do TDataSetProvider?

## Aula 06

[Vídeo](https://drive.google.com/file/d/17UvbIYIcNuj0l4ueEPXfFDwzXDrFn3NY/view)

### Conteúdo
- Eventos
- Boas práticas ao implementar eventos

### Links
- [Events](http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Events_(Delphi))

### Exercícios
- Modifique o código de exemplo para fazer uma pergunta ao usuário **antes** de inserir um registro
