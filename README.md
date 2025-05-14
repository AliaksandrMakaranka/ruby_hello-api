# Hello API

Простое REST API на Ruby с использованием фреймворка Roda.

## Структура проекта

Проект следует принципам SOLID и использует объектно-ориентированный подход:

```
.
├── app/
│   ├── constants/     # Константы и конфигурации
│   ├── models/        # Модели данных
│   └── services/      # Сервисные классы
├── spec/             # Тесты
├── app.rb           # Основной файл приложения
├── config.ru        # Конфигурация Rack
└── Gemfile          # Зависимости проекта
```

## Принципы SOLID

1. **Single Responsibility Principle (SRP)**
   - `Message` отвечает только за представление сообщения
   - `MessageService` отвечает за бизнес-логику работы с сообщениями
   - `Translations` отвечает только за хранение переводов

2. **Open/Closed Principle (OCP)**
   - Легко добавлять новые переводы без изменения существующего кода
   - Можно расширять функциональность через новые сервисы

3. **Liskov Substitution Principle (LSP)**
   - Все сообщения могут быть использованы взаимозаменяемо

4. **Interface Segregation Principle (ISP)**
   - Интерфейсы разделены на минимальные необходимые части

5. **Dependency Inversion Principle (DIP)**
   - Высокоуровневые модули не зависят от низкоуровневых деталей

## Установка

```bash
bundle install
```

## Запуск

```bash
bundle exec rackup
```

## Тесты

```bash
bundle exec rspec
```

## API Endpoints

- `GET /` - Приветственное сообщение
- `GET /health` - Проверка здоровья API
- `GET /api/messages` - Получить сообщение по умолчанию
- `GET /api/messages/:language` - Получить переведенное сообщение
- `POST /api/messages` - Создать новое сообщение

### Примеры запросов

```bash
# Получить сообщение по умолчанию
curl http://localhost:9292/api/messages

# Получить сообщение на испанском
curl http://localhost:9292/api/messages/es

# Создать новое сообщение
curl -X POST http://localhost:9292/api/messages \
  -H "Content-Type: application/json" \
  -d '{"content":"test message","language":"en"}'
```