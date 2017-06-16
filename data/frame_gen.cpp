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
void moveStars(StarMovement& starMove, Container& stars){
  for(auto &s: stars){
    starMove.moveStar(s);
  }
}
template<typename Container>
void genOneMovement(int numFrames, int factor, StarCoordBounds& coordBounds,Container& stars){
  StarMovement starMove(factor);
  starMove.selectMovement();
  for(int i = 0; i < numFrames; i++){
    std::ofstream outFile;
    std::string foldname = "frames/" + starMove.name() + std::to_string(factor);
    mkdir(foldname.c_str(), ACCESSPERMS);
    std::string fname =  foldname + "/frame" + std::to_string(i) + ".txt";
    outFile.open(fname.c_str());
    genFrame(coordBounds, stars, outFile);
    outFile.close();
//    std::cout << starMove.thetaChange() << " " << starMove.phiChange() << std::endl;
//    moveStars(starMove.thetaChange(), starMove.phiChange(), stars);
    moveStars(starMove, stars);
  }
}

template<typename Container>
void genAllMovement(int numFrames, int factor,StarCoordBounds& coordBounds,Container& stars){
  StarMovement starMove(factor);
  int totalFrames = numFrames * starMove.numDirections();
  for(int i = 0; i<totalFrames; i++){
    std::ofstream outFile;
    std::string fname = "frames/allspeed" + std::to_string(factor) + "/frame" + std::to_string(i) + ".txt";
    outFile.open(fname.c_str());
    genFrame(coordBounds, stars, outFile);
    outFile.close();
    moveStars(starMove.thetaChange(), starMove.phiChange(), stars);
    if(i%numFrames==0) starMove.nextMovement();
  }
}

int main(){
 using namespace std;
 vector<Star> stars;
 initStars(stars);
 StarCoordBounds sc;
 int numFrames = 100;
 int speedFactor = 256; //for 8px/s
 //genAllMovement(numFrames, speedFactor, sc, stars);
 genOneMovement(numFrames, speedFactor, sc, stars);
 return 0;
}
