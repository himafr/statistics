class ModeClassified {
  late List<double> _n;
  late List<int> _f;
  int _l = 0;
  int _index = 0;
  ModeClassified({required nums, required f}) {
    _n = nums;
    _f = f;
    _l = _f[1] - _f[0];
    _index = getIndex(f: _f);
  }
  double getMode() {
    int d1 = _f[_index] - _f[(_index - 1)];
    int d2 = _f[_index] - _f[(_index + 1)];
    double a = _n[_index];
    return (a + (d1 / (d1 + d2)) * _l);
  }

  int getIndex({required List<int> f}) {
    double result = 0;
    int index = 0;
    for (int i = 0; i < f.length; i++) {
      if (f[i] > result) {
        result = f[i].toDouble();
        index = i;
      }
    }
    return index;
  }
}
