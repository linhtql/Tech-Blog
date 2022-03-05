<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<!-- customs css -->
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<!-- boostrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0, 100% 0%, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}
</style>
</head>
<body>

	<!-- navbar -->
	<%@include file="/common/normal_navbar.jsp"%>
	<!--end navbar -->


	<main
		class="d-flex alight-items-center primary-background banner-background"
		style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-center primary-background text-white">
							<span class="	
fa fa-user-plus fa-3x"></span>
							<p>Login here</p>
						</div>

						<%
						Message m = (Message) session.getAttribute("msg");
						if (m != null) {
						%>
						<div class="alert <%= m.getCssClass() %>" role="alert">
							<%=m.getContent()%></div>
						<%
						session.removeAttribute("msg");
						}
						%>

						<div class="card-body">

							<form action="LoginServlet" method="POST">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="user_email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="user_password" type="password" class="form-control"
										id="exampleInputPassword1">
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</main>





	<!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>

	<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>