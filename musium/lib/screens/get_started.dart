import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musium/screens/LogInPage.dart';
import 'package:musium/utils/app_colors.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  List<Widget> list = [
    RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.varelaRound(fontSize: 30.0, color: Colors.white),
        children: [
          TextSpan(
            text: 'From the ',
          ),
          TextSpan(
            text: ' latest',
            style: GoogleFonts.varelaRound(color: AppColors.tertiaryColor),
          ),
          TextSpan(text: ' to the'),
          TextSpan(
            text: ' greatest',
            style: GoogleFonts.varelaRound(color: AppColors.tertiaryColor),
          ),
          TextSpan(
            text: ' hits, Play your favorite tracks on ',
          ),
          TextSpan(
            text: ' musium',
            style: GoogleFonts.varelaRound(
              color: AppColors.tertiaryColor,
            ),
          ),
          TextSpan(
            text: ' now!',
          ),
        ],
      ),
    ),
    RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.varelaRound(fontSize: 30.0, color: Colors.white),
        children: [
          TextSpan(
            text: 'From the ',
          ),
          TextSpan(
            text: ' latest',
            style: GoogleFonts.varelaRound(color: AppColors.tertiaryColor),
          ),
          TextSpan(text: ' to the'),
          TextSpan(
            text: ' greatest',
            style: GoogleFonts.varelaRound(color: AppColors.tertiaryColor),
          ),
          TextSpan(
            text: ' hits, Play your favorite tracks on ',
          ),
          TextSpan(
            text: ' musium',
            style: GoogleFonts.varelaRound(
              color: AppColors.tertiaryColor,
            ),
          ),
          TextSpan(
            text: ' now!',
          ),
        ],
      ),
    ),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiaryColor,
      body: Column(
        children: [
          Expanded(
              child: Image.asset('assets/img_girl.png')),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: AppColors.secondaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      disableCenter: true,
                        onPageChanged: (index, _) {
                          setState(() {
                            _currentIndex = index;
                          });
                        }
                    ),
                    items: list
                        .map((item) => Container(
                      margin: EdgeInsets.only(top: 30),
                              child: item,
                            ))
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(list.length, (index) {
                      return Container(
                        width: 60.0,
                        height: 5.0,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: _currentIndex == index
                              ? AppColors.tertiaryColor
                              : Colors.white,
                        ),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 30, left: 30),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage(),));
                              },
                              child: Container(
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  child: Text(
                                    "Get Started",
                                    style: GoogleFonts.varelaRound(
                                        color: Colors.white),
                                  )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.tertiaryColor,
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
