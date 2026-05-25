from sqlmodel import SQLModel, Session, create_engine,  select
from sqlalchemy.ext.asyncio import create_async_engine
from sqlmodel.ext.asyncio.session import AsyncSession
from sqlalchemy.orm import sessionmaker

from app.core.config import settings

async_engine = create_async_engine(str(settings.SQLALCHEMY_DATABASE_URI))


async def get_session() -> AsyncSession:
    async_session = sessionmaker(
        async_engine, class_=AsyncSession, expire_on_commit=False
    )
    async with async_session() as session:
        yield session