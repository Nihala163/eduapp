import 'package:flutter/material.dart';

class Total_videos extends StatefulWidget {
  const Total_videos({super.key});

  @override
  State<Total_videos> createState() => _Total_videosState();
}

class _Total_videosState extends State<Total_videos> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      
      child: Scaffold(
        body: Column(children: [
          TabBar(tabs: [Tab(child: Text('Video')),
            Tab(child: Text('Premium')),])
        ]),
        
      
      ),
    );
  }
}
