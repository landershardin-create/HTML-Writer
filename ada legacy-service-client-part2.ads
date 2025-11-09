package body Legacy_Service_Client is
   use Ada.Text_IO;

   procedure Fetch_Dashboard_Data is
      Token : String := Dashboard_Session.Get_Token;
      -- Simulate HTTP GET with token
      Response : String := "mock_dashboard_data"; -- Replace with real HTTP call
   begin
      Put_Line ("Fetching dashboard data with token: " & Token);
      Put_Line ("Response: " & Response);
   end Fetch_Dashboard_Data;
end Legacy_Service_Client;