import 'package:eduapp/Youtube/videohome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Premium/Premium video home.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({super.key});

  @override
  State<AdminDash> createState() => _AdminDashState();
}

bool isExpanded = false;
int _selectedIndex = 0;

class _AdminDashState extends State<AdminDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6f9),
      appBar: AppBar(
        backgroundColor: _selectedIndex==2?Colors.amber:Colors.purple,

        leading: IconButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        title: Text(
          "Admin Dashboard",
          style: TextStyle(
              color:  _selectedIndex==2?Colors.black:Colors.white, fontSize: 8.sp, fontWeight: FontWeight.w400),
        ),
        actions: [
          Container(
            height: 30.h,
            width: 20.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5).r,
                color: Colors.white,
                border: Border.all(color: Colors.white)),
            child: const Center(
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
        NavigationRail(
          extended: isExpanded,
          backgroundColor: Colors.white,
          unselectedIconTheme:
          const IconThemeData(color: Colors.grey, opacity: 2),
          unselectedLabelTextStyle: const TextStyle(
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
              icon: Icon(Icons.video_collection_outlined,color: Colors.purple,),
              label: AppText(
                  text: "Video",
                  weight: FontWeight.w400,
                  size: 4,
                  textcolor: Colors.black),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.monetization_on,color: Colors.amber),
              label: Row(
                children: [
                  AppText(
                      text: "Premium",
                      weight: FontWeight.w400,
                      size: 4,
                      textcolor: Colors.amber),
                  SizedBox(width: 10,),
                  Icon(Icons.workspace_premium,color: Colors.amber,)
                ],
              ),
            ),
            // NavigationRailDestination(
            //   icon: Icon(Icons.person),
            //   label: AppText(
            //       text: "Profile",
            //       weight: FontWeight.w400,
            //       size: 4,
            //       textcolor: Colors.black),
            // ),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        Expanded(child: _buildScreen())
      ]),
    );
  }

  Widget _buildScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return VideoHome();
    case 2:
      return Premuim_VideoHome();
    // case 3:
    //   return ProfileScreen();
      default:
        return Container();
    }
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("home"),
    );
  }
}

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpansionTile(title: Text("Click"), children: [Text("Add Video")]),
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