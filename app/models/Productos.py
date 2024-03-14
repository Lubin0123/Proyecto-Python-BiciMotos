from app import db

class Productos(db.Model):
    __tablename__ = "producto"
    idProductos = db.Column(db.Integer, primary_key=True)
    descripcionProductos= db.Column(db.String(255), nullable=False)
    precioProductos = db.Column(db.String(255),nullable=False)
    cantidadProductos = db.Column(db.String(255), nullable=False)
    nombreImagen = db.Column(db.String(255))
    informacionProductos = db.Column(db.String(3000),nullable=True)
    facturas = db.relationship("FacturaVentas", secondary="detalleVenta",back_populates="productos")
    
