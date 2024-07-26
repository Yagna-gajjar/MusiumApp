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
  Duration _duration = Duration();
  Duration _position = Duration();
  PlayerState _playerState = PlayerState.stopped;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> initPlayer() async {
    player = AudioPlayer();

    player.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    player.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });

    player.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        _playerState = s;
      });
    });

    await player.setSource(AssetSource('goldenhour.mp3'));
  }

  void _playPause() {
    if (_playerState == PlayerState.playing) {
      player.pause();
    } else {
      player.resume();
    }
  }

  void _seek(double value) {
    final position = Duration(seconds: value.round());
    player.seek(position);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/genre/Chill.png', fit: BoxFit.fill),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.black54,
          ),
          Container(
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(30),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios, size: 30,color: AppColors.fourthColor),)),
                Container(
                  child: Text("Current Song", style: GoogleFonts.varelaRound(color: AppColors.fourthColor, fontSize: 25),),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(height: (MediaQuery.of(context).size.height) - 250,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("golden hour", style: GoogleFonts.varelaRound(color: AppColors.fourthColor, fontSize: 30),),
                          Text("JVKE", style: GoogleFonts.varelaRound(color: Colors.grey, fontSize: 20,),),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.share_outlined, color: AppColors.fourthColor,)),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.favorite_border_rounded, color: AppColors.tertiaryColor,)),
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: AppColors.tertiaryColor,
                      inactiveTrackColor: Colors.white.withOpacity(0.5),
                      thumbColor: Colors.white,
                      overlayColor: Colors.white.withOpacity(0.2),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                    ),
                    child: Slider(
                      value: _position.inSeconds.toDouble(),
                      max: _duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        _seek(value);
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_position),
                        style: GoogleFonts.varelaRound(color: Colors.white),
                      ),
                      Text(
                        _formatDuration(_duration),
                        style: GoogleFonts.varelaRound(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.shuffle, color: Colors.grey,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.fast_rewind, color: AppColors.fourthColor, size: 30,)),
                          IconButton(
                            icon: Icon(
                              _playerState == PlayerState.playing
                                  ? Icons.pause_circle
                                  : Icons.play_circle_fill,
                              size: 50,
                              color: AppColors.tertiaryColor,
                            ),
                            onPressed: _playPause,
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.fast_forward, color: AppColors.fourthColor, size: 30,)),
                        ],
                      ),
                      Icon(Icons.add, color: Colors.grey,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
