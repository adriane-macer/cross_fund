import 'package:cross_fund/application/controllers/login/login_controller.dart';
import 'package:cross_fund/presentation/core/shared/custom_button/custom_button_loading_plain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginFormBuilderWidget extends GetView<LoginController> {
  const LoginFormBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => FormBuilder(
            key: controller.formKey,
            autovalidateMode: controller.validated.value
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(
              children: [
                const SizedBox(height: 10),
                FormBuilderTextField(
                  name: 'username',
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.account_circle, color: Colors.grey),
                    hintText: "Username",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  name: 'password',
                  obscureText: controller.obscure.value,
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.lock_outline, color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () => controller.handleObscure(),
                      icon: Icon(
                        (controller.obscure.value)
                            ? Icons.visibility_off
                            : Icons.visibility,
                        // size: Get.width * .04
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                SizedBox(
                  height: Get.height * .05,
                ),
                CustomButtonLoadingPlain(
                    isLoading: controller.isLoading.value,
                    onClicked: (controller.isLoading.value)
                        ? null
                        : () => controller.handleLogin(),
                    title: "Login"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
