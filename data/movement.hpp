#include <string>

class Movement {
  double      _thetaChange;
  double      _phiChange;
  std::string _name;
public:
  Movement(double tc, double pc, std::string name) {
    _thetaChange = tc; _phiChange = pc; _name = name;
  }
  //  _thetaChange(tc),
  //         _phiChange(pc), _speed(speed), _name(name){}
  double thetaChange() {return _thetaChange;}
  double phiChange() {return _phiChange;}
  std::string name() {return _name;}
};
