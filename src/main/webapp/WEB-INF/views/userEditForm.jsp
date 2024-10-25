<!DOCTYPE html>
<html>
<head>
    <title>User Form</title>
</head>
<body>
<h1>User Edit Form</h1>

<form action="${pageContext.request.contextPath}/user-edit" method="post">
    <input type="hidden" id="id" name="id" value="${user.id}">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" value="${user.username}" required>
    <br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${user.email}" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" value="${user.password}" required>
    <br>
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" value="${user.firstName}" required>
    <br>
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" value="${user.lastName}" required>
    <br>
    <label for="identificationDocument">Identification Document:</label>
    <input type="text" id="identificationDocument" name="identificationDocument" value="${user.identificationDocument}" required>
    <br>
    <label for="nationality">Nationality:</label>
    <input type="text" id="nationality" name="nationality" value="${user.nationality}" required>
    <br>
    <label for="registrationDate">Registration Date:</label>
    <input type="date" id="registrationDate" name="registrationDate" value="${user.registrationDate}" required>
    <br>
    <label for="accountExpirationDate">Account Expiration Date:</label>
    <input type="date" id="accountExpirationDate" name="accountExpirationDate" value="${user.accountExpirationDate}" required>
    <br>
    <button type="submit">Submit</button>
</form>

<a href="${pageContext.request.contextPath}/">Cancel</a>
</body>
</html>