#include <map>
#include <iostream>
#include <fstream>
#include <math.h>
#include <iomanip>
#include <string>
#include "star.hpp"
/*  Savanna Smith, 5/25/17
    Generates frames for star data */

/* read each line of input file and generate star object to save in dictionary*/
void initStars(std::map<double, Star>& starDict){
  std::ifstream input("star_data.txt");
  double theta,phi,mag;
  if(input.is_open()){
    while(input>>theta>>phi>>mag){ //as long as there's input
      Star s; s.theta = theta; s.phi = phi; s.mag = mag;
      starDict[phi] = s;
    }
    input.close();
  }
  else std::cout << "Unable to open file" << std::endl;
}

/* generate frame for stars with:
  - theta between (pi/2)-(dtheta/2) and (pi/2)+(dtheta/2)
  - phi first between minPhi and minPhi + dphi*/
void genFrame(double minPhi, const std::map<double, Star>& starDict, std::ofstream& writeTo){
  double dTheta = M_PI/10, dPhi = M_PI/10;
  double minTheta = M_PI/2 - (dTheta/2);
  double maxTheta = M_PI/2 + (dTheta/2);
  double maxPhi   = minPhi + dPhi;
  //writeTo << "Showing stars with theta between "<< minTheta << " and "
  //          << maxTheta << " for phi between " << minPhi << " and " << maxPhi << std::endl;
  for(auto p: starDict){
    if(p.first > maxPhi) return; //since sorted by phi don't look at anything above max
    if(p.second.theta >= minTheta && p.second.theta <= maxTheta &&
       p.second.phi >= minPhi && p.second.phi <= maxPhi){
         writeTo << p.second.theta << " " << p.second.phi
                   << " " << p.second.mag << std::endl;
       }
  }
}

int main(){
 std::map<double, Star> starDict;
 initStars(starDict);
 double minPhi = 0;
 for(int i = 0; i < 20; i++){
   std::ofstream outFile;
   std::string fname = "frames/frame" + std::to_string(i) + ".txt";
   outFile.open(fname.c_str());
   genFrame(minPhi, starDict, outFile);
   minPhi += M_PI/100; //increment phi window
   outFile.close();
 }
 return 0;
}
