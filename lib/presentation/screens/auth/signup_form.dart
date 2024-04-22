import 'package:car_ticket/domain/models/user/user.dart';
import 'package:car_ticket/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:car_ticket/presentation/screens/main_screen/navigations.dart';
import 'package:car_ticket/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.w),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            setState(() {
              signInRequired = true;
            });
            Navigator.pushNamed(context, Navigations.routeName);
          } else if (state is SignUpFailure) {
            setState(() {
              signInRequired = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.toString()),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            return;
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Names'),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
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
                decoration: const InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty || value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50.h),
              MainButton(
                  isColored: true,
                  isDisabled: signInRequired,
                  isLoading: signInRequired,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      MyUser myUser = MyUser.empty;
                      myUser = myUser.copyWith(
                          email: emailController.text,
                          name: nameController.text,
                          id: DateTime.now().toString());
                      String password = passwordController.text;
                      setState(() {
                        context.read<SignUpBloc>().add(
                            SignUpRequired(user: myUser, password: password));
                      });
                    }
                  },
                  title: "Sign Up")
            ],
          ),
        ),
      ),
    );
  }
}
