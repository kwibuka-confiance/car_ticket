import 'package:car_ticket/controller/auth/login_controller.dart';
import 'package:car_ticket/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(labelText: 'Password'),
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 50.h),
            GetBuilder(
                init: LoginController(),
                builder: (LoginController controller) {
                  return MainButton(
                      isColored: true,
                      isLoading: controller.isSigningIn,
                      isDisabled: controller.isSigningIn,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());
                        }
                      },
                      title: "Login");
                })
          ],
        ),
      ),
    );
  }
}
