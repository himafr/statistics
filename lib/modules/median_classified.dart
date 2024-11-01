class MedianClassified {
  late List<double> _n;
  late List<int> _f;
  double _l = 0;
  double _rtba = 1;
  MedianClassified({required nums, required f, int q = 1}) {
    _n = nums;
    _f = repair(f);
    _l = _n[1] - _n[0];
    _rtba = _f[_f.length - 1] / q;
  }
  double getMed({int q = 1}) {
    for (int i = 0; i <= q; i++) {
      if (i == q) {
        int index = getIndex(f: _f, rtba: _rtba * q);
        int f1 = _f[index];
        int f2 = _f[index + 1];
        double a = _n[index];
        return (a + ((_rtba * q - f1) / (f2 - f1)) * _l);
      }
    }
    return 0;
  }

  List<int> repair(List<int> f) {
    f = [0, ...f];

    List<int> x = [];
    for (int i = 0; i < f.length; i++) {
      int result = 0;
      for (int j = 0; j <= i; j++) {
        result = result + f[j];
      }
      x.add(result);
    }
    return x;
  }

  int getIndex({required List<int> f, required double rtba}) {
    for (int i = 0; i < f.length-1; i++) {
      if (f[i] < rtba && rtba < f[i + 1]) {
        return i;
      }
    }
    return 0;
  }
}
