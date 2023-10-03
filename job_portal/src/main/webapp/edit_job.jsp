<%@page import="com.entity.Jobs"%>
<%@page import="com.dao.jobDAO"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Job</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						jobDAO dao = new jobDAO(DBConnect.getConn());
						Jobs j = dao.getJobById(id);
						%>

						<h5>Edit Jobs</h5>
					</div>
					<form action="update" method="post">

						<input type="hidden" value="<%=j.getId()%>" name="id">

						<div class="form-group">
							<label>Enter Company Name</label> <input type="text" name="title"
								required="required" class="form-control"
								value=" <%=j.getTitle()%> ">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Job Location</label> <select name="location"
									class="custom-select" id="inkib=neFormCustomSelectPref">
									<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
									<option valur="Pune">Pune</option>
									<option valur="Mumbai">Mumbai</option>
									<option valur="Delhi">Delhi</option>
									<option valur="Bangalore">Bangalore</option>
									<option valur="Chennai">Chennai</option>
									<option valur="Hyderabad">Hyderabad</option>
									<option valur="Ahmedabad">Ahmedabad</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Job Title</label> <select class="custom-select"
									id="inlineFormCustomSelectpref" name="category">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
									<option value="Java Developer">Java Developer</option>
									<option value="Mobile App Developer">Mobile App
										Developer</option>
									<option value="Game Developer">Game Developer</option>
									<option value="Web Developer">Web Developer</option>
									<option value="Full Stack Developer">Full Stack
										Developer</option>
									<option value="System Engineer">System Engineer</option>
									<option value="Hardware Engineer">Hardware Engineer</option>
									<option value="Data Scientist">Data Scientist</option>
									<option value="Data Analyst">Data Analyst</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Job Status</label> <select class="form-control"
									name="status">
									<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>Enter Job Description</label>
							<textarea required rows="6" cols="" name="desc"
								class="form-control"><%=j.getDescription()%></textarea>
						</div>
						<button class="btn btn-success">Update Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>