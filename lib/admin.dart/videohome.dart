import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'new.dart';

class VideoHome extends StatelessWidget {
  const VideoHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff5f6f9),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(
          width: double.infinity,
          height: size.height / 5,
          color: Colors.white,
          child:  Padding(
            padding: const EdgeInsets.only(right: 1200,top:50,bottom: 50 ,left: 50),
            child: Container(
              height: 30.h,
              width: 20.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5).r,
                  color: Colors.white,
                  border: Border.all(color: Colors.black)),
              child: const Center(
                child: AppText(
                    text: "Add Video",
                    weight: FontWeight.w400,
                    size: 3,
                    textcolor: Colors.black),
              ),
            ),
          ),),
         SizedBox(height: 20,),
         AppText(text: "All Videos", weight: FontWeight.w500, size: 8, textcolor: Colors.black),
            SizedBox(height: 20,),
         Expanded(
           child: ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Text("VIDEO NAME"),tileColor: Colors.grey,trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),),
            );
                   },itemCount: 20,),
         )
      ]),
    );
  }
}