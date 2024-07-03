import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondSearchPage extends StatefulWidget {
  const SecondSearchPage({super.key});

  @override
  State<SecondSearchPage> createState() => _SecondSearchPageState();
}

class _SecondSearchPageState extends State<SecondSearchPage> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    // Set the focus to the text field when the page is loaded
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xff0CC0DF)),
          backgroundColor: Colors.black,
          title: Container(
            margin: EdgeInsets.only(top: 5),
            child: TextField(
                focusNode: _focusNode,
                style: TextStyle(color: Color(0xff0CC0DF)),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.varelaRound(color: Color(0x800CC0DF)),
                  hintText: "What do you want ot listen ?",
                )),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Play what you love",
              style: GoogleFonts.varelaRound(
                  fontSize: 20, color: Color(0xB30CC0DF)),
            ),
            Text(
              "Search for Songs, Artists, Podcasts & More",
              style: GoogleFonts.varelaRound(
                  fontSize: 13, color: Color(0x800CC0DF)),
            ),
          ],
        ),
      ),
    );
  }
}
