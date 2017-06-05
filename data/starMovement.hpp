#ifndef __STARMOVEMENT_H
#define __STARMOVEMENT_H
#include <string>
class StarMovement {
  double _phiChange;
  double _thetaChange;
  std::string _subFolder;
  double _speed;
public:
  StarMovement(){
    int direction;
    std::cout << "How would you like to shift the stars?" << std::endl
         <<  "left:1\nright:2 \nup:3 \ndown:4" << std::endl;
    std::cin >> direction;
    _speed = M_PI/100;
    switch(direction){
      case 1 : {
        _thetaChange = 0;
        _phiChange = _speed;
        _subFolder = "left/";
        break;
      }
      case 2: {
        _thetaChange = 0;
        _phiChange = _speed;
        _subFolder = "right/";
        break;
      }
      case 3: {
        _thetaChange = 0;
        _phiChange = _speed;
        _subFolder = "up/";
        break;
      }
      case 4 : {
        _thetaChange = 0;
        _phiChange = _speed;
        _subFolder = "down/";
        break;
      }
      default : {
        std::cout << "Invalid Option. Default will be right-ward movement"
                  << std::endl;
        _thetaChange = 0;
        _phiChange = _speed;
        _subFolder = "right/";
        break;
      }
    }
  }
  StarMovement(double pc, double tc, double speed, std::string& sf) : _phiChange(pc), _thetaChange(tc), _speed(speed),_subFolder(sf) {}
  double phiChange() {return _phiChange;}
  double thetaChange() {return _thetaChange;}
  std::string subFolder() {return _subFolder;}

};

#endif
