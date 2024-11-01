import 'dart:math';
import './x_dash_classified.dart';

class SDClassified extends XDashClassified {
  late List<double> xi;
  late List<int> fi;
  SDClassified({required this.xi, required this.fi}) : super(nums: xi, fi: fi);
  getSD() {
    List<double> x2f = getX2F();
    List<double> xf = getXF();
    double sumX2f = x2f.reduce((a, b) => a + b);
    double sumXf = xf.reduce((a, b) => a + b);
    int sumF = fi.reduce((a, b) => a + b);
    double variance = sqrt((sumX2f - (sumXf * sumXf) / sumF) / sumF);
    return variance;
  }

  List<double> getXX() {
    List<double> result = [];
    for (int i = 0; i < xi.length - 1; i++) {
      result.add((xi[i] + xi[i + 1]) / 2);
    }
    return result;
  }

  List<double> getXF() {
    List<double> x = getXX();
    List<double> result = [];
    for (int i = 0; i < xi.length - 1; i++) {
      result.add((x[i] * fi[i]));
    }
    return result;
  }

  List<double> getX2F() {
    List<double> x = getXX();
    List<double> result = [];
    for (int i = 0; i < xi.length - 1; i++) {
      result.add((x[i] * x[i] * fi[i]));
    }
    return result;
  }
}
