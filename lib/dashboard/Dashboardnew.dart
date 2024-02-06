import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../USER/UserNotification.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var Name1;
  var Mobile;
  var department;
  var Email;
  var Year;
  var college;
  void initState() {
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      Name1 = spref.getString('name');
      Email = spref.getString("email");
      Mobile = spref.getString("phone");
      college = spref.getString("collage");
      department = spref.getString("Department");
      Year = spref.getString("Year");

      spref.setString('name', Name1);
      spref.setString("email", Email);
      spref.setString("phone", Mobile);
      spref.setString("collage", college);
      spref.setString("Department", department);
      spref.setString("Year", Year);
    });
    print("Updated");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text("Hi",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
              Text(Name1,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserNotification(),
                      ));
                },
                icon: Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                ))
          ]),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Row(children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              )),
        ]),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // color of shadow
                    spreadRadius: 2, // spread radius
                    blurRadius: 2, // blur radius
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    height: 120,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/EMPLOYIBILITY.png"),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Employibility",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
