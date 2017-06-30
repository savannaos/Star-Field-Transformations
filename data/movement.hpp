#include <string>
class Movement {
protected:
  double      _thetaChange;
  double      _phiChange;
  double      _rotation;
  int         _duration;
  std::string _name;
public:
  Movement(double tc, double pc, std::string name) {
    _thetaChange = tc; _phiChange = pc; _name = name; _rotation = 0;
    _duration = 1;
  }
  Movement(double tc, double pc, std::string name, int dur){
    _thetaChange = tc; _phiChange = pc; _name = name; _rotation = 0;
    _duration = dur;
  }

  double thetaChange() {return _thetaChange;}
  double phiChange() {return _phiChange;}
  std::string name() {return _name;}
  virtual void move(Star& s) {
    s.theta += _thetaChange;
    s.phi += _phiChange;
    if(s.theta > ( 2 * M_PI)){ //we reached the end, loop back
      s.theta = s.theta - ( 2 * M_PI);
    }
    if(s.phi > ( 2 * M_PI)){ //we reached the end, loop back
      s.phi = s.phi - ( 2 * M_PI);
    }
    if(s.theta < 0){
      s.theta = s.theta + 2* M_PI;
    }
    if(s.phi < 0){
      s.phi = s.phi + 2* M_PI;
    }
  }
};

class CirMovement : public Movement, public StarCoordBounds {
public:
  CirMovement(double tc, double pc, double rot, std::string& name) : Movement(tc, pc, name) {
    _rotation = rot;
  }
  void move(Star& s){
    double cx = this->midx();
    double cy = this->midy();
    double xdiff = s.theta - cx;
    double ydiff = s.phi - cy;
    double theta = _rotation;
    double x = ((cos(theta) * xdiff) - (sin(theta) * ydiff)) + cx;
    double y = ((sin(theta) * xdiff) + (cos(theta) * ydiff)) + cy;
    // std::cout << "theta: " << s.theta << " phi: " << s.phi
    //  << " xdiff: " << xdiff << " ydiff: " << ydiff << " computedx: " << x << " computedy: " << y << std::endl;
    if(x > ( 2 * M_PI)){ x -= ( 2 * M_PI);}
    if(y > ( 2 * M_PI)){ y -= ( 2 * M_PI);}
    if(x < 0){           x += 2* M_PI;}
    if(y < 0){           y += 2* M_PI;}
    s.theta = x;
    s.phi = y;
//    std::cout << "x: " << x << " y: " << y << std::endl;
  }
};
