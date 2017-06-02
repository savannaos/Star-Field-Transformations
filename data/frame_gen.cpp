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
    while(input>>theta>>phi>>mag){ //for all input
      Star s; s.theta = theta; s.phi = phi; s.mag = mag; //initialize star
      starDict[phi] = s; //put into stars dicitonary
    }
    input.close();
  }
  else std::cout << "Unable to open file" << std::endl;
}

/* generate frame for stars with:
  - theta between (pi/2)-(dtheta/2) and (pi/2)+(dtheta/2)
  - phi between 0 and dphi*/
void genFrame(const std::map<double, Star>& starDict, std::ofstream& writeTo){
  double dTheta = M_PI/10, dPhi = M_PI/10;
  double minTheta = M_PI/2 - (dTheta/2);
  double maxTheta = M_PI/2 + (dTheta/2);
  double minPhi = 0;
  double maxPhi  = dPhi;
  double theta0 = M_PI/2 - M_PI/20;
  for(const auto &p: starDict){
  //  if(p.first > maxPhi) return; //since sorted by phi don't look at anything above max
    if(p.second.theta >= minTheta && p.second.theta <= maxTheta &&
       p.second.phi >= minPhi && p.second.phi <= maxPhi){
         writeTo << p.second.theta << " " << p.second.phi
                   << " " << p.second.mag << std::endl;
       }
  }
}
//changes the phi values of all the stars
void moveStars(std::map<double,Star>& starDict){
  for(auto &p: starDict){
    p.second.phi = p.second.phi + M_PI/100;
    if(p.second.phi > ( 2 * M_PI)){ //we reached the end, loop back
      p.second.phi = p.second.phi - ( 2 * M_PI);
    }
  }
}

int main(){
 std::map<double, Star> starDict;
 initStars(starDict);
 int numFrames = 20;
 for(int i = 0; i < numFrames; i++){
   std::ofstream outFile;
   std::string fname = "frames/frame" + std::to_string(i) + ".txt";
   outFile.open(fname.c_str());
   genFrame(starDict, outFile);
   outFile.close();
   moveStars(starDict);
 }
 std::map<double,int> hist;
 double rounded;
 double x;
 for(const auto &p: starDict){
    x = p.second.phi;
  //  rounded = round(theta * 100.0) / 100.0;
//   std::cout << x << std::endl;
  //  ++hist[rounded];
 }

 // for(auto p: hist){
 //   std::cout << std::fixed << std::setprecision(3) << std::setw(2)
 //             << p.first << ' ' << std::string(p.second/10, '*') << '\n';
 // }
 return 0;
}
