#ifndef __STARMOVEMENT_H
#define __STARMOVEMENT_H
#include <string>
#include <stdio.h>
#include <vector>
#include "movement.hpp"
#include <string>
#include <math.h>
class StarMovement {
  std::vector<Movement> _movements;
  int                   _currentIndex;
public:
  StarMovement(double factor){
      double tspeed = (M_PI/5) / factor;
      double pspeed = (M_PI/10) /factor;
    _movements.push_back(Movement(0,-1* pspeed,"left"));
    _movements.push_back(Movement(0, pspeed, "right"));
    _movements.push_back(Movement(tspeed, 0, "up"));
    _movements.push_back(Movement(-1 * tspeed, 0, "down"));
    _movements.push_back(Movement(tspeed, pspeed, "diagonalplusplus"));
    _movements.push_back(Movement(-1 * tspeed, -1 * pspeed, "diagonalminusminus"));
    _movements.push_back(Movement(tspeed, -1 * pspeed, "diagonalplusminus"));
    _movements.push_back(Movement (-1 * tspeed, pspeed, "diagonalminusminus"));
    _currentIndex = 0;
  }
  void selectMovement(){
    int direction;
    std::cout << "How would you like to shift the stars?" << std::endl
         <<  "left:1\nright:2 \nup:3 \ndown:4 \ndiagonal++:5 \ndiagonal--:6 \ndiagonal+-:7 \ndiagonal-+:8" << std::endl;
    std::cin >> direction;
    while( direction >= _movements.size()){
        std::cout << "Invalid Option. Select again: ";
        std::cin >> direction;
    }
    _currentIndex = direction;
  }
  double phiChange() {return _movements[_currentIndex].phiChange();}
  double thetaChange() {return _movements[_currentIndex].thetaChange();}
  std::string name() {return _movements[_currentIndex].name();}
  void nextMovement(){_currentIndex++;}
  int numDirections(){return _movements.size();}
};

#endif
