<%--  
    Document   : register 
    Created on : Sep 10, 2026, 2:01:39 PM 
    Author     : ADMIN 
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Register Page</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f6f8;
            color: #333;
        }

        .container {
            width: 500px;
            margin: 70px auto;
            background: white;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.12);
        }

        h1 {
            margin-top: 0;
            margin-bottom: 15px;
            text-align: center;
            color: #222;
        }

        .description {
            text-align: center;
            color: #666;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        form {
            width: 100%;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #444;
        }

        input[type="email"],
        input[type="text"] {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            outline: none;
        }

        input[type="email"]:focus,
        input[type="text"]:focus {
            border-color: #333;
            box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.08);
        }

        .submit-container {
            margin-top: 25px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 6px;
            background: #222;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #444;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #555;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <div class="container">

        <h1>Download Registration</h1>

        <p class="description">
            To register for our downloads, enter your name and email address below.
            Then, click on the Register button.
        </p>

        <form action="download" method="post">

            <input type="hidden" name="action" value="registerUser">

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email"
                       id="email"
                       name="email"
                       value="${user.email}"
                       required>
            </div>

            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text"
                       id="firstName"
                       name="firstName"
                       value="${user.firstName}"
                       required>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text"
                       id="lastName"
                       name="lastName"
                       value="${user.lastName}"
                       required>
            </div>

            <div class="submit-container">
                <input type="submit" value="Register">
            </div>

        </form>

        <a href="index.html" class="back-link">
            ← Back to Music Store
        </a>

    </div>

</body>
</html>