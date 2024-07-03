import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/utils/app_colors.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {

  List Artists = [
    {"name": "Arijit Sigh", "image": "assets/Arijit_Sigh.jpeg"},
    {"name": "Imagine Dragons", "image": "assets/Imagine_dragons.jpeg"},
    {"name": "Taylor Swift", "image": "assets/Taylor_swift.jpeg"},
    {"name": "A.R Rahman", "image": "assets/A.R_Rahman.jpeg"}
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
                Text("Add Artists",
                  style: GoogleFonts.varelaRound(
                    color: AppColors.fourthColor,
                    fontSize: 15,
                  ),)
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
              children: List.generate(Artists.length, (index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/"+Artists[index]["image"]),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(Artists[index]["name"],
                          style: GoogleFonts.varelaRound(
                              fontSize: 16,
                              color: AppColors.fourthColor
                          ),
                        ))
                  ],
                );
              }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
