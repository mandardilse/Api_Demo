### How to run this project?
-Run command for creating docker image => docker build . -t api_demo:alpine
-Run command for spinning-up container => docker run -it -p 8000:80 -e ASPNETCORE_ENVIRONMENT=Development api_demo:alpine