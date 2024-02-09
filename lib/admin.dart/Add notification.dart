import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:eduapp/Youtube/Admin%20panal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Admin login/app colors.dart';
import '../Admin login/app stayles.dart';


class Adminaddnotification extends StatefulWidget {
  const Adminaddnotification({super.key});

  @override
  State<Adminaddnotification> createState() => _AdminaddnotificationState();
}

class _AdminaddnotificationState extends State<Adminaddnotification> {
  var entermatter = TextEditingController();
  var entercontent = TextEditingController();
  var addlink = TextEditingController();
  final date = new DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  Future<dynamic> addnotifications() async {
    await FirebaseFirestore.instance.collection('notification').add({
      "matter": entermatter.text,
      "content": entercontent.text,
      "Link": addlink.text,
      'Time': time.format(context),
      'date': DateFormat('dd/MM/yyyy').format(date)
    });
    // Navigator.pushReplacement(context, MaterialPageRoute(
    //   builder: (context) {
    //     return AdminDash();
    //   },
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 600,
          width: 500,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5.0,
                    offset: const Offset(0.0, 5.0)),
              ],
              borderRadius: BorderRadius.circular(10).r,
              color: Colors.purple[50]),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'Enter Matter',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: entermatter,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Matter',
                      hintStyle: ralewayStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blueDarkColor.withOpacity(0.5),
                        fontSize: 12.0,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      border: const OutlineInputBorder()),
                ),
              ),

              //=======================================================================================================================================================
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'Enter Content',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: entercontent,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Content',
                      hintStyle: ralewayStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blueDarkColor.withOpacity(0.5),
                        fontSize: 12.0,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 15).r,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      border: const OutlineInputBorder()),
                ),
              ),

              //=======================================================================================================================================================

              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  'Add Link',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: addlink,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      suffixIcon: Icon(CupertinoIcons.link),
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      border: const OutlineInputBorder()),
                ),
              ),

              //=======================================================================================================================================================

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        addnotifications();
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 5.0,
                                  offset: const Offset(0.0, 5.0)),
                            ],
                            borderRadius: BorderRadius.circular(10).r,
                            color: Colors.purple),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
