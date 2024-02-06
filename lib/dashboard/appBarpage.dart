import 'package:flutter/material.dart';

class AppBbbar extends StatelessWidget {
  const AppBbbar({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      title: Text(
        'HI $name',
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
      ),
      // centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_on_outlined,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    );
  }
}

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
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
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.fill),
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w800),
          ),
        )
      ]),
    );
  }
}

class SubjectContainerrr extends StatelessWidget {
  const SubjectContainerrr({
    super.key,
    required this.subname,
    required this.subimage,
  });

  final String subname;
  final String subimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Container(
              height: 120,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        subimage,
                      ),
                      fit: BoxFit.fill),
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subname,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
