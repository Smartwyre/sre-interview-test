# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /source

COPY app .
RUN dotnet restore
RUN dotnet publish -c release -o /app --no-restore

WORKDIR /app
ENV ASPNETCORE_URLS=http://*:5000
EXPOSE 5000
ENTRYPOINT ["./app"]