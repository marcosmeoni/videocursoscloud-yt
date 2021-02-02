Comando usados en este video:


docker build -t lambda-python:3.6 .

docker run -p 9000:8080 lambda-python:3.6

curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"payload":"hello world!"}'

