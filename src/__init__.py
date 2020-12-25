# src/__init__.py

import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy


# instantiate the db
db = SQLAlchemy()


def create_app(script_info=None):

    # Instantiate the app
    app = Flask(__name__)

    # Set config
    app_settings = os.getenv('APP_SETTINGS')
    app.config.from_object(app_settings)

    # Set up extensions
    db.init_app(app)

    # Register blueprints
    from src.api.ping import ping_blueprint
    app.register_blueprint(ping_blueprint)

    # Shell context for flask CLI
    @app.shell_context_processor
    def ctx():
        return {'app': app, 'db': db}

    return app