FROM python:3.9-slim

ENV \
    TERM=xterm-256color \
    \
    # Don't periodically check PyPI to determine whether a new version of pip is available for download.
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    # Disable package cache.
    PIP_NO_CACHE_DIR=off \
    # Python won’t try to write .pyc files on the import of source modules.
    PYTHONDONTWRITEBYTECODE=on \
    # install a handler for SIGSEGV, SIGFPE, SIGABRT, SIGBUS and SIGILL signals to dump the Python traceback
    PYTHONFAULTHANDLER=on \
    # Force the stdout and stderr streams to be unbuffered.
    PYTHONUNBUFFERED=on \
    # set workdir as PYTHONPATH
    PYTHONPATH=/opt/app

STOPSIGNAL SIGINT

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  \
    && pip install poetry \
    && poetry config virtualenvs.create false

WORKDIR /opt/app
