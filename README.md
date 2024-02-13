Falou - Fast Language Learning

IOS Teste App

Sobre o teste

Este teste que você fará tem por objetivo verificar seu nível de maturidade como programador e em última instância seu nível de maturidade como desenvolvedor IOS. Queremos entender sua organização de código, sua visão de arquitetura e como você respeita o design e a UX definida. 

Você precisará construir uma app, DictionMaster, que é um dicionário de inglês baseado na API gratuita  Free Dictionary. A app apresenta um launch screen e na sequência chega à tela principal na qual você pode realizar uma busca no dicionário na língua apresentada (somente inglês). Ao realizar uma busca uma tela com resultado é apresentada, nela você pode tocar o áudio do termo, ver os significados e para cada significado alguns exemplos. Cada usuário tem direito a 5 buscas gratuitas por dia (desconsiderando pesquisas já feitas), quando este limite é ultrapassado uma tela de compra é apresentada para ele. O fluxo feliz termina na exibição da tela de compra e o clicar na compra sai da tela.  Um outro aspecto importante é que você precisa implementar um cache de busca, da maneira que preferir, para que buscas iguais, pelo mesmo termo, não faça uma nova requisição REST do Free Dictionary API.

REST do Free Dictionary API
Você usará o dicionário Free Dictionary  para suportar a busca. Você pode usar qualquer lib como Retrofit para acessar e fazer as requisições http. Para armazenar em cache os resultados use qualquer mecanismo de cache, a mais simples estrutura de dados  ou uma lib ou mesmo uma base de dados, é sua opção, o importante é o resultado e quão limpa é a arquitetura e implementação.  Você pode testar a API usando curl na linha de comando de seu computador: 
curl https://api.dictionaryapi.dev/api/v2/entries/en/<word>"
 Formate o resultado da chamada em termos de modelo de dado do jeito que preferir para que se cumpra o que a tela de resultado exibe que é basicamente pronúncia, significados e exemplos.

Telas e Assets
Todas as telas estão em sequência na plataforma da Adobe Xd:  link telas.  Ao acessar uma tela você consegue ver detalhes do design ao ativar o icone </> na barra lateral direita. Você consegue ver fontes,  rgb de cores e ao clicar em um ícone você consegue fazer download no formato que o IOS precisa para suportar vários devices.
