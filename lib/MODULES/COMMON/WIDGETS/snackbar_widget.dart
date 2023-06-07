import 'package:flutter/material.dart';

SnackBarWidget(
  BuildContext ctx,
  String text, {
  Color bgColor = Colors.black,
}) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor,
      content: Text(text),
    ),
  );
}



// class SnackBarWidget extends StatelessWidget {
//   final String text;
//   final Color bgColor;
//   final BuildContext ctx;
//   const SnackBarWidget(
//     this.ctx,
//     this.text, {
//     super.key,
//     this.bgColor = Colors.green,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return successSnackBar(ctx);
//   }

//   successSnackBar(ctx) {
//     ScaffoldMessenger.of(ctx).showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: bgColor,
//         content: Text(text),
//       ),
//     );
//   }
// }