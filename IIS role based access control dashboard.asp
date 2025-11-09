<%@ Language=VBScript %>
<%
If Session("username") = "" Then
    Response.Redirect "secure_login.asp"
End If

user = Session("username")
role = Session("role")
%>
<html>
<head><title>Dashboard</title></head>
<body>
    <h2>Welcome, <%= user %>!</h2>
    <p>Your role: <strong><%= role %></strong></p>

    <% If role = "admin" Then %>
        <p><a href="admin_panel.asp">Go to Admin Panel</a></p>
    <% End If %>

    <% If role = "editor" Or role = "admin" Then %>
        <p><a href="edit_content.asp">Edit Content</a></p>
    <% End If %>

    <p><a href="view_content.asp">View Content</a></p>
    <p><a href="logout.asp">Logout</a></p>
</body>
</html>
