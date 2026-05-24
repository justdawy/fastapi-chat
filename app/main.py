from fastapi import FastAPI

from app.core.config import config

app = FastAPI(title=config.app_name)
