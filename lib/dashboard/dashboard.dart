import 'package:flutter/material.dart';

import 'appBarpage.dart';

class DashboardOne extends StatefulWidget {
  const DashboardOne({Key? key}) : super(key: key);

  @override
  State<DashboardOne> createState() => _DashboardOne();
}

class _DashboardOne extends State<DashboardOne> {
  String name = 'Ajay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 60,
        color: Colors.transparent,
        child: Row(children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_circle_right_rounded,
                size: 30,
              ))
        ]),
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0), child: AppBbbar(name: name)),
      body: ListView(children: [
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: LoginContainer(
              name: 'Computer Science',
              image: 'assets/dashImage.jpg',
            ),
          ),
        ),
      ]),
    );
  }
}
