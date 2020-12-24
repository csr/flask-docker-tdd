# src/tests/conftest.py

import pytest

from src import app, db

@pytest.fixture(scope='module')
def test_app():
    app.config.from_object('src.config.TestingConfig')
    with app.app_context():
        yield app


@pytest.fixture(scope='module')
def test_database():
    db.create_all()
    yield db
    db.session.remove()
    dp.drop_all()