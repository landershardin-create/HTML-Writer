package Dashboard_Session is
   procedure Initialize (Username : String; Token : String);
   function Get_Username return String;
   function Get_Token return String;
   procedure Clear;
end Dashboard_Session;