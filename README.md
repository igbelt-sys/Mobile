
# Atividades Realizadas em Aula

Nesta aula, realizamos uma introdução às ferramentas básicas de versionamento e organização de projetos.

- Etapas desenvolvidas:

- Download e instalação do Git

- Acesso e configuração de uma conta no GitHub

- Download e instalação do Visual Studio Code (VS Code)

- Conexão da conta do GitHub ao VS Code

- Criação de pastas das matérias utilizando o terminal

- Utilização de comandos básicos do Git para configuração inicial

* Configuração do usuário com o comando:

git config --global user.email "seuemail@email.com"


Organização do ambiente de desenvolvimento para futuros projetos

---

## Tipos de desenvolvimento mobile 
- nativo:
    * Android
        - SDK : Android SDK
        - IDE : Android Studio
        - Linguagens: Kotlin e Java
        - Ambientes: Mac, Win, Linux

    * IOS: 
        - SDK: cocoa touch
        - IDE: Xcode
        - linguagens: Swift / Objecttype-c
        - Ambientes: Mac
    
- Multiplataforma:
    * React Native:
        - SDK: Node.js
        - IDE: Vscode
        - Linguagens: JavaScript / Typescript
        - Ambiente: Mac / Win / Linux

    * flutter:
        - SDK: Flutter SDK
        - IDE: Andoid Studio
        - linguagens: Dart
        - Ambiente: Mac / Win / Linux
        
***

##Preparação do ambiente de desenvlolvimento

### Instalação do FlutterSDK
- download do arquivo ZIP na página flutter.dev
- inclusao do flutter na pasta c:\src
- inclusao do Bin nas variaveis de sistema 

##Instalação do AndroidSDK
- download do android SDK - command line tools
- adicionar o command line ao src
- adicionar o sdkmanager as variaveis de ambiente 
- dowload dos pacotes 
    - emulador 
    - platform tools
    - build tools
- adicionar o adb e o emulador ao path de variaveis
- criacao do emulador 
-Build do emulador- via sdkmanager

### Criação de projetos e Código da linha de comando

- Criação de projetos 
    - flutter create Nome_do_app
        - flags 
            - -- empty: cria um aplicativo "vazio"(hello hord)
            - --platforms:  permit a selecao de uma plataforma de desenvolvimento 
                - ex: --plataforms-android (Criaç~pa do projeto na plataforma android)
    - exemplo de criação de um aplicatico android vazio
        - flutter create Nome_do_app --empyt --plataforms=android
        - obs: Nome do aplicativo: todas as letras minúsculas, separadas or _
    - flutter doctor: 
        - permite correção de pequenos problemas no flutter e identificaçãp soa parâmetros funcionas em relação a plataforma de desenvilvimento
        - sempre rodar o flutter doctor no começo de desenvolvolcimeno
    - flutter celan
        - limpa o cach do build(apaga o apk anterior)
    - flutter run -v 
        build do app (apk)