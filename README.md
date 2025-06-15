# ApiAgenda

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![ASP.NET Core](https://img.shields.io/badge/ASP.NET%20Core-blue.svg)](https://dotnet.microsoft.com/apps/aspnet)
[![Entity Framework](https://img.shields.io/badge/Entity%20Framework-6.4.4-green.svg)](https://docs.microsoft.com/en-us/ef/)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://www.docker.com/)

A Contact Management API built with ASP.NET Core that provides CRUD operations for managing contacts.

## 📋 Table of Contents

- [Features](#features)
- [Technologies](#technologies)
- [Project Structure](#project-structure)
- [API Endpoints](#api-endpoints)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Docker Setup](#docker-setup)
- [Database Configuration](#database-configuration)
- [Usage Examples](#usage-examples)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- **Contact Management**: Create, read, update, and delete contacts
- **Search Functionality**: Find contacts by ID, name, or phone number
- **RESTful API**: Standard HTTP methods for resource manipulation
- **Docker Support**: Easy deployment with containerization

## 🛠️ Technologies

- **ASP.NET Core**: Web API framework
- **Entity Framework**: ORM for database operations
- **SQL Server**: Database for storing contact information
- **Docker**: Containerization for easy deployment

## 📁 Project Structure

The solution is organized into multiple projects:

- **API.Model**: Contains the data models (e.g., Contact)
- **API.DataAccess**: Handles database operations and repositories
- **API.Service**: Implements the API controllers and business logic

## 🔌 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/contatos` | Get all contacts |
| GET | `/contatosid?id={id}` | Get contact by ID |
| GET | `/contatoscelular?celular={phone}` | Get contact by phone number |
| PUT | `/inserircontato` | Create a new contact |
| PATCH | `/atualizarcontato` | Update an existing contact |
| DELETE | `/excluircontato` | Delete a contact |

## 🚀 Getting Started

### Prerequisites

- [.NET Core SDK](https://dotnet.microsoft.com/download) (latest version)
- [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) or SQL Server Express
- [Docker](https://www.docker.com/products/docker-desktop) (optional, for containerization)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ApiAgenda.git
   cd ApiAgenda
   ```

2. Restore dependencies:
   ```bash
   dotnet restore
   ```

3. Update the database connection string in `API.Service/appsettings.json`

4. Build the solution:
   ```bash
   dotnet build
   ```

5. Run the API:
   ```bash
   cd API.Service
   dotnet run
   ```

### Docker Setup

1. Build the Docker image:
   ```bash
   docker build -t apiagenda .
   ```

2. Run the container:
   ```bash
   docker run -d -p 8080:80 --name apiagenda-container apiagenda
   ```

3. Access the API at `http://localhost:8080`

## 🗄️ Database Configuration

The application uses SQL Server as its database. Update the connection string in `API.Service/appsettings.json`:

```json
{
  "ConnectionStrings": {
    "BDService": "Server=your-server;Database=AgendaContato;User Id=your-username;Password=your-password;"
  }
}
```

For Docker deployment, you can use environment variables to override the connection string.

## 📝 Usage Examples

### Creating a new contact

```bash
curl -X PUT \
  http://localhost:5000/inserircontato \
  -H 'Content-Type: application/json' \
  -d '{
    "Apelido": "John",
    "Nome": "John Doe",
    "Email": "john.doe@example.com",
    "TelefonePrincipal": "123-456-7890",
    "TelefoneSecundario": "098-765-4321",
    "Celular": "555-123-4567"
}'
```

### Getting all contacts

```bash
curl -X GET http://localhost:5000/contatos
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.