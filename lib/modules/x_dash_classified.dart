class XDashClassified {
  late List<int> _fi;
  late List<double> _c;
  final List<double> _xi = [];
  late int _n;
  late int _sumOfN;
  XDashClassified({required nums, required fi}) {
    _c = nums;
    _fi = fi;
    _n = _fi.length;
    for (int i = 0; i < _n; i++) {
      _xi.add(((_c[i] + _c[i + 1]) / 2));
    }
    _sumOfN = _fi.reduce((a, b) => a + b);
  }
  double getXDash() {
    double sum = 0;
    for (int i = 0; i <= _n - 1; i++) {
      sum += _fi[i] * _xi[i];
    }
    return sum / _sumOfN;
  }
}
