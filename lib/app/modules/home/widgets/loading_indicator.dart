import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator {
  final spinkit = SpinKitThreeBounce(
    size: 10,
    itemBuilder: (BuildContext context, int index) {
      return const DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // gradient: [],
        ),
      );
    },
  );

  final loadingIndicator = const SpinKitWaveSpinner(
    color: Colors.greenAccent,
  );
  final waitingIndicator = const SpinKitDualRing(
    color: Colors.white,
    size: 20,
    lineWidth: 3,
  );
}
