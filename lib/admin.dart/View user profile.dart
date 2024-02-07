import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';


class Viewuserprofile extends StatefulWidget {
  Viewuserprofile({super.key, this.id});
  final id;
  @override
  State<Viewuserprofile> createState() => _ViewuserprofileState();
}

class _ViewuserprofileState extends State<Viewuserprofile> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        surfaceTintColor: Colors.purple,
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white70,

      //==========================================================================================================

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("UserRegister")
                .doc(widget.id)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              return Center(
                child: Container(
                  width: 800,height: 600,decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5.0,
                          offset: const Offset(0.0, 5.0)),
                    ],
                    borderRadius: BorderRadius.circular(10).r,
                    color: Colors.white),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      CircleAvatar(
                        radius: 55.r,
                        child: Image.network(
                            'https://cdn0.iconfinder.com/data/icons/kameleon-free-pack-rounded/110/Student-3-1024.png'),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          snapshot.data!['Name'],
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20).r,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 50.h,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                      width: 150.w,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Student Name",
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            ':',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 200.w,
                                        height: 50.h,
                                        child: Text(
                                          snapshot.data!['Name'],
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            //======================================================================================================================
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                                height: 50.h,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                      width: 150.w,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "E-mail",
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            ':',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 200.w,
                                        height: 50.h,
                                        child: Text(
                                          snapshot.data!['Email'],
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            //======================================================================================================================

                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                                height: 50.h,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                      width: 150.w,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Phone Number",
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            ':   ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 200.w,
                                        height: 50.h,
                                        child: Text(
                                          snapshot.data!['Phone number'],
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            //======================================================================================================================

                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                                height: 50.h,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                      width: 150.w,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "College",
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            ':   ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 200.w,
                                        height: 50.h,
                                        child: Text(
                                          snapshot.data!['College'],
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            //======================================================================================================================
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                                height: 50.h,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                      width: 150.w,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Department",
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            ':   ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 200.w,
                                        height: 50.h,
                                        child: Text(
                                          snapshot.data!['Department'],
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            //======================================================================================================================
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                                height: 50.h,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                      width: 150.w,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Year",
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            ':   ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 200.w,
                                        height: 50.h,
                                        child: Text(
                                          snapshot.data!['Year'],
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            //======================================================================================================================

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 100.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 5.0,
                                        offset: const Offset(0.0, 5.0)),
                                  ],
                                  borderRadius: BorderRadius.circular(10).r,
                                  color: Colors.indigo[900]),
                              child: Center(
                                child: Text(
                                  "Back",
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     exportDataToExcel();
                      //   },
                      //   child: Text('Export to Excel'),
                      // ),

                      SizedBox(
                        height: 60.h,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
