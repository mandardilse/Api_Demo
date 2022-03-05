## This Project is to demostrate how to use Docker
- We have used alpine linux distribution to create very slim image.
- Generally image size would be 213 MB. But due to alpine linux size reduce to 52 MB.
### How to run this project?
- Run command for creating docker image => docker build . -t api_demo:alpine
- Run command for spinning-up container => docker run -it -p 8000:80 -e ASPNETCORE_ENVIRONMENT=Development api_demo:alpine
- After running above mentioned command go to browser and type http://localhost:8000/swagger/index.html you will get swagger ui page.
