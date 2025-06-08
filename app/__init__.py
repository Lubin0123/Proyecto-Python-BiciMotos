from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_migrate import Migrate
from config import ProductionConfig, DevelopmentConfig
import os

#from flask_bcrypt import Bcrypt

login_manager = LoginManager()
db = SQLAlchemy()
migrate = Migrate()
def create_app():
    app = Flask(__name__)
    # Detectar entorno desde variable FLASK_ENV
    Flask_ENV = os.getenv('FLASK_ENV', 'development')
    
    if Flask_ENV == 'production':
        app.config.from_object('config.ProductionConfig')
        print("🚀 Modo Producción Activo")
    else:
        app.config.from_object('config.DevelopmentConfig')
        print("🛠️ Modo Desarrollo Activo")
    #bcrypt = Bcrypt(app)
    db.init_app(app)
    migrate.init_app(app, db)
    login_manager.init_app(app)
    login_manager.login_view = 'autentificacionBp.login'

    from app.models import Clientes
    @login_manager.user_loader
    def load_user(user_id):
        return Clientes.query.get(int(user_id))

    # Registrar Blueprints
    from app.routes import (
    clienteRoute, productoRoute, autentificacionRoute, facturaVentasRoute,
     carritoVentasRoute, detalleVentaRoute,administradorRoute)

    app.register_blueprint(clienteRoute.bp)
    app.register_blueprint(productoRoute.bp)
    app.register_blueprint(autentificacionRoute.bp)
    app.register_blueprint(facturaVentasRoute.bp)
    app.register_blueprint(carritoVentasRoute.bp)
    app.register_blueprint(detalleVentaRoute.bp)
    app.register_blueprint(administradorRoute.bp)

    return app
