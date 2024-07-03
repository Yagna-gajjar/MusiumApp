import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/screens/HomePage.dart';
import 'package:musium/screens/LibrabyPage.dart';
import 'package:musium/screens/SearchPage.dart';
import 'package:musium/screens/current_song.dart';
import 'package:musium/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int selectedIndex = 0;
  late List<Widget> _widgetOptions;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // late AudioPlayer player = AudioPlayer();
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   // Create the audio player.
  //   player = AudioPlayer();
  //
  //   // Set the release mode to keep the source after playback has completed.
  //   player.setReleaseMode(ReleaseMode.stop);
  //
  //   // Start the player as soon as the app is displayed.
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     await player.setSource(AssetSource('goldenhour.mp3'));
  //     await player.resume();
  //   });
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _widgetOptions = <Widget>[
      HomePage(),
      SearchPage(),
      Library(),
      Text(AppLocalizations.of(context)!.premium, style: GoogleFonts.varelaRound(color: Colors.white))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.2],
          colors: [AppColors.primaryColor, AppColors.secondaryColor],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          margin: const EdgeInsets.only(top: 50),
          child: Center(
            child: _widgetOptions.elementAt(selectedIndex) ,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Color(0xff0CC0DF),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentSong(),));
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage("https://images.genius.com/439f35db9ef425c5b0a2f3e41607e678.300x300x1.png")),
            ),
            // child: Image.network(
            //   "https://images.genius.com/439f35db9ef425c5b0a2f3e41607e678.300x300x1.png", fit: BoxFit.contain,),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: BottomAppBar(
        //   color: AppColors.primaryColor,
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: 5,
        //   child: SizedBox(
        //     height: 40,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             MaterialButton(
        //                 minWidth: 40,
        //                 onPressed: () {
        //                   setState(() {
        //                     selectedIndex = 0;
        //                   });
        //                 },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Icon( selectedIndex == 0 ? Icons.home : Icons.home_outlined,
        //                       color: selectedIndex == 0 ? Color(0xff0CC0DF) : Colors.white),
        //                   Text(AppLocalizations.of(context)!.home, style: GoogleFonts.varelaRound(
        //                     color: selectedIndex == 0 ? Color(0xff0CC0DF) : Colors.white
        //                   ))
        //                 ],
        //               ),
        //
        //                 ),
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   selectedIndex = 1;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Icon( selectedIndex == 1 ? Icons.search_rounded : Icons.search,
        //                       color: selectedIndex == 1 ? Color(0xff0CC0DF) : Colors.white),
        //                   Text(AppLocalizations.of(context)!.search, style: GoogleFonts.varelaRound(
        //                       color: selectedIndex == 1 ? Color(0xff0CC0DF) : Colors.white
        //                   ))
        //                 ],
        //               ),
        //
        //             ),
        //           ],
        //         ),
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   selectedIndex = 2;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Icon( selectedIndex == 2 ? Icons.folder : Icons.folder_open_sharp,
        //                       color: selectedIndex == 2 ? Color(0xff0CC0DF) : Colors.white),
        //                   Text(AppLocalizations.of(context)!.folder, style: GoogleFonts.varelaRound(
        //                       color: selectedIndex == 2 ? Color(0xff0CC0DF) : Colors.white
        //                   ))
        //                 ],
        //               ),
        //
        //             ),
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   selectedIndex = 3;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Icon( selectedIndex == 3 ? Icons.workspace_premium : Icons.workspace_premium_outlined,
        //                       color: selectedIndex == 3 ? Color(0xff0CC0DF) : Colors.white),
        //                   Text(AppLocalizations.of(context)!.premium, style: GoogleFonts.varelaRound(
        //                       color: selectedIndex == 3 ? Color(0xff0CC0DF) : Colors.white
        //                   ))
        //                 ],
        //               ),
        //
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search_rounded),
              label: AppLocalizations.of(context)!.explore,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_open_sharp),
              activeIcon: Icon(Icons.folder),
              label: AppLocalizations.of(context)!.library,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.workspace_premium_outlined),
              activeIcon: Icon(Icons.workspace_premium),
              label: AppLocalizations.of(context)!.premium,
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color(0xff0CC0DF),
          selectedLabelStyle: GoogleFonts.varelaRound(),
          unselectedLabelStyle: GoogleFonts.varelaRound(),
        ),
      ),
    );
  }
}
