-- Create the database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AgendaContato')
BEGIN
    CREATE DATABASE AgendaContato;
END
GO

USE AgendaContato;
GO

-- Create Contato table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Contato')
BEGIN
    CREATE TABLE Contato (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        Apelido NVARCHAR(100),
        Nome NVARCHAR(200) NOT NULL,
        Email NVARCHAR(200),
        TelefonePrincipal NVARCHAR(20),
        TelefoneSecundario NVARCHAR(20),
        Celular NVARCHAR(20)
    );
END
GO

-- Insert sample data if the table is empty
IF NOT EXISTS (SELECT TOP 1 * FROM Contato)
BEGIN
    INSERT INTO Contato (Apelido, Nome, Email, TelefonePrincipal, TelefoneSecundario, Celular)
    VALUES 
        ('John', 'John Doe', 'john.doe@example.com', '123-456-7890', '098-765-4321', '555-123-4567'),
        ('Jane', 'Jane Smith', 'jane.smith@example.com', '123-456-7891', '098-765-4322', '555-123-4568'),
        ('Bob', 'Bob Johnson', 'bob.johnson@example.com', '123-456-7892', '098-765-4323', '555-123-4569');
END
GO