#! /usr/bin/env bash

set -e

echo "Running migrations..."

uv run alembic upgrade head

echo "Success. Running fastapi..."

uv run fastapi run --port 80