from app import create_app, db
import os

app = create_app()

with app.app_context():
    db.create_all()

if __name__ == '__main__':
    # app.run(debug=True, host='127.0.0.1', port=int(os.environ.get('PORT', 8080)))
    # app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)), debug=app.config['DEBUG'])

