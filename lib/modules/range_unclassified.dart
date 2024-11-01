import 'median_unclassified.dart';

class RangeUnclassified {
  late List<double> _nums;
  RangeUnclassified({required nums}) {
    _nums = nums;
    _nums.sort();
  }
  double getRange() {
    return _nums[_nums.length - 1] - _nums[0];
  }
}

class SemiRangeUnclassified extends Median {
  final List<double> n;
  SemiRangeUnclassified({required this.n}) : super(nums: n, q: 4);
  double getSemiRange() {
    double range = (super.getMed(q: 3) - super.getMed(q: 1)) / 2;
    return range;
  }
}
