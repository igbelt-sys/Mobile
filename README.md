1. Ferramentas Utilizadas

Git — Versionamento de código

GitHub — Hospedagem de repositórios

Visual Studio Code — Editor de código

Flutter SDK — Desenvolvimento multiplataforma

Android SDK — Build e emulação Android

2. Configuração Inicial do Git

Configuração do e-mail global:

git config --global user.email "seuemail@email.com"

Organização das pastas das matérias via terminal

Estruturação inicial do ambiente para futuros projetos

3. Tipos de Desenvolvimento Mobile
🔹 Desenvolvimento Nativo

Android

SDK: Android SDK

IDE: Android Studio

Linguagens: Kotlin, Java

Sistemas: Windows, Mac, Linux

iOS

SDK: Cocoa Touch

IDE: Xcode

Linguagens: Swift, Objective-C

Sistema: Mac

🔹 Desenvolvimento Multiplataforma

React Native

SDK: Node.js

IDE: VS Code

Linguagens: JavaScript, TypeScript

Sistemas: Windows, Mac, Linux

Flutter

SDK: Flutter SDK

IDE: Android Studio

Linguagem: Dart

Sistemas: Windows, Mac, Linux

4. Preparação do Ambiente
Instalação do Flutter

Download do arquivo no site oficial

Extração para C:\src

Adição de C:\src\flutter\bin ao PATH

Instalação do Android SDK

Download do Command Line Tools

Configuração do sdkmanager

Instalação dos pacotes:

emulator

platform-tools

build-tools

Adição do adb ao PATH

Criação e build do emulador

5. Comandos Básicos do Flutter
Criar projeto
flutter create nome_do_app
Criar projeto vazio para Android
flutter create nome_do_app --empty --platforms=android

Observação:
O nome do aplicativo deve estar em minúsculas e separado por _.

Verificar ambiente
flutter doctor

Verifica configurações

Identifica problemas

Recomenda-se executar antes de iniciar o desenvolvimento

Limpar build
flutter clean

Remove cache

Apaga build anterior

Executar aplicação
flutter run -v

Realiza o build do APK

Exibe logs detalhados

6. Gerenciamento de Dependências (Pub)

Adicionar dependência

flutter pub add nome_da_dependencia

Instalar dependências do projeto

flutter pub get

Verificar dependências desatualizadas

flutter pub outdated

Atualizar dependências

flutter pub upgrade

## Estrutura basica de um aplicativo em Flutter

#### Árvore de widgets
     ```mermaid
    flowchart TD
        subgraph MaterialApp["MaterialApp"]
        end
        subgraph Janelas 
            StateLess["StateLess"]
            StateFull["StateFull"]
        end
        subgraph Scafold["Scafold"]
            AppBar["AppBar"]
            Body["Body"]
            BNBar["BNBar"]
            Drawer["Drawer"]
            FAButton["FAButton"]
            SnackBar["SnackBar"]
        end
        MaterialApp -> Janelas
        Janelas-> Scafold
    ```