<%@ page language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>

    <style>

    *{
        margin:0;
        padding:0;
        box-sizing:border-box;
        font-family:Arial,sans-serif;
    }body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#6a8fe8,#6fd3f5);
}

.container{
    width:450px;
    background:#fff;
    border-radius:25px;
    padding:40px;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
    text-align:center;
}

.container h1{
    color:#183b72;
    font-size:42px;
    margin-bottom:10px;
}

.container p{
    color:#666;
    font-size:18px;
    margin-bottom:30px;
}

.icon{
    font-size:70px;
    color:#183b72;
    margin-bottom:20px;
}

.input-box{
    position:relative;
    margin-bottom:20px;
}

.input-box i{
    position:absolute;
    left:15px;
    top:50%;
    transform:translateY(-50%);
    color:#183b72;
    font-size:18px;
}

.input-box input{
    width:100%;
    padding:14px 14px 14px 45px;
    border:2px solid #ddd;
    border-radius:10px;
    font-size:16px;
    outline:none;
    transition:.3s;
}

.input-box input:focus{
    border-color:#183b72;
}

button{
    width:100%;
    padding:15px;
    border:none;
    border-radius:30px;
    background:#183b72;
    color:white;
    font-size:20px;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
}

button:hover{
    background:#29549d;
    transform:scale(1.03);
}

.back{
    margin-top:20px;
}

.back a{
    text-decoration:none;
    color:#183b72;
    font-weight:bold;
}

.back a:hover{
    text-decoration:underline;
}




}    h1{
        color:#003366;
        margin-bottom:10px;
    }

    p{
        color:#666;
        margin-bottom:25px;
    }

    input{
        width:100%;
        padding:12px;
        margin:12px 0;
        border:1px solid #ccc;
        border-radius:8px;
        font-size:16px;
    }

    .btn{
        width:100%;
        padding:12px;
        background:#003366;
        color:white;
        border:none;
        border-radius:30px;
        font-size:17px;
        cursor:pointer;
    }

    .btn:hover{
        background:#0055aa;
    }

    .back{
        margin-top:20px;
    }

    .back a{
        text-decoration:none;
        color:#003366;
        font-weight:bold;
    }

    </style>

</head>

<body>

<div class="container">

    <h1>Student Login</h1>

    <p>Enter your credentials</p>

    <form action="studentLoginProcess.jsp" method="post">

        <input
            type="text"
            name="student_id"
            placeholder="Enter Student ID"
            required>

        <input
            type="password"
            name="password"
            placeholder="Enter Password"
            required>

        <br><br>

        <input
            type="submit"
            value="Login"
            class="btn">

    </form>

    <div class="back">
        <a href="index.html">Back to Home</a>
    </div>

</div>

</body>
</html>