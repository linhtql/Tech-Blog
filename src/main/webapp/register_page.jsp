<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>

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

	<main class="primary-background banner-background"
		style="padding-bottom: 50px">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="	
fa fa-user-circle-o fa-3x"></span> <br>
						Register here
					</div>
					<div class="card-body">

						<form id="reg-form" action="RegisterServlet" method="POST">
							<div class="form-group">
								<label for="user_name">User Name</label> <input type="text"
									class="form-control" name="user_name" id="user_name"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="user_email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"> <small
									id="emailHelp" class="form-text text-muted">We'll never
									share your email with anyone else.</small>
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="user_password" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="gender">Select Gender</label> <br> <input
									type="radio" id="gender" name="user_gender" value="male" checked="checked">Male
								<input type="radio" id="gender" name="user_gender"
									value="female">Female
							</div>

							<div class="form-group">
								<textarea class="form-control" name="user_about" rows="3"
									placeholder="Enter something about yourselft"></textarea>
							</div>


							<div class="form-group form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree tems and conditions</label>
							</div>

							<div class="container text-center" id="loader"
								style="display: none">
								<span class="fa fa-refresh fa-spin fa-3x"></span>
								<h4>Please wait....</h4>
							</div>
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded...")
			$('#reg-form').on('submit', function(event) {
				event.preventDefault();

				let form = new FormData(this);

				$("#submit-btn").hide();
				$("#loader").show();
				//send register sẻblet
				$.ajax({
					url : "RegisterServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data)

						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim()==='done')
							{
							
							
						
						swal("register successfully...we redirecting to login page")
						.then((value) => {
						  window.location = "login_page.jsp"
						});
						}else
							{
							swal(data)
							
							}
							
							

					},

					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR)
						$("#submit-btn").show();
						$("#loader").hide();
						swal("something went wrong..try again")

					},
					processData : false,
					contentType : false

				});

			});

		});
	</script>
</body>
</html>