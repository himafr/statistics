import './median_classified.dart';

class RangeClassified {
  late List<double> _nums;
  RangeClassified({required nums}) {
    _nums = nums;
  }
  double getRange() {
    double first = (_nums[1] + _nums[0]) / 2;
    double last = (_nums[_nums.length - 2] + _nums[_nums.length - 1]) / 2;
    return last - first;
  }
}

class SemiRangeClassified extends MedianClassified {
  final List<double> n;
  final List<int> f;
  SemiRangeClassified({required this.n, required this.f})
      : super(nums: n, f: f, q: 4);
  double getSemiRange() {
    double range = (super.getMed(q: 3) - super.getMed(q: 1)) / 2;
    return range;
  }
}
