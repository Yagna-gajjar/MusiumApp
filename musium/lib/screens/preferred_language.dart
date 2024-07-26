import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/screens/add_user_details.dart';
import 'package:musium/utils/app_colors.dart';

enum SingingCharacter { en, hi, gu }

class PreferredLanguage extends StatefulWidget {
  final String email;
  final String username;
  final String password;

  PreferredLanguage({
    Key? key,
    required this.email,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  _PreferredLanguageState createState() => _PreferredLanguageState();
}

class _PreferredLanguageState extends State<PreferredLanguage> {
  final _formField = GlobalKey<FormState>();
  SingingCharacter? _character = SingingCharacter.en;

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
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Create your account",
                  style: GoogleFonts.varelaRound(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('English', style: GoogleFonts.varelaRound(color: AppColors.fourthColor),),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.en,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Hindi', style: GoogleFonts.varelaRound(color: AppColors.fourthColor),),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.hi,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title:  Text('Gujarati', style: GoogleFonts.varelaRound(color: AppColors.fourthColor),),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.gu,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddUserDetails(
                                  email: widget.email,
                                  password: widget.password,
                                  username: widget.username,
                                  lan: _character.toString().split('.')[1],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.tertiaryColor,
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              "Next",
                              style: GoogleFonts.varelaRound(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
