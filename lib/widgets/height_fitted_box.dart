import 'package:app/tools.dart';
import 'package:flutter/material.dart';

class HeightFittedBox extends StatelessWidget {
  final Tuple2<double, double> height;
  final Widget? Function(double)? builder;

  const HeightFittedBox({super.key, required this.height, this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final from = height.value1, to = height.value2;

        final fit = from / to;

        return SizedBox(
          height: to,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: SizedBox(
              width: constraints.maxWidth * fit,
              height: from,
              child: builder?.call(fit),
            ),
          ),
        );
      },
    );
  }
}
