#ifndef __starCoordBounds_H
#define __starCoordBounds_H
#include <math.h>
/* Savanna Smith, 6/5/17
   Holds star's coordinates statistics */
class StarCoordBounds {
  double thetaLow;
  double thetaHigh;
  double phiLow;
  double phiHigh;
  double dTheta;
  double dPhi;
  double xc;
  double yc;
public:
  StarCoordBounds(){ //default parameters
    dTheta = M_PI/10;
    dPhi = M_PI/10;
    thetaLow = M_PI/2 - (dTheta/2);
    thetaHigh = M_PI/2 + (dTheta/2);
    phiLow = 0;
    phiHigh  = dPhi;
    yc = (phiLow + phiHigh) / 2;
    xc = (thetaLow + thetaHigh) / 2;
  }
  StarCoordBounds(double tl, double th, double pl, double ph,
                  double dt, double dp) : thetaLow(tl), thetaHigh(th),
                  phiLow(pl), phiHigh(ph), dTheta(dt), dPhi(dp) {}
  ~StarCoordBounds(){}
  double minTheta() {return thetaLow;}
  double maxTheta() {return thetaHigh;}
  double minPhi()   {return phiLow;}
  double maxPhi()   {return phiHigh;}
  double midx ()    {return xc;}
  double midy ()    {return yc;}
};

#endif
