#! /usr/bin/env bash

set -e

echo "Running migrations..."

alembic upgrade head

echo "Success. Running fastapi..."

fastapi run --port 80
