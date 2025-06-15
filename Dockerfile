FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy csproj files and restore dependencies
COPY *.sln .
COPY API.Model/*.csproj ./API.Model/
COPY API.DataAccess/*.csproj ./API.DataAccess/
COPY API.Service/*.csproj ./API.Service/
RUN dotnet restore

# Copy the project files and build
COPY API.Model/. ./API.Model/
COPY API.DataAccess/. ./API.DataAccess/
COPY API.Service/. ./API.Service/
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/out .

# Set environment variables for database connection
ENV ConnectionStrings__BDService="Server=db;Database=AgendaContato;User Id=sa;Password=YourStrong@Passw0rd;"

EXPOSE 80
ENTRYPOINT ["dotnet", "API.Service.dll"]