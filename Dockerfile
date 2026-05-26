############################
# 1. Builder stage
############################

FROM python:3.13-slim-bookworm AS builder

ENV UV_NO_DEV=1
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

COPY --from=ghcr.io/astral-sh/uv:0.11.16 /uv /uvx /bin/

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --locked

############################
# 2. Runtime stage
############################

FROM python:3.13-slim-bookworm

ENV HOME=/home/app
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN addgroup --gid 1001 app && \
    adduser \
        --uid 1001 \
        --ingroup app \
        --disabled-password \
        --gecos "" \
        app

# Copy venv separately, then source code
COPY --from=builder --chown=app:app /app/.venv /app/.venv
COPY --chmod=755 --chown=app:app . /app

ENV PATH="/app/.venv/bin:$PATH"

USER app

ENTRYPOINT ["/app/prestart.sh"]
