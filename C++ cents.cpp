#include <iostream>
#include <iomanip>
using namespace std;

int main()

{    
    float usdollar_amt;    

        cout << "NOTE: If you want to enter a dollar amount, use a whole number of 1 or greater. "        

     << "To enter cents, please use a decimal value." << endl;    

cout << "Enter US dollar amount: ";    
cin >> usdollar_amt;    

if ((usdollar_amt > 0.0) && (usdollar_amt <= 0.99))    
    {        
        cout << fixed <<setprecision(2)
 << usdollar_amt << "¢" << endl;
    }    
else    
    {        
        cout << fixed << setprecision(2) << "$" << usdollar_amt << endl;  
  }    

return 0;}
