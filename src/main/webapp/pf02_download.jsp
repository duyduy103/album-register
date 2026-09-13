<%--  
    Document   : 8601_download 
    Created on : Sep 10, 2026, 2:17:30 PM 
    Author     : ADMIN 
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>The pf02 Download Page</title>

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
            width: 700px;
            margin: 60px auto;
            background: white;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.12);
        }

        h1 {
            margin-top: 0;
            text-align: center;
            color: #222;
            margin-bottom: 10px;
        }

        h2 {
            text-align: center;
            color: #555;
            font-size: 20px;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background: #222;
            color: white;
            padding: 14px;
            text-align: left;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f7f7f7;
        }

        .download-link {
            display: inline-block;
            padding: 8px 16px;
            background: #222;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .download-link:hover {
            background: #444;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            color: #555;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <div class="container">

        <h1>Downloads</h1>

        <h2>Tinh hà say hi </h2>

        <table>
            <tr>
                <th>Song Title</th>
                <th>Audio Format</th>
            </tr>

            <tr>
                <td>Cô đơn anh cũng vui </td> 
                <td>
                    <a class="download-link"
                       href="${pageContext.request.contextPath}/musicStore/sound/${productCode}/CDACV.mp3">
                        Download MP3
                    </a>
                </td>
            </tr>

            <tr>
                <td>LAVIEM</td>
                <td>
                    <a class="download-link"
                       href="${pageContext.request.contextPath}/musicStore/sound/${productCode}/LAVIEM.mp3">
                        Download MP3
                    </a>
                </td>
            </tr>
        </table>

        <a href="index.html" class="back-link">
            ← Back to Music Store
        </a>

    </div>

</body>
</html>