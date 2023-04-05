FROM ubuntu

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install --upgrade pip
# RUN pip3 install flask
COPY app.py /app/app.py
COPY resources /app/resources
COPY swagger-ui-4.18.2 /app/swagger-ui-4.18.2
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
WORKDIR /app
ENV FLASK_APP=app.py \
    PYTHONPATH="${PYTHONPATH}:/app:/app/resources:/app/swagger-ui-4.18.2" \
    PYTHONDONTWRITEBYTECODE=1
EXPOSE 5050

# CMD ["flask", "run", "--host=0.0.0.0"]
# CMD ["/bin/bash", "-c", "python3 /app/app.py"]
CMD ["flask", "run", "--host=0.0.0.0", "--port=5050", "--debug"]
