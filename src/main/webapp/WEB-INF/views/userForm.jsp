<!DOCTYPE html>
<html>
<head>
    <title>User Form</title>
</head>
<body>
<h1>User Form</h1>

<form action="${pageContext.request.contextPath}/" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required>
    <br>
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" required>
    <br>
    <label for="identificationDocument">Identification Document:</label>
    <input type="text" id="identificationDocument" name="identificationDocument" required>
    <br>
    <label for="nationality">Nationality:</label>
    <input type="text" id="nationality" name="nationality" required>
    <br>
    <label for="registrationDate">Registration Date:</label>
    <input type="date" id="registrationDate" name="registrationDate" required>
    <br>
    <label for="accountExpirationDate">Account Expiration Date:</label>
    <input type="date" id="accountExpirationDate" name="accountExpirationDate" required>
    <br>
    <button type="submit">Submit</button>
</form>

<a href="${pageContext.request.contextPath}/">Cancel</a>
</body>
</html>