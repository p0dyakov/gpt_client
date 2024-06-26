Для создания приложения использовался [стартер](https://github.com/purplenoodlesoop/purple-starter)

> При написании кода не забывайте про [Effective Dart](https://dart.dev/effective-dart)

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [Внедрение зависимостей](#-)
   * [Мотивация](#)
   * [Модули](#-1)
- [Роутинг](#-2)
   * [Мотивация](#-3)
   * [Модули](#-4)
- [База данных](#--1)
   * [Мотивация](#-5)
   * [Модули](#-6)
- [Управление состоянием](#--2)
   * [Мотивация](#-7)
   * [Модули](#-8)
- [Коммуникация с сервером](#--3)
   * [Мотивация](#-9)
   * [Модули](#-10)
- [Логирование](#-11)
   * [Мотивация](#-12)
   * [Модули](#-13)
- [Обработка и сбор ошибок](#--4)
   * [Мотивация](#-14)
   * [Модули](#-15)
- [Перевод](#-16)
   * [Мотивация](#-17)
   * [Модули](#-18)

<!-- TOC end -->

<!-- TOC --><a name="-"></a>
# Внедрение зависимостей
Для dependency injection в приложении используется [Arbor](https://github.com/purplenoodlesoop/arbor)

<!-- TOC --><a name=""></a>
## Мотивация
- **Компиляционная безопасность**: Ошибка зависимости обнаруживается на этапе компиляции
- **Отсутствие магии**: Нет генерации кода и магических операций
- **Нет синглтонов**: Избегает проблем с глобальным состоянием
- **Нет динамических карт**: Уменьшает сложность кода
- **Абстракция дерева зависимостей**: Позволяет применять модульный подход
- **Гибкость**: Удобное управление зависимостями
- **Средний путь между конструкторным и синглтон-внедрением**: Безопасность на этапе компиляции, но удобнее

<!-- TOC --><a name="-1"></a>
## Модули
1. **Tree**:
   - Основное дерево зависимостей
   - Создается с помощью `BaseTree`
   - Имеет возможность наблюдения за состоянием и отладки с помощью `ArborObserver`

2. **Module**:
   - Узел без состояния, действует как пространство имен для зависимостей и дочерних узлов
   - Используется для группировки зависимостей, связанных с определенной функциональностью или частью приложения
   - Легковесен и кэшируется в памяти на протяжении жизненного цикла приложения

3. **Child**:
   - Узел с сотоянием, действует как контейнер для зависимостей и дочерних узлов
   - Используется для создания объектов, связанных с эфемерным состоянием, которые должны создаваться несколько раз в течение жизненного цикла приложения

4. **ArborObserver**:
   - Используется для наблюдения за состоянием дерева зависимостей и для отладки
   - Позволяет отслеживать, как разрешаются зависимости и какие объекты создаются

<!-- TOC --><a name="-2"></a>
# Роутинг
Для роутинга в приложении используется [Auto Route](https://pub.dev/packages/auto_route)

<!-- TOC --><a name="-3"></a>
## Мотивация
- **Сильная типизация аргументов**: Увеличивает надежность передачи данных между экранами
- **Простая генерация маршрутов**: Генерация кода упрощает настройку маршрутов с минимальным бойлерплейтом
- **Поддержка Deep Linking**: Поддерживает обработку `URL-схем` и `URI` для глубокой привязки
- **Именованные маршруты**: Упрощает навигацию с именованными маршрутами
- **Защищенные маршруты**: Позволяет определить маршруты с ограниченным доступом
- **Централизованные маршруты**: Маршруты находятся в одном месте для удобства управления
- **Кодогенерация**: Использует кодогенерацию для автоматического создания кода

<!-- TOC --><a name="-4"></a>
## Модули
1. **AppRouter**:
   - Роутер приложения
   - Можно получить доступ к нему через контекст: `context.router.push(const <название страницы>Route()),`

2. **Route**:
   - Роут для страницы
   - Генерируется через `Auto Route`
   - Для генерации над виджетом страницы необходимо добавить `@RoutePage(name: '<название страницы>Route')`

<!-- TOC --><a name="--1"></a>
# База данных
Для локального сохранения данных в приложении используется [Drift](https://pub.dev/packages/drift). [Почему не hive?](https://t.me/flutter_architecture/49630)

<!-- TOC --><a name="-5"></a>
## Мотивация
- **Гибкость**: Поддерживает `SQL` и `Dart` для запросов
- **Богатый функционал**: Поддерживает транзакции, миграции, фильтры, сортировку и т.д.
- **Модульность**: Поддерживает `DAO` и импорт `SQL`
- **Безопасность**: Поддерживает обнаружение ошибок на этапе компиляции
- **Скорость**: Обеспечивает высокую производительность
- **Реактивность**: Поддерживает автообновление результатов `SQL-запросов`
- **Кросс-платформенная поддержка**: Работает на `Android`, `iOS`, `macOS`, `Windows`, `Linux`, `web`
- **Экономное использование оперативной памяти**: Не загружает всю базу данных в оперативную память (в отличие от `Hive`)

<!-- TOC --><a name="-6"></a>
## Модули
1. **AppDatabase**:
   - База данный приложения

2. **Dao**:
   - Компонент, который обращается к базе данных приложения и выполняет операции чтения / записи и т.д.

<!-- TOC --><a name="--2"></a>
# Управление состоянием
Для управления состоянием в приложении используется надстройка на BLoC [Stream BLoC](https://pub.dev/packages/stream_bloc)

<!-- TOC --><a name="-7"></a>
## Мотивация
- **Мощь потоков (streams)**: `StreamBloc` сохраняет мощь работы с потоками, делая работу с асинхронными операциями гибкой и эффективной
- **Поддержка генераторов**: Возвращает поддержку генераторов, облегчая асинхронную обработку данных
- **Совместимость**: `StreamBloc` обеспечивает совместимость с официальными библиотеками `bloc` и `flutter_bloc`
- **Отделение бизнес-логики**: Позволяет выделить бизнес-логику из пользовательского интерфейса
- **Тестирование**: Облегчает тестирование приложения

<!-- TOC --><a name="-8"></a>
## Модули
1. **AppBlocObserver**:
   - Наблюдает за изменениями стейтов и пушами эвентов всех блоков
   - Логирует изменения в консоль

2. **BLoC**:
   - Стейт менеджер
   - Принимает зависимости в одном объекте `<название блока>BlocDependencies`

3. **State**:
   - Состояние блока
   - Стейты генерируются через `freezed`

4. **Event**:
   - Событие, которое отправляется в `BLoC`
   - Эвенты генерируются через `freezed`

5. **Data**:
   - Объект, который есть у всех стейтов
   - Хранит данные, которые должны отображаться при любом стейте
   - Благодаря freezed становится доступным у объекта стейта без каста: `state.data`

<!-- TOC --><a name="--3"></a>
# Коммуникация с сервером
Для запросов к серверу используется [Chopper](https://pub.dev/packages/chopper). `Service` и `DTO` генерируются посредством [swagger_dart_code_generator](https://pub.dev/packages/swagger_dart_code_generator)

<!-- TOC --><a name="-9"></a>
## Мотивация
- **Простота использования**: Простой и интуитивно понятный API
- **Множество функций**: Много возможностей для настройки запросов и обработки ответов
- **Поддержка интерцепторов**: Возможность добавления интерцепторов для глобальной обработки запросов и ответов

<!-- TOC --><a name="-10"></a>
## Модули
1. **Swagger**:
   - Модуль, который генерируется посредством swagger_dart_code_generator, и позволяет делать запросы к серверу

2. **Interceptor**:
   - Объект, который инжектится в `Swagger`, и позволяет добавлять специфическую логику к запросу и ответу

3. **DTO**:
   - Wait

<!-- TOC --><a name="-11"></a>
# Логирование
Для локального логирования данных используется [Mark](https://pub.dev/packages/mark)

<!-- TOC --><a name="-12"></a>
## Мотивация
- **Настраиваемость**: Предоставляет гибкую настройку логирования
- **Поддержка скоупинга**: Поддерживает скоупинг (определение области видимости для логов)

<!-- TOC --><a name="-13"></a>
## Модули
1. **LoggerNavigationObserver**:
   - Wait

2. **AppBlocObserver**:
   - Wait

3. **ArborObserver**:
   - Wait

4. **AppPreferencesDriverObserver**:
   - Wait

5. **SentryNavigatorObserver**:
   - Wait

6. **Logger**:
   - Wait

7. **LogsHandler**:
   - Обработка логов

8. **Debug Feature**:
   - Обработка логов

<!-- TOC --><a name="--4"></a>
# Обработка и сбор ошибок
```
static void run({
  required AppBuilder appBuilder,
  InitializationHooks? hooks,
}) {
  final errorsHandler = ErrorsHandler();
  final logsHandler = LogsHandler();
  final logger = Logger(
    processors: [
      PrettyEphemeralMessageProcessor(),
      LogsHandlerMessageProcessor(logsHandler: logsHandler),
    ],
  );
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) async {
    await errorsHandler.handleError(details.exception, details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    errorsHandler.handleError(error, stackTrace);
    return true;
  };
  _runApp(logger, appBuilder, errorsHandler, logsHandler, hooks);
}
```
Для сбора ошибок используется [Sentry](https://sentry.io/welcome/)

<!-- TOC --><a name="-14"></a>
## Мотивация
- **Детальная информация об ошибках**: Предоставляет полные данные о возникших ошибках, что упрощает их анализ и устранение

<!-- TOC --><a name="-15"></a>
## Модули
1. **SentryFlutter**:
   - Wait

2. **Sentry**:
   - Wait

3. **SentryNavigatorObserver**:
   - Wait

4. **ErrorsHandler**:
   - Обработка ошибок

5. **ErrorNotifier Feature**:
   - Обработка ошибок

<!-- TOC --><a name="-16"></a>
# Перевод
Для перевода используется [intl](https://pub.dev/packages/intl)

<!-- TOC --><a name="-17"></a>
## Мотивация
- **Множественное и родовое склонение**: Поддерживает работу с множественными формами и родовыми формами
- **Форматирование и разбор дат и чисел**: Предоставляет инструменты для корректного форматирования и разбора дат и чисел
- **Бидирекциональный текст**: Позволяет обрабатывать бидирекциональный текст (текст, поддерживающий направления справа налево и слева направо), что полезно для языков, таких как арабский и иврит

<!-- TOC --><a name="-18"></a>
## Модули
1. **AppLocalizations**:
   - Wait

2. **WritableLocalization**:
   - Wait