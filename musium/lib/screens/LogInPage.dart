import 'package:google_fonts/google_fonts.dart';
import 'package:musium/screens/SignUpPage.dart';
import 'package:musium/screens/bottom_navigation_bar.dart';
import 'package:musium/utils/Controllers.dart';
import 'package:musium/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = true;
  bool? checkBoxValue = false;

  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          surfaceTintColor: AppColors.secondaryColor,
          backgroundColor: AppColors.secondaryColor,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: AppColors.primaryColor),
        ),
        body: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Form(
            key: _formField,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                    width: 200,
                    height: 200,
                    child: Center(
                        child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    ))),
                Text(
                  "Login to your account",
                  style: GoogleFonts.varelaRound(
                      fontSize: 30, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      bool emailValid =
                          RegExp(r"^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value!);
                      if (value.isEmpty) {
                        return "Enter Email";
                      } else if (!emailValid) {
                        return "Enter Valid Email";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle:
                          GoogleFonts.varelaRound(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      fillColor: Colors.grey[900],
                      filled: true,
                      prefixIcon: Icon(
                        Icons.mail_outline_outlined,
                        color: Colors.grey[600],
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _emailController.clear();
                        },
                      ),
                    ),
                    style: GoogleFonts.varelaRound(
                      color: Colors.white60, // Change text color here
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    obscureText: _passwordVisible,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      bool passValid =
                          RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$")
                              .hasMatch(value!);
                      if (value.isEmpty) {
                        return "Enter password";
                      } else if (_passwordController.text.length < 6) {
                        return "Password length should not be less then 6 character";
                      } else if (!passValid) {
                        return "password should contains at least digit, capital letter and small letter";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: GoogleFonts.varelaRound(
                        color: Colors.grey[600],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                          width: 2.0,
                        ),
                      ),
                      fillColor: Colors.grey[900],
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey[600],
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          _toggle();
                        },
                      ),
                    ),
                    style: GoogleFonts.varelaRound(
                      color: Colors.white60,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: CheckboxListTile(
                    title: Text(
                      "Remember Me",
                      style: GoogleFonts.varelaRound(color: Colors.white),
                    ),
                    value: checkBoxValue,
                    activeColor: AppColors.tertiaryColor,
                    onChanged: (bool? newValue) {
                      setState(() {
                        checkBoxValue = newValue;
                      });
                    },
                    side: const BorderSide(color: AppColors.tertiaryColor),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formField.currentState!.validate()) {
                              if (checkBoxValue!) {
                                Controllers.StringSet(
                                    key: 'email',
                                    value: _emailController.text.trim());
                                Controllers.StringSet(
                                    key: 'password',
                                    value: _passwordController.text);
                              }
                              _emailController.clear();
                              _passwordController.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyNavigationBar()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.tertiaryColor,
                          ),
                          child: Container(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                "Log In",
                                style: GoogleFonts.varelaRound(
                                    color: Colors.white),
                              ))
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    "Forgot the password?",
                    style:
                        GoogleFonts.varelaRound(color: AppColors.tertiaryColor),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.rectangle),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "or continue with",
                        style: GoogleFonts.varelaRound(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.rectangle),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid)),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/google.png',
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid)),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/facebook.png',
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid)),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/apple.png',
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ))
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 40, bottom: 40),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: const TextStyle(color: Colors.white),
                            children: [
                              const TextSpan(
                                text: 'Don\'t have an account? ',
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: GoogleFonts.varelaRound(
                                    color: AppColors.tertiaryColor),
                              ),
                            ])),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
