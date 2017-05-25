#include <map>
#include <iostream>
#include <fstream>
#include <string>
#include <math.h>
#include <iomanip>
/*  Savanna Smith, 5/25/17
    File prints histogram of star magnitide data
    to check that it follows a gaussian distribution */
    
int main(){
 std::map<double, int> hist;
 std::ifstream input("star_loc.txt");
 double x,y,b;
 int rounded;
 if(input.is_open()){
   while(input>>x>>y>>b){
     rounded = trunc(b);
     if(b-rounded <= .3){
       ++hist[rounded];
     }
     else if(b-rounded >= .7){
       ++hist[rounded + 1];
     }
     else{
       ++hist[rounded+.5];
     }
   }
   input.close();
 }
 else std::cout << "Unable to open file" << std::endl;
 for(auto p: hist){
   std::cout << std::fixed << std::setprecision(1) << std::setw(2)
             << p.first << ' ' << std::string(p.second/10, '*') << '\n';
 }
 return 0;
}
