# 📒 Aplicativo de Anotações

Este é um aplicativo de anotações simples e eficiente, que permite organizar suas anotações por **categorias**. Desenvolvido com foco em praticidade, personalização e suporte multilinguagem.

## ✨ Funcionalidades

- 📂 Organização de anotações por categorias
- 🌐 Suporte à internacionalização (i18n):
    - Português 🇧🇷
    - Inglês 🇺🇸
    - Espanhol 🇪🇸
- 🎨 Escolha de tema:
    - Claro ☀️
    - Escuro 🌙
- 🧠 Gerenciamento de estado com [`provider`](https://pub.dev/packages/provider)
- 💾 Armazenamento local:
    - Banco de dados SQLite com [`sqflite`](https://pub.dev/packages/sqflite)
    - Preferências do usuário (idioma, tema) com [`shared_preferences`](https://pub.dev/packages/shared_preferences)
- 🔑 Identificação única das anotações com [`uuid`](https://pub.dev/packages/uuid)

## 📦 Pacotes Utilizados

| Pacote                  | Finalidade                                        |
|-------------------------|---------------------------------------------------|
| `provider`              | Gerenciamento de estados                          |
| `sqflite`               | Banco de dados local (SQLite)                     |
| `shared_preferences`    | Armazenamento das definições do usuário           |
| `uuid`                  | Geração de identificadores únicos para registros  |
| `flutter_localizations` | Suporte à internacionalização nativa do Flutter   |

## 🚀 Como Executar

Clone o repositório e execute os comandos abaixo:

```bash
flutter pub get
flutter run
