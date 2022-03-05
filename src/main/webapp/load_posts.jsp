<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDAO"%>
<div class="row">
	<%
	Thread.sleep(850);
	PostDAO dao = new PostDAO(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> list = null;
	if (cid == 0) {
		list = dao.getAllPosts();
	} else {
		list = dao.getByCatId(cid);
	}

	if (list.size() == 0) {
		out.println("<h3 class='display-4 text-center'>No post in this category...</h3>");
	}
	for (Post posts : list) {
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img src="blog_pics/<%=posts.getpPic()%>" class="card-img-top"
				alt="..." style="height: 210px; width: 100%">
			<div class="card-body">
				<b><%=posts.getpTitle()%></b>
				<p><%=posts.getpContent()%></p>
				<pre><%=posts.getpCode()%></pre>

			</div>
			<div class="card-footer text-center bg-primary">
			<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span>10</span></i></a>
			<a href="show_blog_page.jsp?post_id=<%=posts.getPid() %>" class="btn btn-outline-light btn-sm">Read More</a>
			<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>10</span></i></a>
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>