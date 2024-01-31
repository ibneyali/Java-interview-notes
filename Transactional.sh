@Transactional

Transactional annotation used for database operations within Spring applications.
It ensures data consistency and integrity by guaranteeing that all operations within a transaction either succeed or fail together, as a single unit of work.

How it works:
Applied at the method or class level:Method-level: Applies to the specific method.
Class-level: Applies to all public methods within the class.
Triggers transaction management:Spring creates a transaction before method execution.
If no issues arise, the transaction commits.
If an exception occurs, the transaction rolls back, undoing any changes.

Key attributes:

"propagation": Controls how a transaction interacts with existing transactions (e.g., REQUIRED, REQUIRES_NEW, NESTED).
"isolation": Specifies the degree to which a transaction is isolated from other concurrent transactions (e.g., READ_COMMITTED, REPEATABLE_READ).
"timeout": Sets a timeout value for transaction completion.
"readOnly": Hints to the persistence provider that no data modifications will occur, potentially optimizing performance.
"rollbackFor": Triggers a rollback for specific exception types.
"noRollbackFor": Prevents rollback for specified exception types.

Example:

@Transactional
public void transferFunds(int fromAccountId, int toAccountId, double amount) {
    accountRepository.withdraw(fromAccountId, amount);
    accountRepository.deposit(toAccountId, amount);
}

Use code with caution. Learn more
content_copyBest practices:
Use @Transactional judiciously, focusing on methods that modify data.
Consider propagation and isolation levels carefully for specific use cases.
Be mindful of transaction boundaries and potential performance implications.
Test transactional behavior thoroughly to ensure proper rollback and commit behavior.
Additional notes:
Spring Boot auto-configures transaction management for most common scenarios.
For more complex requirements, you can customize transaction configuration using Java configuration or XML.
Always consult official Spring documentation for the most up-to-date information and best practices.