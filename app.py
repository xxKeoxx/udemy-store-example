from flask import Flask
from flask_smorest import Api
 
from flask import send_from_directory

# from resources.item import blp as ItemBlueprint
from resources.status import blp as StoreBlueprint
 
app = Flask(__name__)
 
app.config["PROPAGATE_EXCEPTIONS"] = True
app.config["API_TITLE"] = "Stores REST API"
app.config["API_VERSION"] = "v1"
app.config["OPENAPI_VERSION"] = "3.0.3"
app.config["OPENAPI_URL_PREFIX"] = "/"
app.config["OPENAPI_SWAGGER_UI_PATH"] = "/swagger-ui"
 
app.config["OPENAPI_SWAGGER_UI_URL"] = "http://localhost:5050/swagger-docs/"
app.config["OPENAPI_SWAGGER_UI_FILE_PATH"] = "swagger-ui-4.18.2/dist"
 
@app.get('/swagger-docs/<path:filename>')
def serve_swagger(filename):
    return send_from_directory(app.config["OPENAPI_SWAGGER_UI_FILE_PATH"], filename)
 
api = Api(app)

api.register_blueprint(StoreBlueprint)
