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
  /* Generates the sequences of movements to move the stars by.
     May move the Star s by the current movement by calling moveStar(s). */

  std::vector<std::shared_ptr<Movement>> _movements; //for polymorphism
  int                   _currentIndex;
public:
  StarMovement(double factor){
  /* Interested in distinct movements*/
      double tspeed = (M_PI/5) / factor;
      double pspeed = (M_PI/10) /factor;
    _movements.push_back(std::make_shared<Movement>(0,-1* pspeed,"left"));
    _movements.push_back(std::make_shared<Movement>(0, pspeed, "right"));
    _movements.push_back(std::make_shared<Movement>(tspeed, 0, "up"));
    _movements.push_back(std::make_shared<Movement>(-1 * tspeed, 0, "down"));
    _movements.push_back(std::make_shared<Movement>(tspeed, pspeed, "diagonalplusplus"));
    _movements.push_back(std::make_shared<Movement>(-1 * tspeed, -1 * pspeed, "diagonalminusminus"));
    _movements.push_back(std::make_shared<Movement>(tspeed, -1 * pspeed, "diagonalplusminus"));
    _movements.push_back(std::make_shared<Movement>(-1 * tspeed, pspeed, "diagonalminusminus"));
    std::string name = "circular";
    std::shared_ptr<Movement> m = std::make_shared<CirMovement>(0, 0, pspeed, name);
    _movements.push_back(m);
    _currentIndex = 0;
  }

  double advanceByAlpha(double alpha, double curr, double start, double target){
    /* move from curr to target by alpha percent*/
    double diff = abs(target - start);
    if(target==0){
      if(start>0 && curr>0)      curr -= (diff * alpha); //pos to 0
      else if(start<0 && curr<0) curr += (diff * alpha); //neg to 0
    }
    else {
      if(start < target && curr <target)       curr += (diff * alpha); //increasing
      else if(start > target && curr >target) curr -= (diff * alpha); //decreasing
    }
    //avoid doubles comparision issues
    double epsilon = .0001;
    if((curr > target && curr<target+epsilon) || curr < target && curr > target-epsilon) {
      curr = target;
    }
    return curr;
  }

  StarMovement(double alpha, double startx, double endx, double starty, double endy){
      /* interested in continuous movements:
      stars the move from movement vector start->end by a factor of alpha at a time*/
      double x = startx, y = starty;
      bool updating = true;
      while(updating){
        double prevx = x, prevy = y;
//        std::cout << "x: " << x << " y: " << y << std::endl;
        _movements.push_back(std::make_shared<Movement>(x, y, 1));
        x = advanceByAlpha(alpha, x, startx, endx);
        y = advanceByAlpha(alpha, y, starty, endy);
        if(prevx == x && prevy == y) updating = false;
      }
      _currentIndex = 0;
  }

  StarMovement(int nframesPer, std::vector<int>& speeds){
    /* interested in starting with the number of frames per direction and speeds.
    Example: nframesPer = 25, speeds = [5, 10, 50]. Then, each direction gets 25
       frames, 8 at which are speed 5, 8 at speed 10, and 9 at speed 50. */
    int n = speeds.size();
    if(n > nframesPer){
      std::cout << "Error: Cannot have more speeds than the number of frames. "
                << "Changing number of frames to the number of speeds."
                <<std::endl;
      nframesPer = n;
    }
    double d = (1.0 * nframesPer)/n;
    std::vector<int> durs;
    for(int i=0; i < n-1; i++) durs.push_back(floor(d));
    if(nframesPer%n!=0)        durs.push_back(ceil(d));
    else                       durs.push_back(floor(d));
    for(int i = 0; i<n; i++){
      double tspeed = (M_PI/5) / speeds[i];
      double pspeed = (M_PI/10) /speeds[i];
      _movements.push_back(std::make_shared<Movement>(0,-1* pspeed,"left", durs[i]));
      _movements.push_back(std::make_shared<Movement>(0, pspeed,"right", durs[i]));
      _movements.push_back(std::make_shared<Movement>(tspeed, 0,"up", durs[i]));
      _movements.push_back(std::make_shared<Movement>(-1 * tspeed, 0,"down", durs[i]));
      _movements.push_back(std::make_shared<Movement>(tspeed, pspeed,
        "diagonalplusplus", durs[i]));
      _movements.push_back(std::make_shared<Movement>(-1 * tspeed, -1 * pspeed,
        "diagonalminusminus", durs[i]));
      _movements.push_back(std::make_shared<Movement>(tspeed, -1 * pspeed,
        "diagonalplusminus", durs[i]));
      _movements.push_back(std::make_shared<Movement>(-1 * tspeed, pspeed,
        "diagonalminusminus", durs[i]));
    }
    _currentIndex = 0;
  }

  void selectMovement(){
    /* prompts user to select the movement */
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
  int    duration()    {return _movements[_currentIndex]->duration();}
  std::string name() {return _movements[_currentIndex]->name();}
  void nextMovement(){ /* increments index of movement vector we're on */
    _currentIndex++;
    if(_currentIndex == _movements.size()) _currentIndex = 0;
  }
  void moveStar(Star& s) { /* move star by current Movement*/
    _movements[_currentIndex]->move(s);
  }
  int numDirections(){return _movements.size();}
};

#endif
