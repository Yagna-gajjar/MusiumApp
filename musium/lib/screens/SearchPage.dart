import 'dart:convert';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> Your_Top_Genres = [];
  List Browse_All = [
    {"name": "coffee & jazz", "color": Colors.brown, "image": "image_0.png"},
    {"name": "lofi beats", "color": Colors.blue, "image": "image_1.png"},
    {"name": "Harry styles", "color": Colors.cyan, "image": "image_2.png"},
    {"name": "Anime OSTs", "color": Colors.amber, "image": "image_3.png"},
    {"name": "Anything goes", "color": Colors.greenAccent, "image": "image_4.png"},
    {"name": "Released", "color": Colors.red, "image": "image_5.png"},
    {"name": "Pop", "color": Colors.pink, "image": "Pop.png"},
    {"name": "Chill", "color": Colors.yellow, "image": "Chill.png"},
    {"name": "kpop", "color": Colors.green, "image": "kpop.png"},
    {"name": "indie", "color": Colors.brown, "image": "indie.png"},
    {"name": "coffee & jazz", "color": Colors.brown, "image": "image_0.png"},
    {"name": "lofi beats", "color": Colors.blue, "image": "image_1.png"},
    {"name": "Harry styles", "color": Colors.cyan, "image": "image_2.png"},
    {"name": "Anime OSTs", "color": Colors.amber, "image": "image_3.png"},
    {"name": "Anything goes","color": Colors.greenAccent, "image": "image_4.png"}
  ];
  TextEditingController _searchController = TextEditingController();
  List searchListBrowseAll = [];
  List searchListYourTopGenres = [];
  bool foundornot = true;

  Future<List> getAllGenre() async {
    var response = await http.get(Uri.parse("http://localhost:5000/Genre"));
    return jsonDecode(response.body);
  }

  Future<String> _loadImage(name) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(name);
      final url = await storageRef.getDownloadURL();
      return url;
    } catch (e) {
      return 'Failed to load image: $e';
    }
  }

  void filtter(String value) {
    if (value.isEmpty) {
      setState(() {
        searchListBrowseAll = Browse_All;
        searchListYourTopGenres = Your_Top_Genres;
      });
    } else {
      setState(() {
        searchListBrowseAll = Browse_All.where((e) =>
                e["name"].trim().toLowerCase().contains(value.toLowerCase()))
            .toList();
        searchListYourTopGenres = Your_Top_Genres.where((e) =>
                e["genre"]!.trim().toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  // Color rgbaToColor(String rgbaString) {
  //   final regex = RegExp(r'rgba?\((\d+),\s*(\d+),\s*(\d+),\s*([0-9.]+)\)');
  //   final match = regex.firstMatch(rgbaString);
  //
  //   if (match != null) {
  //     final r = int.parse(match.group(1)!);
  //     final g = int.parse(match.group(2)!);
  //     final b = int.parse(match.group(3)!);
  //     final a = double.parse(match.group(4)!);
  //
  //     return Color.fromRGBO(r, g, b, a);
  //   } else {
  //     throw FormatException("Invalid RGBA format");
  //   }
  // }

  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  assign() async {
    List response = await getAllGenre();
    Your_Top_Genres = response.map((item) => {'genre': item['genre'].toString(), 'themeColor': hexToColor(item['themeColor'].toString()), 'image': item['image'].toString()}).toList();
    setState(() async {
      searchListYourTopGenres = await Your_Top_Genres;
    });
    print(searchListYourTopGenres);
  }

  @override
  void initState() {
    searchListBrowseAll = Browse_All;
    assign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllGenre(),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        width: 60,
                        height: 60,
                        child: Image.asset(
                          'assets/logo.png',
                          fit: BoxFit.cover,
                        )),
                    Text(
                      AppLocalizations.of(context)!.search,
                      style: GoogleFonts.varelaRound(
                          color: const Color(0xff0CC0DF),
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    onChanged: (value) => filtter(value),
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.hint_of_search,
                      hintStyle:
                      GoogleFonts.varelaRound(color: AppColors.primaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white70,
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
                      suffixIcon: IconButton(
                        icon:
                        const Icon(Icons.clear, color: AppColors.primaryColor),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            searchListBrowseAll = Browse_All;
                            searchListYourTopGenres = Your_Top_Genres;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(
                      color: AppColors.secondaryColor, // Change text color here
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 30),
                      child: Text(
                        AppLocalizations.of(context)!.top_genres,
                        style: GoogleFonts.varelaRound(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    GridView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      // Disables scrolling.
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        childAspectRatio:
                        (1 / .6), // Aspect ratio of each grid item
                      ),
                      shrinkWrap: true,
                      children:
                      List.generate(searchListYourTopGenres.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, bottom: 1),
                            decoration: BoxDecoration(
                                color: searchListYourTopGenres[index]['themeColor'],
                                borderRadius: BorderRadius.circular(5)),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Text(
                                        searchListYourTopGenres[index]['genre'].toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: GoogleFonts.varelaRound(color: Colors.white)
                                    )),
                                Positioned(
                                    right: -10,
                                    bottom: -10,
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      child: Transform.rotate(
                                        angle: pi / 6,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(7),
                                          child: Image.asset("genre/"+searchListYourTopGenres[index]['image'],
                                            fit: BoxFit.contain,),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 50),
                      child: Text(
                        AppLocalizations.of(context)!.browse_all,
                        style: GoogleFonts.varelaRound(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    GridView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      // Disables scrolling.
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (1 / .6),
                      ),
                      shrinkWrap: true,
                      children: List.generate(searchListBrowseAll.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, bottom: 1),
                            decoration: BoxDecoration(
                                color: searchListBrowseAll[index]["color"],
                                borderRadius: BorderRadius.circular(5)),
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Text(
                                      searchListBrowseAll[index]["name"],
                                      style: const TextStyle(color: Colors.white),
                                    )),
                                Positioned(
                                    right: -10,
                                    bottom: -10,
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      child: Transform.rotate(
                                        angle: pi / 6,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(7),
                                          child: Image.asset(
                                            "assets/${Browse_All[index]["image"]}",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
