import 'package:google_fonts/google_fonts.dart';
import 'package:musium/screens/bottom_navigation_bar.dart';
import 'package:musium/screens/preferred_language.dart';
import 'package:musium/utils/Controllers.dart';
import 'package:musium/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _username = TextEditingController();
  bool _passwordVisible = true;
  bool _confirmpasswordVisible = true;
  bool? checkBoxValue = false;


  void _toggle(name) {
    setState(() {
      name = !name;
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
              child: Column(
                  children: [
                    SizedBox(
                        width: 200,
                        height: 200,
                        child: Center(child: Image.asset('assets/logo.png', fit: BoxFit.cover,))),
                    Text(
                      "creat your account",
                      style: GoogleFonts.varelaRound(fontSize: 30, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          bool emailValid = RegExp(r"^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$").hasMatch(value!);
                          if(value.isEmpty){
                            return "Enter Email";
                          }
                          else if(!emailValid) {
                            return "Enter Valid Email";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: GoogleFonts.varelaRound(color: Colors.grey[600]),
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
                    ),Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        controller: _username,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value){
                          if(_username.text.isEmpty){
                            return "Enter User Name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'User Name',
                          hintStyle: GoogleFonts.varelaRound(color: Colors.grey[600]),

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
                            Icons.person_2_outlined,
                            color: Colors.grey[600],
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _username.clear();
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
                          bool passValid = RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$").hasMatch(value!);
                          if(value.isEmpty){
                            return "Enter password";
                          }
                          else if(_passwordController.text.length < 6){
                            return "Password length should not be less then 6 character";
                          }
                          else if(!passValid){
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
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        style: GoogleFonts.varelaRound(
                          color: Colors.white60,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _confirmpasswordController,
                        obscureText: _confirmpasswordVisible,
                        validator: (value){
                          if(_confirmpasswordController.text != _passwordController.text){
                            return "Confirm passsword is incorrect";
                          }
                        },

                        decoration: InputDecoration(
                          hintText: 'Conffirm Password',
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
                              _confirmpasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey[600],
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmpasswordVisible = !_confirmpasswordVisible;
                              });
                            },
                          ),
                        ),
                        style: GoogleFonts.varelaRound(
                          color: Colors.white60,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formField.currentState!.validate()) {

                                    // Controllers.StringSet(
                                      //     key: 'email',
                                      //     value: _emailController.text.trim());
                                      // Controllers.StringSet(
                                      //     key: 'password',
                                      //     value: _passwordController.text);
                                      // Controllers.StringSet(
                                      //     key: 'User Name',
                                      //     value: _username.text);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PreferredLanguage(email: _emailController.text, username: _username.text, password: _passwordController.text)));

                                    // _emailController.clear();
                                    // _passwordController.clear();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.tertiaryColor,
                                ),
                                child: Container(
                                    padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                    child: Text(
                                      "Next",
                                      style: GoogleFonts.varelaRound(
                                          color: Colors.white),
                                    ))
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
