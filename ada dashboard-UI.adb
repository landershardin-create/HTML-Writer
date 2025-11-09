with Ada.Text_IO; use Ada.Text_IO;
with Auth_Token_Manager;
with Dashboard_Session;
with Legacy_Service_Client;

procedure Dashboard_UI is
   Username : String;
   Password : String;
   Token    : String;
begin
   Put_Line ("Enter username:");
   Get_Line (Username);
   Put_Line ("Enter password:");
   Get_Line (Password);

   Auth_Token_Manager.Login (Username, Password);
   Token := Auth_Token_Manager.Get_Token;

   if Token /= "" then
      Dashboard_Session.Initialize (Username, Token);
      Legacy_Service_Client.Fetch_Dashboard_Data;
   else
      Put_Line ("Login failed.");
   end if;
end Dashboard_UI;