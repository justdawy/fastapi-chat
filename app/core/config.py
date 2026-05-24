from pydantic_settings import BaseSettings


class Config(BaseSettings):
    app_name: str = "Real-Time Chat Backend"
    debug: bool = False


config = Config()
