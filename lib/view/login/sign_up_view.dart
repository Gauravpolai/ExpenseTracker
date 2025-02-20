import 'package:expense_tracker/common/color_extension.dart';
import 'package:expense_tracker/common_widget/primary_button.dart';
import 'package:expense_tracker/common_widget/round_textfield.dart';
import 'package:expense_tracker/common_widget/secondary_button.dart';
import 'package:expense_tracker/view/login/sign_in_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: TColor.gray70),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: TColor.gray70),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: TColor.gray70),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: TColor.gray70),
                    ),
                  ),
                ],
              ),
              Text(
                "Use 8 or more characters with a mix of letters and numbers",
                style: TextStyle(color: TColor.gray50, fontSize: 14),
              ),
              const SizedBox(
                height: 40,
              ),
              PrimaryButton(
                  title: "Sign up with E-mail",
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUpView()));
                  }),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Do you already have an account?",
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
                  title: "Sign in",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SignInView()));
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
