# Python deploy docker

Multi-arch докер образ со всем необходимым для деплоя python приложений, использующих [poetry](https://python-poetry.org/).

### Использование

```dockerfile
FROM markovvn1/python-poetry-docker

# use product environment
ARG ENVIRONMENT='production'

# copy poetry files
COPY poetry.lock poetry.lock
COPY pyproject.toml pyproject.toml

# install all dependencies using poetry
RUN poetry install $([ "$ENVIRONMENT" = 'production' ] && echo "--no-dev")

# copy source files
COPY my_best_app my_best_app

# run application (for example, uvicorn)
ENTRYPOINT ["uvicorn", "--host", "0.0.0.0", "--port", "80", "my_best_app:app"]

```

