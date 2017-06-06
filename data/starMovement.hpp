#ifndef __STARMOVEMENT_H
#define __STARMOVEMENT_H
#include <string>
#include <stdio.h>
class StarMovement {
  double _phiChange;
  double _thetaChange;
  std::string _subFolder;
  double _speed;
  double _speedFactor;
public:
  StarMovement(){
    int direction;
    _speed = M_PI/10;
    std::cout << "Speed is " << _speed << ". Enter Factor to divide it by: ";
    std::cin >> _speedFactor;
    _speed = _speed / _speedFactor;
    std::cout << "How would you like to shift the stars?" << std::endl
         <<  "left:1\nright:2 \nup:3 \ndown:4 \ndiagonal++:5 \ndiagonal--:6 \ndiagonal+-:7 \ndiagonal-+:8" << std::endl;
    std::cin >> direction;
    switch(direction){
      case 1 : {
        _thetaChange = 0;
        _phiChange = -1 * _speed;
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
        _thetaChange = _speed;
        _phiChange = 0;
        _subFolder = "up/";
        break;
      }
      case 4 : {
        _thetaChange = -1 * _speed;
        _phiChange = 0;
        _subFolder = "down/";
        break;
      }
      case 5 : {
        _thetaChange = _speed;
        _phiChange = _speed;
        _subFolder = "diagonalplusplus/";
        break;
      }
      case 6 : {
        _thetaChange = -1 * _speed;
        _phiChange = -1 * _speed;
        _subFolder = "diagonalminusminus/";
        break;
      }
      case 7 : {
        _thetaChange = _speed;
        _phiChange = -1 * _speed;
        _subFolder = "diagonalplusminus/";
        break;
      }
      case 8 : {
        _thetaChange = -1 * _speed;
        _phiChange = _speed;
        _subFolder = "diagonalminusplus/";
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
  double speedFactor() {return _speedFactor;}

};

#endif
