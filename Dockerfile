FROM ubuntu

RUN apt update -y
RUN apt install python3 python3-pip -y

WORKDIR /app
COPY . /app/
RUN pip install -r requirements.txt

EXPOSE 80

CMD ["python3", "main.py"]
