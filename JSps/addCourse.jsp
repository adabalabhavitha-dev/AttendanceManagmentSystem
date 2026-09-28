<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add Course</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:#f4f8ff;
}

/* Card */

.container{

width:520px;
background:#ffffff;

padding:40px;

border-radius:25px;

box-shadow:0 15px 40px rgba(0,0,0,.15);

border-top:8px solid #2563eb;

}

/* Icon */

.icon{

width:90px;
height:90px;

margin:auto;

border-radius:50%;

background:linear-gradient(135deg,#2563eb,#7c3aed);

display:flex;
justify-content:center;
align-items:center;

box-shadow:0 10px 25px rgba(37,99,235,.35);

margin-bottom:20px;

}

.icon i{

font-size:42px;
color:white;

}

h2{

text-align:center;

color:#1e3a8a;

margin-bottom:30px;

font-size:32px;

}

/* Input */

.input-box{

margin-bottom:20px;

}

.input-box label{

display:block;

margin-bottom:8px;

font-weight:600;

color:#374151;

}

.input-box label i{

color:#2563eb;

margin-right:8px;

}

.input-box input{

width:100%;

padding:14px 16px;

border:2px solid #dbeafe;

border-radius:12px;

font-size:15px;

outline:none;

background:#fafcff;

transition:.3s;

}

.input-box input:focus{

border-color:#2563eb;

box-shadow:0 0 10px rgba(37,99,235,.25);

}

/* Buttons */

.btn-group{

display:flex;

gap:15px;

margin-top:15px;

}

.save-btn{

flex:1;

padding:15px;

border:none;

border-radius:12px;

background:linear-gradient(135deg,#2563eb,#1d4ed8);

color:white;

font-size:17px;

font-weight:bold;

cursor:pointer;

transition:.3s;

}

.save-btn:hover{

transform:translateY(-3px);

box-shadow:0 10px 20px rgba(37,99,235,.35);

}

.reset-btn{

flex:1;

padding:15px;

border:none;

border-radius:12px;

background:linear-gradient(135deg,#f59e0b,#f97316);

color:white;

font-size:17px;

font-weight:bold;

cursor:pointer;

transition:.3s;

}

.reset-btn:hover{

transform:translateY(-3px);

box-shadow:0 10px 20px rgba(249,115,22,.35);

}

/* Back */

.back{

text-align:center;

margin-top:25px;

}

.back a{

text-decoration:none;

color:#2563eb;

font-size:16px;

font-weight:bold;

transition:.3s;

}

.back a:hover{

color:#7c3aed;

}

</style>

</head>

<body>

<div class="container">

<div class="icon">

<i class="fas fa-graduation-cap"></i>

</div>

<h2>Add Course</h2>

<form action="saveCourse.jsp" method="post">

<div class="input-box">

<label>

<i class="fas fa-id-card"></i>

Course ID

</label>

<input
type="text"
name="course_id"
placeholder="Enter Course ID"
required>

</div>

<div class="input-box">

<label>

<i class="fas fa-book-open"></i>

Course Name

</label>

<input
type="text"
name="course_name"
placeholder="Enter Course Name"
required>

</div>

<div class="input-box">

<label>

<i class="fas fa-clock"></i>

Duration

</label>

<input
type="text"
name="duration"
placeholder="Example : 4 Years"
required>

</div>

<div class="btn-group">

<button type="submit" class="save-btn">

<i class="fas fa-save"></i>

Save Course

</button>

<button type="reset" class="reset-btn">

<i class="fas fa-rotate-left"></i>

Reset

</button>

</div>

</form>

<div class="back">

<a href="course.jsp">

<i class="fas fa-arrow-left"></i>

Back to Courses

</a>

</div>

</div>

</body>
</html>

                                            
