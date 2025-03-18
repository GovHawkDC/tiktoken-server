# Create a docker file for python 3.10 from an alpine image
# Use pip to install flask
# Use pip to install tiktoken
# Copy the /usr/tiktoken/tiktoken_server.py file to the container
# The entry point for the container is python -m flask --app /usr/tiktoken/tiktoken_server.py run

FROM python:3.12-alpine
RUN pip install flask
RUN pip install tiktoken
RUN pip install gunicorn
COPY src/tiktoken_server.py /usr/tiktoken/tiktoken_server.py
WORKDIR /usr/tiktoken

CMD ["python", "-m", "gunicorn", "-b", "0.0.0.0:5000", "-w" , "4", "tiktoken_server:app"]

EXPOSE 5000

