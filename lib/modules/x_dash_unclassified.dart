const List<int> a=[];
class XDashUnclassified {
  late List<double> _xi;
  late List<int> _fi;
  late int _n;
  XDashUnclassified({required nums, List<int> fi=a}) {
    _xi = nums;
    _fi =fi;
    _n = _xi.length;
  }
  double getXDash() {
    double varXi =_xi.reduce((value, element) => value + element);
    return varXi / _n;
  }

  double getXDashTimesFi() {
    int n = _fi.reduce((value, element) => value+element);
    print(n);
    double varXi = 0;
    for (int i = 0; i < _n; i++) {
      varXi = varXi + _xi[i] * _fi[i];
    }
    return varXi / n;
  }

  double getXDashWithW() {
    int w = _fi.reduce((value, element) => value + element);
    double varXw = 0;
    for (int i = 0; i < _n; i++) {
      varXw = varXw + _xi[i] * _fi[i];
    }
    return varXw / w;
  }
}
