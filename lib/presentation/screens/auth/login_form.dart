import 'package:car_ticket/presentation/screens/main_screen/navigations.dart';
import 'package:car_ticket/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            MainButton(
                isColored: true,
                onPressed: () {
                  Navigator.pushNamed(context, Navigations.routeName);
                },
                title: "Login")
          ],
        ),
      ),
    );
  }
}
