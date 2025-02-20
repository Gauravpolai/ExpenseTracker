import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/common_widget/primary_button.dart';
import 'package:expense_tracker/common_widget/round_textfield.dart';
import 'package:expense_tracker/common_widget/secondary_button.dart';
import 'package:expense_tracker/view/login/sign_up_view.dart';
import 'package:expense_tracker/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/app_logo.png",
                width: media.width * 0.5,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              RoundTextfield(
                title: "E-mail Address",
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextfield(
                title: "Password",
                obscureText: true,
                controller: _password,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          isRemember
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank,
                          size: 15,
                          color: TColor.gray50,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(color: TColor.gray50, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: TColor.gray50, fontSize: 14),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                  title: "Sign In",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MainTabView(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 40,
              ),
              Text(
                "If you already have an account?",
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w100),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              SecondaryButton(
                  title: "Sign Up",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignUpView(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
