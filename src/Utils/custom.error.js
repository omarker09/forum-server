// custom error class that extends the built-in Error class
class DatabaseError extends Error {
    constructor(message) {
        super(message);
        this.name = "DatabaseError";
        this.statusCode = 500;
    }
}

// custom error class for validation errors
class ValidationError extends Error {
    constructor(message) {
        super(message);
        this.name = "ValidationError";
        this.statusCode = 400;
    }
}

class NotFoundError extends Error {
    constructor(message) {
        super(message);
        this.name = "NotFoundError",
        this.statusCode = 404;
    }
}

// custom error class for authentication errors
class AuthenticationError extends Error {
    constructor(message) {
        super(message);
        this.name = "AuthenticationError";
        this.statusCode = 401;
    }
}

class TransactionError extends Error {
    constructor(message) {
        super(message);
        this.name = "TransactionError";
        this.statusCode = 403
    }
}
// Export the custom error classes
module.exports = {
    DatabaseError,
    ValidationError,
    AuthenticationError,
    TransactionError,
    NotFoundError
};
