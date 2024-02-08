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
                  textcolor: Colors.purple),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.monetization_on,color: Colors.amber),
              label: Row(
                children: [
                  AppText(
                      text: "Premium",
                      weight: FontWeight.w400,
                      size: 4,
                      textcolor: Colors.amber),SizedBox(width: 10,),Icon(Icons.workspace_premium,color: Colors.amber,)
                ],
              ),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.currency_rupee,color: Colors.blueAccent),
              label: Row(
                children: [
                  AppText(
                      text: "Payment",
                      weight: FontWeight.w400,
                      size: 4,
                      textcolor: Colors.blueAccent),SizedBox(width: 10,),
                ],
              ),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.notification_add,color: Colors.yellow),
              label: AppText(
                  text: "Notification",
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
    //   case 4:
    //     return ();
      default:
        return Container();
    }
  }
}

class AppText extends StatelessWidget {
  const AppText(
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
      body:Row(children: [
     Expanded(child: SizedBox(
child: Padding(
  padding: const EdgeInsets.only(left: 20),
  child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    AppText(text: "Hi Admin.........", weight: FontWeight.w600, size: 5, textcolor:Colors.black),
        SizedBox(height: 10,),
        SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network("https://wpmanageninja.com/wp-content/uploads/2022/12/EdTech-1.png",width:600,),
          ),
        ),
        SizedBox(height: 50,),
        Expanded(child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5.0,
                offset: const Offset(0.0, 3.0)),
          ], borderRadius: BorderRadius.circular(15).r, color: Colors.white),
        )
        )
  ]),
),
     )
     ),
        Expanded(
          child: Container(color: Colors.white,child:
              Padding(
                padding: const EdgeInsets.only(top: 30,left:50,bottom: 350,right: 50),
                child: Container(decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.purple.shade100.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0.0, 3.0)),
                ],borderRadius: BorderRadius.circular(10)),
                  child:
                          Column(
                            children: [Row(children: [Padding(
                padding: const EdgeInsets.only(left: 90,top: 40,right:10),
                child: VideoBox(name: "students", img: "https://cdn-icons-png.flaticon.com/128/3402/3402259.png",
                  count: "10", click:() {

                  },),
                            ),
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 40),
                  child: VideoBox(name: "Videos", img: "https://cdn-icons-png.flaticon.com/128/514/514835.png",
                    count: "10", click: () {

                    },),
                ),


                            ],),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20,left: 90,right: 10),
                    child: VideoBox(name: "Premium ", img: "https://cdn-icons-png.flaticon.com/128/1458/1458256.png",
                      count: "100", click: () {

                      },),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 40),
                    child: VideoBox(name: "Premium ", img: "https://cdn-icons-png.flaticon.com/128/1458/1458256.png",
                      count: "100", click: () {

                      },),
                  ),
                ],)

                          ],),),
              )

                 ),
        )
      ],)
    );
  }
}

class VideoBox extends StatelessWidget {
  const VideoBox({
    super.key,
    required this.name,
    required this.img,
    required this.count,
    required this.click,
  });
  final String? name;
  final String? img;
  final String? count;
  final void Function() click;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        height: 120.h,
        width: 50.w,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5.0,
              offset: const Offset(0.0, 3.0)),
        ], borderRadius: BorderRadius.circular(15).r, color: Colors.white),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppText(
              text: name.toString(),
              weight: FontWeight.w500,
              size: 4,
              textcolor: Colors.black),
          Image.network(
            img.toString(),
            width: 13.w,
          ),
          AppText(
              text: count.toString(),
              weight: FontWeight.w600,
              size: 5,
              textcolor: Colors.black),
        ]),
      ),
    );
  }
}

