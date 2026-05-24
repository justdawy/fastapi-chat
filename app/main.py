from fastapi import FastAPI
from contextlib import asynccontextmanager
from app.core.config import settings
from app.core.db import create_db_and_tables

@asynccontextmanager
async def lifespan(app: FastAPI):
    await create_db_and_tables()
    yield

app = FastAPI(title=settings.APP_NAME, lifespan=lifespan)
