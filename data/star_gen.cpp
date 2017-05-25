#include <iostream>
#include <fstream>
#include <random>
#include <math.h>
#include <string>
/* Savanna Smith, 5/24/17
   Generate 9,096 of the visible star locations and magnitudes.
   Outputs file of star locations as data.
   */
using namespace std;

void genStars(int numStars, ofstream& writeTo){
  random_device rdTheta, rdPhi, rdMag; //seeds (change if entropy is an issue)
  mt19937 genTheta(rdTheta()), genPhi(rdPhi()), genMag(rdMag()); //random number generators
  uniform_real_distribution<> disTheta(0,M_PI); //theta can be anywhere between 0 and pi
  uniform_real_distribution<> disPhi(0,2*M_PI); //phi can be anywhere between 0 and 2pi
  normal_distribution<> disMag(8.5, 2); //mean magnitude = 8.5, std = 2
  for(int i = 0; i<numStars; i++){
    writeTo << disTheta(genTheta) << " " << disPhi(genPhi)  << " " << disMag(genMag) << endl;
  }
}

int main(){
  ofstream f;
  f.open("star_data.txt");
  genStars(9096, f);
  f.close();
  cout << "Star data complete!" << endl;
  return 0;
}
