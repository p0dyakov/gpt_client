Структура папок взята из [стартера](https://github.com/purplenoodlesoop/purple-starter)

> При наименовании папок использовать единственное число

# Core
    ├── database/
    │   ├── drift/
    │   │   ├── connection/
    │   │   │   ├── open_connection_io.dart
    │   │   │   ├── open_connection_stub.dart
    │   │   │   └── open_connection_web.dart
    │   │   └── app_database.dart
    │   └── environment_dao.dart
    ├── di/
    │   ├── app_dependencies.dart
    │   └── shared_parent.dart
    ├── enum/
    │   └── environment.dart
    ├── error/
    │   ├── parsing_exception.dart
    │   └── unknown_host_platform_error.dart
    ├── extension/
    │   ├── src/
    │   │   ├── build_context.dart
    │   │   ├── function.dart
    │   │   ├── object.dart
    │   │   └── stream.dart
    │   └── extensions.dart
    ├── gen/
    │   ├── l10n/
    │   │   ├── app_localizations.g.dart
    │   │   ├── app_localizations_en.g.dart
    │   │   └── app_localizations_ru.g.dart
    │   ├── resource/
    │   │   ├── assets.gen.dart
    │   │   └── fonts.gen.dart
    │   └── swagger/
    │       ├── input/
    │       │   └── swagger.json
    │       └── output/
    ├── handler/
    ├── l10n/
    │   ├── app_en.arb
    │   └── app_ru.arb
    ├── logic/
    │   ├── exhaust_map_stream_transformer.dart
    │   └── identity_logging_mixin.dart
    ├── repository/
    │   └── configuration_repository.dart
    ├── router/
    │   └── app_router.dart
    ├── util/
    └── widget/
        ├── bloc_scope.dart
        └── scope.dart

- `database` - базы данных и `EnvironmentDao`
- `di` - общие модули di
- `enum` - общие enum-ы
- `error` - общие ошибки
- `extension` - расширения, которые все экспортируются в `extensions.dart`
- `gen` - генерируемый код: локализация, асеты, шрифты, дто, сервис, токены дизайна
- `handler` - обработчики ошибок и логов
- `l10n` - перевод приложения
- `logic` - утилиты
- `repository` - репозитории
- `router` - роутер
- `util` - общие функции (форматирование, валидация и т.д.)
- `widget` - общие виджеты

# Features
    ├── bloc/
    │   ├── feature_bloc.dart
    │   ├── feature_event.dart
    │   └── feature_state.dart
    ├── database/
    │   └── feature_dao.dart
    ├── di/
    │   └── feature_dependencies.dart
    ├── enum/
    │   └── enum.dart
    ├── model/
    │   └── feature_data.dart.dart
    ├── page/
    │   └── feature_page.dart
    ├── repository/
    │   └── feature_repository.dart
    └── widget/
        └── scope/
            └── feature_scope.dart

- `bloc` - блок, эвенты, стейты, зависимости блока
- `database` - dao
- `di` - модули для di
- `enum` - enum-ы
- `model` - модели
- `page` - страницы
- `repository` - интерфейс репозитория и его имплементация 
- `widget` - виджеты