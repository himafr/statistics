class Median {
  late List<double> _n;
  late int _rtba;
  Median({required nums, q=2}) {
    _n = nums;
    _n.sort();
    _rtba=_n.length ~/ q;
  }
  double getMed({int q=1}) {
    int n = _n.length;
    if (n % 2 == 0) {
      return (_n[(_rtba*q)-1] + _n[(_rtba*q)]) / 2;
    } else {
      return _n[_rtba];
      //+1 rtba
    }
  }
}
