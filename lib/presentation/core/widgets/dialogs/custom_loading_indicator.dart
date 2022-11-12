import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Color.fromARGB(100, 0, 0, 0),
        child: Center(
            child: LoadingAnimationWidget.hexagonDots(
          color: Theme.of(context).primaryColor,
          size: 80,
        )),
      ),
    );
  }
}
