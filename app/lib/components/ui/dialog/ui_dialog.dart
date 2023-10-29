import 'package:flutter/material.dart';

mixin DialogMixin {
  Future<void> show(BuildContext context);

  close<T>(
    BuildContext context, {
    T? value,
  }) {
    return Navigator.of(context).pop(value);
  }
}

class UIDialog {
  static Future<void> show(
    BuildContext context,
    Widget modal, {
    bool isDissmissable = true,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: isDissmissable,
        builder: (BuildContext context) {
          return modal;
        });
  }

  // static Future<void> showModalSheet(BuildContext context, Widget child) {
  //   return showModalBottomSheet(
  //       context: context,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: _modalBorderRadius,
  //       ),
  //       builder: (BuildContext context) {
  //         return BaseBottomSheet(
  //           child: child,
  //         );
  //       });
  // }

  static close<T>(
    BuildContext context, {
    T? value,
  }) {
    return Navigator.of(context).pop(value);
  }
}

class CustomDialogRoute<T> extends PopupRoute<T> {
  final Widget child;

  CustomDialogRoute(
      {super.settings,
      super.filter,
      super.traversalEdgeBehavior,
      required this.child});
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.red.withOpacity(0.5);

  @override
  String? get barrierLabel => "Dialog";

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return child;
  }
}

// class BaseBottomSheet extends StatelessWidget {
//   final Widget child;

//   const BaseBottomSheet({Key key, this.child}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         // color: Theme.of(context).cardTheme.color,
//         borderRadius: _modalBorderRadius,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           child,
//         ],
//       ),
//     );
//   }
// }

BorderRadius _modalBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20),
);
