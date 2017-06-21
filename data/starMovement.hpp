#ifndef __STARMOVEMENT_H
#define __STARMOVEMENT_H
#include <string>
#include <stdio.h>
#include <vector>
#include "movement.hpp"
#include <string>
#include <math.h>
#include <memory>
class StarMovement {
  std::vector<std::shared_ptr<Movement>> _movements; //for polymorphism
  //std::vector<Movement> _movements;
  int                   _currentIndex;
public:
  StarMovement(double factor){
      double tspeed = (M_PI/5) / factor;
      double pspeed = (M_PI/10) /factor;
    _movements.push_back(std::make_shared<Movement>(0,-1* pspeed,"left"));
    // _movements.push_back(std::make_shared<Movement>(0, pspeed, "right"));
    _movements.push_back(std::make_shared<Movement>(tspeed, 0, "up"));
    _movements.push_back(std::make_shared<Movement>(-1 * tspeed, 0, "down"));
    _movements.push_back(std::make_shared<Movement>(tspeed, pspeed, "diagonalplusplus"));
    // _movements.push_back(std::make_shared<Movement>(-1 * tspeed, -1 * pspeed, "diagonalminusminus"));
    // _movements.push_back(std::make_shared<Movement>(tspeed, -1 * pspeed, "diagonalplusminus"));
    // _movements.push_back(std::make_shared<Movement>(-1 * tspeed, pspeed, "diagonalminusminus"));
    // std::string name = "circular";
    // std::shared_ptr<Movement> m = std::make_shared<CirMovement>(0, 0, pspeed, name);
    // _movements.push_back(m);
    _currentIndex = 0;
  }
  void selectMovement(){
    int direction;
    std::cout << "How would you like to shift the stars?" << std::endl
         <<  "left:1\nright:2 \nup:3 \ndown:4 \ndiagonal++:5 \ndiagonal--:6 \ndiagonal+-:7 \ndiagonal-+:8 \ncircular:9" << std::endl;
    std::cin >> direction;
    while( direction > _movements.size() || direction < 1){
        std::cout << "Invalid Option. Select again: ";
        std::cin >> direction;
    }
    _currentIndex = direction-1;
  }
  double phiChange() {return _movements[_currentIndex]->phiChange();}
  double thetaChange() {return _movements[_currentIndex]->thetaChange();}
  std::string name() {return _movements[_currentIndex]->name();}
  void nextMovement(){
    _currentIndex++;
    if(_currentIndex == _movements.size()) _currentIndex = 0;
    std::cout << "Changing to movement " << _movements[_currentIndex]->name() << std::endl;
  }
  void moveStar(Star& s) {
    _movements[_currentIndex]->move(s);
  }
  int numDirections(){return _movements.size();}
};

#endif
