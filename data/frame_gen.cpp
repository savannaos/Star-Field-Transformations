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
#include <ctime>
/*  Savanna Smith, 5/25/17
    Generates sequential frames for star data */

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
void genFrame(const Container& stars, std::ofstream& writeTo){
  //double theta0 = M_PI/2 - M_PI/20;
  StarCoordBounds scb;
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

//Generates frames for the movement the user selects when prompted
template<typename Container>
void genOneMovement(int numFrames, int factor,Container& stars){
  StarMovement starMove(factor);
  starMove.selectMovement();
  std::string foldname = "frames/" + starMove.name() + std::to_string(factor);
  mkdir(foldname.c_str(), ACCESSPERMS);
  for(int i = 0; i < numFrames; i++){
    std::ofstream outFile; //could do from here to
    std::string fname =  foldname + "/frame" + std::to_string(i) + ".txt";
    outFile.open(fname.c_str()); //here all in genFrame and pass in the string
    genFrame(stars, outFile);
    outFile.close();
    moveStars(starMove, stars);
  }
}
//Cycles through all movements in the StarMovement object to create frames.
template<typename Container>
void genAllMovement(int numFrames, int factor,std::string& name, Container& stars){
  StarMovement starMove(factor);
  int totalFrames = numFrames * starMove.numDirections();
  std::string foldname = "frames/" + name + std::to_string(factor);
  mkdir(foldname.c_str(), ACCESSPERMS);
  for(int i = 0; i<totalFrames; i++){
    std::ofstream outFile;
    std::string fname = foldname + "/frame" + std::to_string(i) + ".txt";
    outFile.open(fname.c_str());
    genFrame(stars, outFile);
    outFile.close();
    if((i+1)%numFrames==0){
      // std::cout << i << " ";
      starMove.nextMovement();
    }
    moveStars(starMove,stars);
  }
}

template<typename c1, typename c2>
void genAllwithVariableSpeeds(int framesPerMvmt, c1& speeds, c2& stars){
  StarMovement starMove(framesPerMvmt, speeds);
  time_t t = time(0);
  tm *ltm = localtime(&t);
  std::string foldname = "frames/variable_speeds_" + std::to_string(ltm->tm_mon+1)
  + "-" + std::to_string(ltm->tm_mday) + "/";
  mkdir(foldname.c_str(), ACCESSPERMS);
  int count = 0;
  for(int i = 0; i < starMove.numDirections(); i++){
    for(int j = 0; j < starMove.duration(); j++){
      std::ofstream outFile;
      std::string fname = foldname + "/frame" + std::to_string(count) + ".txt";
      outFile.open(fname.c_str());
      genFrame(stars, outFile);
      moveStars(starMove,stars);
      count++;
    }
    starMove.nextMovement();
  }
}
template<typename Container>
void genVariablebyAlpha(StarMovement& starMove, Container& stars){
  time_t t = time(0);
  tm *ltm = localtime(&t);
  std::string foldname = "frames/move_by_alpha" + std::to_string(ltm->tm_mon+1)
  + "-" + std::to_string(ltm->tm_mday) + "/";
  mkdir(foldname.c_str(), ACCESSPERMS);
  for(int i = 0; i < starMove.numDirections(); i++){
    std::ofstream outFile;
    std::string fname = foldname + "/frame" + std::to_string(i) + ".txt";
    outFile.open(fname.c_str());
    genFrame(stars, outFile);
    moveStars(starMove, stars);
    starMove.nextMovement();
  }
}

int main(){
 using namespace std;
 vector<Star> stars;
 initStars(stars);
 StarMovement starMove(.004, 0, M_PI/320, M_PI/640, 0);
 std::cout << "number of frames = " << starMove.numDirections() << std::endl;
 genVariablebyAlpha(starMove, stars);
 // vector<int> v = {64, 128, 256};
 // int numFrames = 25;
 // genAllwithVariableSpeeds(numFrames, v, stars);
 // int speedFactor = 256;
 // std::string fname = "leftupdowndppspeed";
 // genAllMovement(numFrames, speedFactor, fname, stars);
 // genOneMovement(numFrames, speedFactor, stars);
 return 0;
}
