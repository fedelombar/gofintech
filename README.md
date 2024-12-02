# Fintech API

A robust fintech API written in Go, designed to manage user accounts, handle secure authentication, and facilitate operations such as account creation, login, and balance transfers.

## Features

- **Account Management**: Create, update, delete, and retrieve user accounts.
- **Authentication**: Secure login using JWT.
- **Database Support**: PostgreSQL integration for account storage.
- **RESTful API**: Interact with the system via HTTP requests.
- **Data Seeding**: Seed the database with initial test data.
- **Middleware**: JWT-based authentication for secure endpoints.
- **Docker Support**: Containerized application for easy deployment.

## Technologies Used

- **Go**: Backend development.
- **PostgreSQL**: Relational database.
- **JWT**: Authentication and authorization.
- **Mux**: HTTP request router.
- **bcrypt**: Password encryption.
- **Docker**: Containerization for consistent development and deployment.

## Getting Started

### Prerequisites

- Docker and Docker Compose
- Make (for running Makefile commands)
- A configured `.env` file with:
    - `JWT_SECRET`: Secret key for JWT signing.
    - PostgreSQL connection details.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/fedelombar/gofintech.git
   cd gofintech
   ```

2. Build and run the application with Docker:
   ```bash
   docker-compose up --build
   ```

3. (Optional) Seed the database:
   ```bash
   docker-compose run app --seed
   ```

4. Alternatively, use the Makefile commands:

    - **Build**: Compile the application.
      ```bash
      make build
      ```

    - **Run**: Start the application.
      ```bash
      make run
      ```

    - **Test**: Run tests.
      ```bash
      make test
      ```

### API Endpoints

| Endpoint            | Method | Description                             |
|---------------------|--------|-----------------------------------------|
| `/login`            | POST   | Authenticate user and return a JWT.    |
| `/account`          | GET    | Retrieve all accounts.                 |
| `/account`          | POST   | Create a new account.                  |
| `/account/{id}`     | GET    | Get account details by ID.             |
| `/account/{id}`     | DELETE | Delete an account by ID.               |
| `/transfer`         | POST   | Transfer funds between accounts.       |

### Example Requests

#### Login
```bash
curl -X POST http://localhost:8080/login -H "Content-Type: application/json" -d '{
  "number": 123456789,
  "password": "whatever"
}'
```

#### Create Account
```bash
curl -X POST http://localhost:8080/account -H "Content-Type: application/json" -d '{
  "first_name": "John",
  "last_name": "Doe",
  "password": "securepassword"
}'
```

### Running Tests

Run all tests using the Makefile:
```bash
make test
```

Alternatively, run tests manually:
```bash
go test -v ./...
```

### Project Structure

- **`main.go`**: Entry point for the application.
- **`storage.go`**: Implements the storage interface for database operations.
- **`api_server.go`**: Contains the HTTP server and request handlers.
- **`models.go`**: Defines data models like `Account` and related logic.
- **`Dockerfile`**: Defines the Docker image for the application.
- **`docker-compose.yml`**: Orchestrates the application and database.

### Future Improvements

- Implement the `UpdateAccount` function.
- Add support for environment-based configuration.
- Enhance logging and error handling.
- Add more test cases for comprehensive coverage.

## License

This project is open-source and licensed under [MIT](LICENSE).
