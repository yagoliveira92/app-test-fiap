<p align="center">
   Use Dev
   <br>
    <p align="center">
      <img src="https://img.shields.io/badge/flutter-3.22.1-blue" />
      <img src="https://img.shields.io/badge/dart-%3E=3.4.1%20%3C4.0.0-blue" />
      <img src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fatrox%2Fsync-dotenv%2Fbadge" />
    </p>

## Índice

- [Índice](#índice)
- [Início](#início)
- [Build](#build)
- [Run](#Run)
- [Packages e Dependências](#packages-e-dependências)

## Início
Este projeto segue o Clean Architecture com TDD exemplificada pelo [Resocoder](https://resocoder.com/flutter-clean-architecture-tdd/), assim como o [Cubit](https://bloclibrary.dev/) para gestão de estado.

Demais dúvidas pode abrir uma issue ou consultar a [documentação oficial](https://flutter.io/docs/get-started/install).

## Build
Para gerar o build do projeto, você precisa de uma chave de API da [OpenWeather](https://openweathermap.org/).
Com ela em mãos, você pode gerar o build com o comando:
```bash
flutter build apk --dart-define=WEATHER_API_KEY=sua_chave_aqui
```

## Run
Para executar o projeto, você também irá precisar da chave de API da [OpenWeather](https://openweathermap.org/).
Com ela em mãos, você pode executar o projeto com o comando:

```bash
flutter run --dart-define=WEATHER_API_KEY=sua_chave_aqui
```
Não há integração com um serviço de autenticação. Para acessar o aplicativo, basta colocar um email e senha qualquer
e clicar em "Entrar".

## Packages e Dependências

Todos os packages e dependências estão no `pubspec.yaml`, mas listamos abaixo as principais com os links para poder consultar:

* [cubit](https://pub.dev/packages/bloc) Para gestão de estado,
* [flutter_bloc](https://pub.dev/packages/flutter_bloc) Integrar o bloc aos Widgets do Flutter,
* [sembast](https://pub.dev/packages/sembast) Banco de dados NoSQL usado no projeto,
* [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) Armazenamento criptografado para guardar o token JWT,
* [go_router](https://pub.dev/packages/go_router) Pacote que gerencia as rotas, tornando sua gestão mais fácil,
* [get_it](https://pub.dev/packages/get_it) Usado para injeção de dependência,
