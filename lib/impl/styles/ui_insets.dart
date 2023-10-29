import 'package:flutter/material.dart';

const _kBaseInset = 8.0;

class UIBaseInset {
  static double times(int times, {double base = _kBaseInset}) {
    return base * times;
  }

  static double quarter({double value = _kBaseInset}) {
    return value / 4;
  }

  static double half({double value = _kBaseInset}) {
    return value / 2;
  }

  static double addQuarter(double value) {
    return value + quarter();
  }

  static double addHalf(double value, [double base = _kBaseInset]) {
    return value + half(value: base);
  }
}

/// Insets mark the base spacing of elements based.
/// Front kick uses 8 as the base inset.
class UIInsets {
  /// Everything is within the insets are calculated from this value
  ///
  /// Base inset = 8
  static double base = _kBaseInset;

  /// Half of the base inset
  ///
  /// 8 / 2 = 4
  static double half = UIBaseInset.half();

  /// A quarter of the [baseInset]
  ///
  /// 8 / 4 = 2
  static double quarter = UIBaseInset.quarter();

  /// [baseInset] multiplied by 2
  ///
  /// 8 x 2 = 16
  static double x2 = UIBaseInset.times(2);

  /// [baseInset] multiplied by 3
  ///
  /// 8 x 3 = 24
  static double x3 = UIBaseInset.times(3);

  /// [baseInset] multiplied by 4
  ///
  /// 8 x 4 = 32
  static double x4 = UIBaseInset.times(4);

  /// [baseInset] multiplied by 5
  ///
  /// 8 x 5 = 40
  static double x5 = UIBaseInset.times(5);

  /// [baseInset] multiplied by 6
  ///
  /// 8 x 6 = 48
  static double x6 = UIBaseInset.times(6);

  /// Adds [quarter] to [base] multiplied by [x]
  ///
  /// (8 x 2) + (8 / 4) = 18
  static double x2AddQuarter = UIBaseInset.addQuarter(x2);

  /// Adds [quarter] to [base] multiplied by [x]
  ///
  /// (8 x 3) + (8 / 4) = 26
  static double x3AddQuarter = UIBaseInset.addQuarter(x3);

  /// Adds [quarter] to [base] multiplied by [x]
  ///
  /// (8 x 4) + (8 / 4) = 34
  static double x4AddQuarter = UIBaseInset.addQuarter(x4);

  /// Adds [quarter] to [base] multiplied by [x]
  ///
  /// (8 x 5) + (8 / 4) = 42
  static double x5AddQuarter = UIBaseInset.addQuarter(x5);

  /// Adds [quarter] to [base] multiplied by [x]
  ///
  /// (8 x 6) + (8 / 4) = 40
  static double x6AddQuarter = UIBaseInset.addQuarter(x6);

  /// [baseInset] multiplied by X plus half of [baseInset]
  ///
  /// (8 x 1) + (8 / 2) = 12
  static double x1AddHalf = UIBaseInset.addHalf(base);

  /// [baseInset] multiplied by X plus half of [baseInset]
  ///
  /// (8 x 2) + (8 / 2) = 20
  static double x2AddHalf = UIBaseInset.addHalf(x2);

  /// [baseInset] multiplied by X plus half of [baseInset]
  ///
  /// (8 x 3) + (8 / 2) = 28
  static double x3AddHalf = UIBaseInset.addHalf(x3);

  /// [baseInset] multiplied by X plus half of [baseInset]
  ///
  /// (8 x 4) + (8 / 2) = 36
  static double x4AddHalf = UIBaseInset.addHalf(x4);

  /// [baseInset] multiplied by X plus half of [baseInset]
  ///
  /// (8 x 5) + (8 / 2) = 44
  static double x5AddHalf = UIBaseInset.addHalf(x5);

  /// [baseInset] multiplied by X plus half of [baseInset]
  ///
  /// (8 x 6) + (8 / 2) = 54
  static double x6AddHalf = UIBaseInset.addHalf(x6);

  static x(double inset) => EdgeInsets.symmetric(horizontal: inset);
}

EdgeInsets px(double inset) => EdgeInsets.symmetric(horizontal: inset);
EdgeInsets py(double inset) => EdgeInsets.symmetric(vertical: inset);

class Space {
  static Widget h([double? height]) => SizedBox(
        height: height ?? UIInsets.base,
      );
  static Widget w([double? width]) => SizedBox(
        width: width ?? UIInsets.base,
      );
}
