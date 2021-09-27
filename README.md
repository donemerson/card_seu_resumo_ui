## Flutter version
- 2.2.1

## Clean Architecture
- Baseada no curso de arquitetura limpa do manguinho

## Recursos
- Tipografia e cores organizada ( Style guide )
- Internacionalizaçãp (pt-BR e en-US)
- Offline

## Gerencia de estado
- Provider para singletons
- Mobx para reatividade

## Aparencia
- Componentização com MV
- Shimmer
- Animação implicita e explicita

## Cache para Offline
- Hive

## Package de Testes de unidade
- Mockito

## Testes escritos
- Usercases
- Presenters
- Adapters
- Models
- Factories


## Credencial Hasura
- Para que a aplicação saiba o 'secret' key do heroku, utilizeo o envioment do prórpio Dart, então para rodar ou gerar build, utilize os comandos abaixos. Eu tambén deixer o vscode config configurado.
- ```flutter run --dart-define=SECRET=secret```
- ```flutter build apk --profile --dart-define=SECRET=secret```

## Mock para desenvolvimento offline
- ```flutter run --dart-define=offline=true```
- ```flutter build apk --profile --dart-define=offline=true```

# Github Actions
- [thanks @aagarwal1012](https://gist.github.com/aagarwal1012/eb2551683d81cf47d60868ab607520b1)
- 

## Observações
- Não utilizei a fonte Próxima Nova pois não tenho licença, utilizei a Montserrat sugerida como alterantiva no [blog](https://www.shillingtoneducation.com/blog/free-google-fonts-alternatives/)
- Por padrão a aplicação vai internacionalizaro aplicativo com a linguagem do dispositivo. Eu também fiz a conversão de moedas para fins de ilustrações, os valores não corresponde a conversão de cambio e  moeda. 


## Screenshot pt-br
![Screenshot português](screenshots/portugues.gif)
## Screenshot en-us
![Screenshoot inglês](screenshots/portugues.gif)
## Offline mode
![Screenshoot inglês](screenshots/offline.gif)