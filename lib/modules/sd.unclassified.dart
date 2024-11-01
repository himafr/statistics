import 'dart:math';
import './x_dash_unclassified.dart';

class SDUnclassified extends XDashUnclassified{
  late List<double> xi;
  SDUnclassified({required this.xi}):super(nums: xi);
  double getSD(){
    List<double> xxSquare=getXX();
    double sumXxSquare=xxSquare.reduce((a, b) => a + b);
    int n=xi.length;
    double variance=sqrt((sumXxSquare/n));
    return variance;
  }
  List<double> getXX(){
    double xDash=super.getXDash();
    List<double> res= xi.map((e) => (e-xDash).toDouble()).toList();
    List<double> result= res.map((e) => (e*e).toDouble()).toList();
    return result;
  }
}