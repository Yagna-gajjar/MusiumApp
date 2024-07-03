import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/screens/Artists.dart';
import 'package:musium/screens/Folder.dart';
import 'package:musium/screens/Playlist.dart';
import 'package:musium/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List Catagory = [
    {"name": "folder"},
    {"name": "Playlist"},
    {"name": "Artists"},
    {"name": "Albums"},
    {"name": "Podcast & Shows"},
  ];

  int _tappedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Folder(),
    Playlist(),
    Artists(),
    Center(child: Text("Albums",
      style: TextStyle(color: Colors.white),
    )),
    Center(child: Text("Podcast & Shows",
      style: TextStyle(color: Colors.white),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset(
                            'assets/logo.png',
                            fit: BoxFit.cover,
                          )),
                      Text(
                        AppLocalizations.of(context)!.your_library,
                        style: GoogleFonts.varelaRound(
                            color: const Color(0xff0CC0DF),
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 33,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Catagory.length,
                  itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _tappedIndex = index;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: _tappedIndex == index ? AppColors.primaryColor : Colors.white12,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(Catagory[index]["name"], style: GoogleFonts.varelaRound(
                            color: AppColors.fourthColor,
                        ),),
                      ),
                  );
                }
              ),
            ),
            Container(
              child: _widgetOptions.elementAt(_tappedIndex)
            )
          ],
        ),
      ),
    );
  }
}

