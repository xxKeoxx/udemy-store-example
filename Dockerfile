FROM centos
COPY requirements.txt requirements.txt
ENV PYTHONPATH "${PYTHONPATH}:/UDEMY_STORE_EXAMPLE/"
CMD ["/bin/bash", "-c", "/UDEMY_STORE_EXAMPLE/app.py"]
