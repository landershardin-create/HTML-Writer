package body Dashboard_Session is
   Current_User : String := "";
   Current_Token : String := "";

   procedure Initialize (Username : String; Token : String) is
   begin
      Current_User := Username;
      Current_Token := Token;
   end Initialize;

   function Get_Username return String is
   begin
      return Current_User;
   end Get_Username;

   function Get_Token return String is
   begin
      return Current_Token;
   end Get_Token;

   procedure Clear is
   begin
      Current_User := "";
      Current_Token := "";
   end Clear;
end Dashboard_Session;