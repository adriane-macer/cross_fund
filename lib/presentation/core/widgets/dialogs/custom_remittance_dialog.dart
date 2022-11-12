import 'package:cross_fund/presentation/core/shared/custom_button/custom_button_plain_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:textless/textless.dart';

class CustomRemittanceDialog extends StatefulWidget {
  final IconData iconData;
  final String currency;
  final VoidCallback onCancel;

  /// returns Function(String origin, String target, String amount)
  final Function(String, String, String)? onConfirm;

  const CustomRemittanceDialog({
    Key? key,
    required this.iconData,
    required this.currency,
    required this.onCancel,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<CustomRemittanceDialog> createState() => _CustomRemittanceDialogState();
}

class _CustomRemittanceDialogState extends State<CustomRemittanceDialog> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: Get.height * .20,
                  child: Icon(
                    widget.iconData,
                    size: Get.height * .10,
                  ),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                "Remittance".h6.alignCenter,
                SizedBox(
                  height: Get.height * .01,
                ),
                FormBuilderTextField(
                  name: "origin",
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(32),
                  ]),
                  decoration: const InputDecoration(
                    helperText: 'Origin',
                    labelText: 'Origin',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontStyle: FontStyle.italic),
                    hintText: "Input origin",
                  ),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                FormBuilderTextField(
                  name: "target",
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.max(32),
                  ]),
                  decoration: const InputDecoration(
                      helperText: 'Target',
                      labelText: 'Target',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      hintText: "Input target",),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                FormBuilderTextField(
                  name: "amount",
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.integer(
                        errorText: 'Value must be whole number'),
                  ]),
                  decoration: const InputDecoration(
                      helperText: 'Amount',
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      hintText: "Input amount",),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: widget.onCancel,
                      style: TextButton.styleFrom(),
                      child: 'Close'.text.bold.color(Colors.grey),
                    ),
                    CustomButtonPlain2(
                      title: 'Proceed',
                      onClicked: widget.onConfirm == null
                          ? null
                          : () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              widget.onConfirm!(
                                  formKey
                                      .currentState!.fields["origin"]!.value
                                      .toString(),
                                  formKey
                                      .currentState!.fields["target"]!.value
                                      .toString(),
                                  formKey.currentState!.fields["amount"]!
                                      .value
                                      .toString());
                            },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
