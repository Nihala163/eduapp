import 'package:eduapp/Youtube/Youtube%20video%20adding.dart';
import 'package:eduapp/admin.dart/videohome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'adminDash.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //setting the expansion function for the navigation rail
  bool isExpanded = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f6f9),
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              )),
          title: Text(
            "EduPort",
            style: TextStyle(
                color: Colors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.w400),
          ),
          actions: [
            Container(
              height: 30.h,
              width: 20.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5).r,
                  color: Colors.white,
                  border: Border.all(color: Colors.white)),
              child: Center(
                child: AppText(
                    text: "Logout",
                    weight: FontWeight.w400,
                    size: 3,
                    textcolor: Colors.black),
              ),
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
        body: Row(children: [
          //Let's start by adding the Navigation Rail
          NavigationRail(
            extended: isExpanded,
            backgroundColor: Colors.white,
            unselectedIconTheme: IconThemeData(color: Colors.grey, opacity: 2),
            unselectedLabelTextStyle: TextStyle(
              color: Colors.white,
            ),
            selectedIconTheme: IconThemeData(
              color: Colors.black,
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: AppText(
                    text: "Home",
                    weight: FontWeight.w400,
                    size: 4,
                    textcolor: Colors.black),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart),
                label: AppText(
                    text: "Video",
                    weight: FontWeight.w400,
                    size: 4,
                    textcolor: Colors.black),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: AppText(
                    text: "Quiz",
                    weight: FontWeight.w400,
                    size: 4,
                    textcolor: Colors.black),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: AppText(
                    text: "Profile",
                    weight: FontWeight.w400,
                    size: 4,
                    textcolor: Colors.black),
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(child: _buildScreen())
        ]));
  }

  Widget _buildScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return VideoHome();
      case 2:
        return MaterialScreen();
      case 3:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("home"),
    );
  }
}

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("video"),
    );
  }
}

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("note"),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("profile"),
    );
  }
}
class AppText extends StatelessWidget {
  const AppText(
      //Custom Text Widget.....
          {super.key,
        required this.text,
        required this.weight,
        required this.size,
        required this.textcolor});

  final String text;
  final FontWeight weight;
  final double size;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: size.sp, color: textcolor, fontWeight: weight),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
