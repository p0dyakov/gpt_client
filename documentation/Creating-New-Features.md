
# Этап 1. Создание папки фичи
В папке `lib/src/feature` необходимо создать папку с названием фичи. В ней могут содержаться подпапки: `bloc`, `database`, `di`, `emum`, `model`, `page`, `repository`, `widget`. В итоге файловая структура будет выглядеть так:

    ├── bloc/
    │   ├── <название новой фичи>_bloc.dart
    │   ├── <название новой фичи>_dependencies.dart
    │   ├── <название новой фичи>_event.dart
    │   └── <название новой фичи>_state.dart
    ├── database/
    │   └── <название новой фичи>_dao.dart
    ├── di/
    │   └── <название новой фичи>_dependencies.dart
    ├── enum/
    │   └── enum.dart
    ├── model/
    │   └── <название новой фичи>_data.dart.dart
    ├── page/
    │   └── <название новой фичи>_page.dart
    ├── repository/
    │   ├── <название новой фичи>_repository.dart
    │   └── <название новой фичи>_repository_dependencies.dart
    └── widget/
        └── scope/
            └── <название новой фичи>_scope.dart 

# Этап 2. Нейминг файлов и классов
Если ты скопировал структуру фичи, то необходимо переименовать файлы в подпапках. Например, `feat_scope.dart` заменить на `<название новой фичи>_scope.dart`. Так же необходимо переименовать классы внутри файлов. У классов есть префикс, его необходимо заменить на название новой фичи. Например, `FeatRepository` на `<название новой фичи>Repository`

# Этап 3. Добавление модулей в di
В интерфейсе `FeatureDependencies`, который находится в файле [`lib/src/core/di/app_dependencies.dart`]() необходимо добавить геттер на новую фичу:

    abstract class FeatureDependencies {
	    AppFeatureDependencies get app;
	    ...
	    SettingsDependencies get settings;
	    ...
	    <название новой фичи>Dependencies get <название новой фичи>;
    }

Который мы имплементируем в классе `FeatureDependenciesModule`, находящимся в файле [`lib/src/feature/app/di/feature_dependencies.dart`]()


    @override
	<название новой фичи>Dependencies  get <название новой фичи> =>
	    module<<название новой фичи>DependenciesModule<FeatureDependenciesModule<P>>>(
		    <название новой фичи>DependenciesModule.new,
	    );
Это позволит нам через контекст обращаться к модулям фичи. Например:

    @override
    Widget build(BuildContext context) => BlocProvider<<название новой фичи>Bloc>(
	    create: (context) => <название новой фичи>Bloc(
		    context.featureDependencies.<название новой фичи>,
	    ),
	    child: child,
    );

# Этап 4. Заключение
Всё готово! 🎉 Ты - молодец, можешь приступать к написанию нового функционала. Но не забывай про [Effective Dart](https://dart.dev/effective-dart/documentation), покрытие тестами. Хорошего настроения!
