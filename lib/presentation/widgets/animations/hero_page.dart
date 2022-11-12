import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tag = Get.arguments["tag"];
    final imageFilename = Get.arguments["image_path"];
    return Hero(
      tag: tag,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageFilename),
                fit: BoxFit.scaleDown,
              ),
            )),
      ),
    );
  }
}
