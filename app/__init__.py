from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_migrate import Migrate
#from flask_bcrypt import Bcrypt
import os

login_manager = LoginManager()
db = SQLAlchemy()
migrate = Migrate()
def create_app():
    app = Flask(__name__)

    app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
    app.config.from_object('config.Config')
    #bcrypt = Bcrypt(app)
    db.init_app(app)
    migrate.init_app(app, db)
    login_manager.init_app(app)
    login_manager.login_view = 'autentificacionBp.login'

    @login_manager.user_loader
    def load_user(user_id):
        from app.models.Clientes import Clientes
        return Clientes.query.get(int(user_id))

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
