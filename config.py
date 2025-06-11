from dotenv import load_dotenv
import os
load_dotenv()
DB_PORT = os.getenv('DB_PORT', '3306')
class Config:
    SECRET_KEY= os.getenv("SECRET_KEY", "supersecretkey")
    SQLALCHEMY_TRACK_MODIFICATIONS = False

class DevelopmentConfig(Config):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = (  
        f"mysql+pymysql://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}"
        f"@{os.getenv('DB_HOST')}:{DB_PORT}/{os.getenv('DB_NAME')}"
    )
#  SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:HHGDd16cE62aB5BfG6CgCDDB64b4CC6g@roundhouse.proxy.rlwy.net:40202/motos2'
class ProductionConfig(Config):
    DEBUG = False
    SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URL")