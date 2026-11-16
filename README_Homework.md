
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
