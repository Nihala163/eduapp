import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({super.key});

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: Container(
              color: Colors.white,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("MAtter",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(width: 350.w, child: Text("Content")),
                    )
                  ],
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
