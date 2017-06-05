#include <iostream>
#include <fstream>
#include <math.h>
#include <iomanip>
#include <string>
#include "star.hpp"
#include "starCoordBounds.hpp"
#include "starMovement.hpp"
#include <vector>
#include <sys/stat.h>
/*  Savanna Smith, 5/25/17
    Generates frames for star data */

/* read each line of input file and generates star object*/
template<typename Container>
void initStars(Container& stars){
  std::ifstream input("star_data.txt");
  double theta,phi,mag;
  if(input.is_open()){
    while(input>>theta>>phi>>mag){ //for all input
      Star s; s.theta = theta; s.phi = phi; s.mag = mag; //initialize star
      stars.push_back(s); //put into stars dicitonary
    }
    input.close();
  }
  else std::cout << "Unable to open file" << std::endl;
}

/* generate and writes frames to file */
template<typename Container>
void genFrame(StarCoordBounds& scb, const Container& stars, std::ofstream& writeTo){
  //double theta0 = M_PI/2 - M_PI/20;
  for(const auto &s: stars){
    if(s.theta >= scb.minTheta() && s.theta <= scb.maxTheta() &&
       s.phi >= scb.minPhi() && s.phi <= scb.maxPhi()){
         writeTo << s.theta << " " << s.phi
                 << " " << s.mag << std::endl;
       }
  }
}
//Shift all of the stars
template<typename Container>
void moveStars(double thetaChange, double phiChange, Container& stars){
  for(auto &s: stars){
    s.theta = s.theta + thetaChange;
    s.phi = s.phi + phiChange;
    if(s.theta > ( 2 * M_PI)){ //we reached the end, loop back
      s.theta = s.theta - ( 2 * M_PI);
    }
    if(s.phi > ( 2 * M_PI)){ //we reached the end, loop back
      s.phi = s.phi - ( 2 * M_PI);
    }
    //should also check < 0
  }
}

int main(){
 using namespace std;
 vector<Star> stars;
 initStars(stars);
 int numFrames = 20;
 StarMovement starMove;
 StarCoordBounds coordBounds;
 // struct stat info;
 // if(!(stat(starMove.subFolder(),&info)==0 && S_ISDIR(info.st_mode))){
 //   //directory doesn't exit, create it
 //   mkdir("frames/starMove.subFolder()");
 // }
 for(int i = 0; i < numFrames; i++){
   std::ofstream outFile;
   std::string fname = "frames/" + starMove.subFolder() + "frame" + std::to_string(i) + ".txt";
   outFile.open(fname.c_str());
   genFrame(coordBounds, stars, outFile);
   outFile.close();
   moveStars(starMove.thetaChange(), starMove.phiChange(), stars);
 }
 return 0;
}
