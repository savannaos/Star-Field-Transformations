#include <map>
#include <iostream>
#include <fstream>
#include <math.h>
#include <iomanip>
#include "star.hpp"
/*  Savanna Smith, 5/25/17
    Generates first frame */

/* read each line of input file and generate star object*/
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
  - phi between zero and dphi */
void genFrame(double dphi, const std::map<double, Star>& starDict){
  double dTheta = M_PI/10;
  double minTheta = M_PI/2 - (dTheta/2);
  double maxTheta = M_PI/2 + (dTheta/2);
  std::cout << "Showing stars with theta between "<< minTheta << " and "
            << maxTheta << " for phi between 0 and " << dphi << std::endl;
  for(auto p: starDict){
    if(p.second.theta >= minTheta && p.second.theta <= maxTheta &&
       p.second.phi >= 0 && p.second.phi <= dphi){
         std::cout << p.second.theta << " " << p.second.phi
                   << " " << p.second.mag << std::endl;
       }
  }
}

int main(){
 std::map<double, Star> starDict;
 initStars(starDict);
 double dphi = M_PI/10;
 genFrame(dphi, starDict);
 return 0;
}
