import 'package:eduapp/dashboard/appBarpage.dart';
import 'package:flutter/material.dart';

class DashTwo extends StatefulWidget {
  const DashTwo({super.key});

  @override
  State<DashTwo> createState() => _DashTwoState();
}

class _DashTwoState extends State<DashTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_sharp,
              size: 30,
            )),
      ),
      body: Column(
        children: [
          SubjectContainerrr(
            subname: 'English',
            subimage: 'assets/dashImage.jpg',
          ),
        ],
      ),
    );
  }
}
