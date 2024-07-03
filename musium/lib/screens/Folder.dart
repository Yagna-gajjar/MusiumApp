import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Folder extends StatefulWidget {
  const Folder({super.key});

  @override
  State<Folder> createState() => _FolderState();
}

class _FolderState extends State<Folder> {

  List Folders = [
    {"name": "moods", "numberofplaylist": 11},
    {"name": "blends", "numberofplaylist": 8},
    {"name": "favs", "numberofplaylist": 14},
    {"name": "random", "numberofplaylist": 10},
    {"name": "alltime", "numberofplaylist": 9}
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
                  Text(AppLocalizations.of(context)!.add_folder,
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
                  Text(AppLocalizations.of(context)!.liked +" "+ AppLocalizations.of(context)!.playlist,
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
                children: List.generate(Folders.length, (index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.folder_copy,
                        size: 50,
                        color: AppColors.fourthColor,),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            children: [
                              Text(Folders[index]["name"],
                                style: GoogleFonts.varelaRound(
                                  fontSize: 20,
                                  color: AppColors.fourthColor
                                ),
                              ),
                              Text("${Folders[index]["numberofplaylist"
                                ]} playlist",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.varelaRound(
                                    fontSize: 15,
                                    color: Colors.white60
                                ),),
                            ],
                          ))
                    ],
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
