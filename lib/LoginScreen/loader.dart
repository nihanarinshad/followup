import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void showLoader(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
        ),
      );
    },
  );
}
