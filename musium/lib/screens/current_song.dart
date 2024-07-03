import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/utils/app_colors.dart';

class CurrentSong extends StatefulWidget {
  const CurrentSong({super.key});

  @override
  State<CurrentSong> createState() => _CurrentSongState();
}

class _CurrentSongState extends State<CurrentSong> {
  late final AudioPlayer player;
  late final AssetSource path;


  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = AssetSource('goldenhour.mp3');
    player.play(path);
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

        ),
      ),
    );
  }
}
