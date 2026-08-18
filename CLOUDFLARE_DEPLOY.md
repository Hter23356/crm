# Cloudflare Pages Deploy

Используйте один репозиторий:

```text
https://github.com/Hter23356/crm
```

Не создавайте новый репозиторий для каждой попытки.

## Настройки Cloudflare Pages

Откройте:

```text
Cloudflare Dashboard -> Workers & Pages -> Create -> Pages -> Connect to Git
```

Выберите репозиторий:

```text
Hter23356/crm
```

Поставьте настройки:

```text
Project name: uman-crm
Production branch: main
Framework preset: None
Build command: npm run build
Build output directory: dist
Root directory: оставить пустым
Deploy command: оставить пустым
```

Важно: в поле `Deploy command` ничего не пишите.

Не пишите туда:

```text
npx wrangler pages deploy public
```

Cloudflare сам деплоит Pages после команды `npm run build`.

Если деплоите из Терминала, используйте:

```bash
cd /Users/23force/Documents/Codex/2026-06-04/new-chat/work/uman-transfer-crm
npm run build
npx wrangler pages deploy dist --project-name uman-crm
```

## D1 Binding

После первого деплоя откройте настройки Pages проекта:

```text
Settings -> Bindings -> Add binding -> D1 database
```

Поставьте:

```text
Variable name: DB
D1 database: uman-transfer-crm
```

Сохраните и сделайте повторный деплой:

```text
Deployments -> Retry deployment
```

## База данных

Миграции уже можно применить командой:

```bash
npm run migrate:remote
```

Или напрямую:

```bash
npx wrangler d1 migrations apply DB --remote
```

## Проверка

После деплоя откройте:

```text
https://uman-crm.pages.dev/login
```

Или домен, который покажет Cloudflare.

Тестовый вход:

```text
admin / admin123
```

После первого входа сразу смените пароль.
