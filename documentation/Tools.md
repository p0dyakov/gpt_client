# Google Localizer Tool
## Использование
- Переводит json с текстом на разные языки

## Команды

    dart pub get --directory=./tool/google_localizer
    dart ./tool/google_localizer/main.dart lib/src/core/l10n

# Makefile Documentation Generator Tool

## Использование
- Генерирует [документацию для автоматизации команд]()

## Команды

    dart pub get --directory=./tool/makefile_documentation_generator
    dart ./tool/makefile_documentation_generator/main.dart

# Setup Clone Tool

## Использование
- Переименовывает название приложения
- Переименовывает описание пакета
- Переименовывает название корневого виджета приложения
- Переименовывает имя файла корневого виджета приложения
- Переименовывает README.md в STARTER.md
- Создаёт пустой README.md
- Создаёт Flutter Runners для всех доступных платформ

## Команды

    dart pub get --directory=./tool/setup_clone
    dart ./tool/setup_clone/main.dart <новое название>