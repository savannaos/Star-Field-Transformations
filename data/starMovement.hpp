#ifndef __STARMOVEMENT_H
#define __STARMOVEMENT_H
#include <string>
#include <stdio.h>
#include <vector>
#include "movement.hpp"
#include <string>
class StarMovement {
  std::vector<Movement> _movements;
  int                   _currentIndex;
public:
  StarMovement(double speed){
    _movements.push_back(Movement(0,-1* speed, speed, "left"));
    _movements.push_back(Movement(0, speed, speed, "right"));
    _movements.push_back(Movement(speed, 0, speed, "up"));
    _movements.push_back(Movement(-1 * speed, 0, speed, "down"));
    _movements.push_back(Movement(speed, speed, speed, "diagonalplusplus"));
    _movements.push_back(Movement(-1 * speed, -1 * speed, speed, "diagonalminusminus"));
    _movements.push_back(Movement(speed, -1 * speed, speed, "diagonalplusminus"));
    _movements.push_back(Movement (-1 * speed, speed, speed, "diagonalminusminus"));
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
  double speed() {return _movements[_currentIndex].speed();}
};

#endif
