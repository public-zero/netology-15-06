
# Домашнее задание 15-06. Практическое применение Docker

## Задача 0. Проверка Docker Compose

Проверил установку Docker Compose.

- `docker-compose` — не установлен.
- `docker compose` — установлен, версия v5.5.0.

Версия соответствует требованиям задания.

![Проверка Docker Compose](screenshots/01_compose_version.png)


## Задача 1. Сборка Python-приложения

Создал Fork репозитория [shvirtd-example-python](https://github.com/netology-code/shvirtd-example-python) в своём GitHub:

https://github.com/public-zero/netology-15-06

Создал `Dockerfile.python` с multi-stage сборкой на основе `python:3.12-slim`.

- Первый этап — установка библиотек из `requirements.txt`.
- Второй этап — копирование библиотек и файлов приложения.

Добавил `.dockerignore` для исключения ненужных файлов.

![Dockerfile.python](screenshots/02_multistage_dockerfile.png)

Собрал Docker-образ:

    docker build -f Dockerfile.python -t netology-15-06-web .

Образ успешно собран. Размер — 269 MB.

![Сборка Docker-образа](screenshots/03_docker_build.png)

Запустил контейнер и проверил работу Uvicorn через `docker logs`. Приложение успешно запустилось на порту 5000.

![Запуск контейнера](screenshots/04_container_running.png)

После проверки остановил и удалил тестовый контейнер.




## Задача 3. Docker Compose

Создал `compose.yaml` для запуска приложения FastAPI и базы данных MySQL.

Через `include` подключил `proxy.yaml` с настройками Nginx и HAProxy.

Настроил сеть `backend`:
- `web` — 172.20.0.5
- `db` — 172.20.0.10

Пароли и настройки базы данных берутся из `.env`.

![Конфигурация Docker Compose](screenshots/05_compose_yaml.png)

Запустил проект командой:

    docker compose up -d

Все четыре контейнера успешно запустились.

![Запущенные контейнеры](screenshots/06_compose_ps.png)

Проверил работу приложения:

    curl -L http://127.0.0.1:8090

Приложение вернуло время запроса и IP-адрес.

![Проверка HTTP-запроса](screenshots/07_curl_response.png)

Подключился к MySQL, проверил базу `virtd` и таблицу `requests`. В таблице появились две записи о HTTP-запросах.

![Проверка MySQL](screenshots/08_mysql_queries.png)

Остановил проект командой:

    docker compose down


