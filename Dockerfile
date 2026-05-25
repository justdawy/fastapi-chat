FROM python:3.13-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY . /app

ENV UV_NO_DEV=1

WORKDIR /app
RUN uv sync --locked
COPY prestart.sh /prestart.sh
RUN chmod +x /prestart.sh
ENTRYPOINT [ "/prestart.sh" ]
