# Importar la clase Flask y SQLAlchemy desde sus respectivos modelos
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
#from flask_bcrypt import Bcrypt
import os

login_manager = LoginManager()
db = SQLAlchemy()
def create_app():
    app = Flask(__name__)

    # Configurar una clave secreta para la aplicación (importante
    # para la seguridad)
    app.config['SECRET_KEY'] = os.urandom(24)
    # Configurar la aplicación utilizando una clase de
    #  configuración en 'config.Config'
    app.config.from_object('config.Config')


    #bcrypt = Bcrypt(app)
    # Inicializar la instancia de SQLAlchemy ('db') con la aplicación Flask
    db.init_app(app)

    # Inicializar la instancia de LoginManager ('login_manager')
    #  con la aplicación Flask
    login_manager.init_app(app)
    login_manager.login_view = 'autentificacionBp.login'

    # Definir una función para cargar usuarios durante la autenticación
    @login_manager.user_loader
    def load_user(user_id):

        from app.models.Clientes import Clientes
         # Utilizar el ID del usuario para buscar y cargar el usuario desde la base de datos
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
