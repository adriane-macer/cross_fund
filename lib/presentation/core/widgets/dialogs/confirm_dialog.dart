import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Wrap(
        children: [

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Text("You are about to log out."),
                const SizedBox(height: 24,),
                const Text("Confirm?"),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back(result: true);
                            // Navigator.pop(context, true);
                          },
                          child: const Text("Yes"),
                      style: ElevatedButton.styleFrom(elevation: 0.0),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back(result: false);
                            // Navigator.pop(context, false);
                          },
                          child: const Text("Confirm"),
                          style: ElevatedButton.styleFrom(elevation: 0.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
