# News Test Task

Flutter-приложение для просмотра новостей (NewsAPI) с экранами:
- список новостей;
- детали новости;
- избранные новости.

## Запуск проекта

1. Установите зависимости:

```bash
flutter pub get
```

2. Создайте файл `env.json` в корне проекта:

```json
{
  "x_api_key": "YOUR_NEWSAPI_KEY"
}
```

3. Запустите приложение:

```bash
flutter run --dart-define-from-file=env.json
```

Примечание: `x_api_key` используется в заголовке `X-Api-Key` для запросов к [NewsAPI](https://newsapi.org/).

## Архитектура

Проект разделен на 3 слоя:

- `data`:
  работа с источниками данных (API и локальная БД `drift`), `dto`, `dao`, `data_source`.
- `domain`:
  бизнес-сущности (`entities`), `use_case`, `repository`.
- `features`:
  UI-модули по фичам/экранам; каждый модуль содержит `bloc` (состояние и события) и `view` (UI).
