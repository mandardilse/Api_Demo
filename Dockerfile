FROM mcr.microsoft.com/dotnet/runtime-deps:6.0-alpine AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src
COPY ["Api_Demo.csproj", "./"]
RUN dotnet restore "Api_Demo.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "Api_Demo.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Api_Demo.csproj" -c Release -o /app/publish \
   -r alpine-x64 \
   --self-contained true \
   -p:PublishTrimmed=true \
   -p:PublishSingleFile=true

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["./Api_Demo"]