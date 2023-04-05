from flask.views import MethodView
from flask_smorest import Blueprint, abort


blp = Blueprint("status", "status", description="return status of this site")

@blp.route('/site_status', methods=['GET'])
class SiteHealth(MethodView):

    def get(self):
        """Opertions to check site health
        
        Returns:
        {
            "message": "Healthy"
        }
        ___
        """

        return {'message': 'Healthy'}