# Клиент для Chat-GPT на Flutter
<p align="left" width="100%">
    <img src="https://user-images.githubusercontent.com/80569772/229341594-6fd04b2d-3266-4cd3-8cce-1783b6cfd347.jpg" width="30%"/>
    <img src="https://user-images.githubusercontent.com/80569772/229341597-f7263cd2-a95f-48e8-81e2-72f95e20ba44.jpg" width="30%"/>
</p>


---
## Документация 
- [Adding Core Dependency]()
- [Architecture]()
- [Automation]()
- [Best Practices]()
- [Branch Design]()
- [Code Generation]()
- [Code Review]()
- [Commit Design]()
- [Creating New Features]()
- [Files Structure]()
- [Git Flow]()
- [Layers]()
- [Pull Request Design]()
- [Tools]()

# Запуск приложения
## Программы
Перед запуском проекта необходимо установить:
- [Choco](https://chocolatey.org/install) (с помощью данной утилиты можно установить все остальные программы)
- [Make](https://www.gnu.org/software/make/#download) (необходимо для работы автоматизации команд)
- [Flutter](https://docs.flutter.dev/get-started/install) (`choco install flutter`)
- [FVM](https://fvm.app/) ([`choco install fvm --version 2.4.2-dev0 -y`](https://github.com/leoafarias/fvm/issues/557))
- [Dart](https://dart.dev/get-dart) (`choco install dart-sdk`)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (`choco install git.install`)


## Commands
После установки всех необходимых программ нужно выполнить следующие команды:

    git clone https://github.com/p0dyakov/gpt_client.git
    cd gpt_client
    make init

или

    git clone https://github.com/p0dyakov/gpt_client.git
    cd gpt_client
    flutter pub get
    flutter pub run build_runner build --delete-conflicting-outputs
    flutter pub get --directory=./tool/makefile_documentation_generator
    flutter pub get --directory=./tool/google_localizer
    flutter pub get --directory=./tool/setup_clone
    dart ./tool/makefile_documentation_generator/main.dart
    flutter gen-l10n
    
