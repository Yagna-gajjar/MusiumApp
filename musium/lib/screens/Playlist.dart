import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/utils/app_colors.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {

  List Playlists = [
    {"name": "morning vibes", "numberofsongs": 31, "image": "assets/image_0.png"},
    {"name": "Travaling", "numberofsongs": 20, "image": "assets/image_1.png"},
    {"name": "Navratri Non-Stop", "numberofsongs": 24, "image": "assets/image_2.png"},
    {"name": "24/7", "numberofsongs": 18, "image": "assets/image_3.png"},
    {"name": "All Time", "numberofsongs": 40, "image": "assets/image_4.png"},
    {"name": "Bollywood hits", "numberofsongs": 36, "image": "assets/image_5.png"},
    {"name": "Hollywood hits", "numberofsongs": 29, "image": "assets/image_0.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.5],
                          colors: [Color(0xffA6F3FF), AppColors.tertiaryColor]),
                      shape: BoxShape.circle
                  ),
                  child: const Icon(
                    Icons.add, color: AppColors.secondaryColor,
                  ),
                ),
                Text("Add New Playlist",
                  style: GoogleFonts.varelaRound(
                    color: AppColors.fourthColor,
                    fontSize: 15,
                  ),)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 20),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5],
                            colors: [Color(0xffA6F3FF), AppColors.tertiaryColor]),
                        shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.favorite_outline, color: AppColors.secondaryColor)),
                Text("Your Liked Songs",
                    style: GoogleFonts.varelaRound(
                      color: AppColors.fourthColor,
                      fontSize: 15,
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sort by", style: GoogleFonts.varelaRound(color: AppColors.fourthColor),),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Recently Played",
                        style: GoogleFonts.varelaRound(
                            color: AppColors.tertiaryColor
                        ),),
                    ),
                    const Icon(Icons.sort, color: Colors.white24,)
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(), // Disables scrolling.
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: (1 / .3),
              ),
              shrinkWrap: true,
              children: List.generate(Playlists.length, (index) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(Playlists[index]["image"]),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            children: [
                              Text(Playlists[index]["name"],
                                style: GoogleFonts.varelaRound(
                                    fontSize: 20,
                                    color: AppColors.fourthColor
                                ),
                              ),
                              Text("${Playlists[index]["numberofplaylist"
                              ]} Songs",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.varelaRound(
                                    fontSize: 15,
                                    color: Colors.white60
                                ),),
                            ],
                          ))
                    ],
                  ),
                );
              }
              ),
            ),
          )
        ],
      ),
    );
  }
}
