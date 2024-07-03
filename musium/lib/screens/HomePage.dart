import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/main.dart';
import 'package:musium/screens/firebaseExample.dart';
import 'package:musium/screens/song_list.dart';
import 'package:musium/utils/Controllers.dart';
import 'package:musium/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List continue_listning = [
    "coffee & jazz",
    "lofi beats",
    "Harry styles",
    "Anime OSTs",
    "Anything goes",
    "Released"
  ];
  List top_mixies = [
    {"name": "Pop", "color": Colors.pink},
    {"name": "Chill", "color": Colors.yellow},
    {"name": "kpop", "color": Colors.green}
  ];

  int IconIndex = -1;
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
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              image: const DecorationImage(
                                image: AssetImage('assets/profile-picture.jpg'),
                                fit: BoxFit.cover
                              ),
                              border: Border.all(
                                  color: const Color(0xff0CC0DF),
                                  width: 2,
                                  style: BorderStyle.solid
                              )
                          ),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context)!.welcome_message,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.varelaRound(
                                        color: Colors.white, fontSize: 17)),
                                Text("Yagna Gajjar",
                                    style: GoogleFonts.varelaRound(
                                        color: Colors.white38,
                                        fontSize: 12)),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FirebaseExample(),));
                          },
                          icon: const Icon(
                            Icons.bar_chart,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SongList(),));
                              },
                              icon: const Icon(
                                Icons.notifications_outlined,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            const Positioned(
                                top: 10,
                                left: 10,
                                child:  Stack(
                                  children: <Widget>[
                                    Icon(
                                      Icons.brightness_1,
                                      size: 10.0,
                                      color: Color(0xff0CC0DF),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                          showMenu(
                              color: AppColors.tertiaryColor,
                              context: context,
                              position: const RelativeRect.fromLTRB(100, 100, 30, 0),
                              items: [
                                PopupMenuItem(
                                  value: 1,
                                  onTap: (){
                                    showMenu(
                                        color: AppColors.tertiaryColor,
                                        context: context,
                                        position: const RelativeRect.fromLTRB(100, 100, 30, 0),
                                        items: [
                                          PopupMenuItem(
                                            onTap: () {
                                              MyApp.setLocale(context, Locale('en', ''));
                                              Controllers.StringSet(key: 'lan', value: 'en');
                                            },
                                              value: 1,
                                              child: Text("English", style: GoogleFonts.varelaRound(),)),
                                          PopupMenuItem(
                                              onTap: () {
                                                MyApp.setLocale(context, Locale('hi', ''));
                                                Controllers.StringSet(key: 'lan', value: 'hi');
                                              },
                                              value: 1,
                                              child: Text("हिन्दी", style: GoogleFonts.varelaRound())),
                                          PopupMenuItem(
                                              onTap: () {
                                                MyApp.setLocale(context, Locale('gu', ''));
                                                Controllers.StringSet(key: 'lan', value: 'gu');
                                              },
                                              value: 1,
                                              child: Text("ગુજરાતી", style: GoogleFonts.varelaRound())),
                                        ]);
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const Languages()));
                                  },
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: Icon(Icons.language, color: AppColors.primaryColor,),
                                      ),
                                      Text("Languages", style: GoogleFonts.varelaRound(
                                        fontSize: 15, color: AppColors.primaryColor,
                                      ),)
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 1,
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: Icon(Icons.logout, color: AppColors.primaryColor,),
                                      ),
                                      Text("Log out", style: GoogleFonts.varelaRound(
                                          fontSize: 15,
                                          color: AppColors.primaryColor
                                      ),)
                                    ],
                                  ),
                                ),
                              ]);
                          },
                          icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 25,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(
                    AppLocalizations.of(context)!.continue_listening,
                    style: GoogleFonts.varelaRound(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                GridView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(), // Disables scrolling.
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    childAspectRatio: (1 / .4), // Aspect ratio of each grid item
                  ),
                  shrinkWrap: true,
                  children: List.generate(continue_listning.length, (index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/image_$index.png',
                                  fit: BoxFit.cover,
                                )),
                            Expanded(
                              child: Text(continue_listning[index],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.varelaRound(
                                      color: Colors.white, fontSize: 10)),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 40),
                  child: Text(
                    AppLocalizations.of(context)!.top_mixes,
                    style: GoogleFonts.varelaRound(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: top_mixies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 10,
                                      color: top_mixies[index]["color"]))),
                          width: 130,
                          margin: const EdgeInsets.only(right: 20),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/${top_mixies[index]["name"]}.png',
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                left: -20,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.white54,
                                    shape: BoxShape.circle
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 30,
                                child: Text("${top_mixies[index]["name"]} Mix", style: GoogleFonts.varelaRound(
                                  color: Colors.white
                                ),),
                              ),
                              Positioned(
                                top: 40,
                                right: -50,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                      color: Colors.white54,
                                      shape: BoxShape.circle
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 40),
                  child: Text(
                    AppLocalizations.of(context)!.recent_listening,
                    style: GoogleFonts.varelaRound(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: continue_listning.length,
                      itemBuilder: (
                        BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              width: 180,
                              margin: const EdgeInsets.only(right: 30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  'assets/image_$index.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: 180,
                              color: Colors.black54 ,
                              child: Center(
                                  child: Text("yagna", style: GoogleFonts.varelaRound(
                                    color: Colors.white
                                  ),)
                                ),
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
