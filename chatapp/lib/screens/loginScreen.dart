import 'package:chatapp/Network/FireBaseCodes.dart';
import 'package:chatapp/reusable/Constant.dart';
import 'package:chatapp/reusable/customButton.dart';
import 'package:chatapp/reusable/customTextField.dart';
import 'package:chatapp/screens/chatScreen.dart';
import 'package:chatapp/screens/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: primaryColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                        height: 150,
                        width: 300,
                        child: Image.asset(
                          'assets/images/chat.png',
                        )),
                    Text(
                      'Chat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    DefultCustomTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefultCustomTextFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Passwod',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await Login(
                              context: context,
                              email: email.toString(),
                              password: password.toString());
                        }
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushNamed(context, ChatScreen.id);
                      },
                      text: 'LOGIN',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already hanv an account ?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: Text(
                            '  REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
