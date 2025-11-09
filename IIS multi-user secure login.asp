<%@ Language=VBScript %>
<%
' --- User Database (for demo purposes) ---
Dim users
Set users = Server.CreateObject("Scripting.Dictionary")
users.Add "admin", Array("secure123", "admin")
users.Add "editor", Array("edit456", "editor")
users.Add "viewer", Array("view789", "viewer")

' --- Input Sanitization ---
Function Sanitize(input)
    Sanitize = Replace(Server.HTMLEncode(input), "'", "''")
End Function

' --- Authentication ---
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    user = Sanitize(Request.Form("username"))
    pass = Sanitize(Request.Form("password"))

    If users.Exists(user) Then
        storedPass = users(user)(0)
        role = users(user)(1)

        If pass = storedPass Then
            Session("username") = user
            Session("role") = role
            Response.Redirect "dashboard.asp"
        Else
            Response.Write "<h3>Invalid password.</h3>"
        End If
    Else
        Response.Write "<h3>User not found.</h3>"
    End If
End If
%>
<html>
<head><title>Login</title></head>
<body>
    <h2>Secure Login</h2>
    <form method="post" action="secure_login.asp">
        Username: <input type="text" name="username" /><br />
        Password: <input type="password" name="password" /><br />
        <input type="submit" value="Login" />
    </form>
</body>
</html>
