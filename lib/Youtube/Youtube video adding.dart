import 'package:flutter/material.dart';



class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<String> videoLinks = [];

  TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: linkController,
              decoration: InputDecoration(labelText: 'Enter YouTube Video Link'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  videoLinks.add(linkController.text);
                  linkController.clear();
                });
              },
              child: Text('Add Video Link'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: videoLinks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(videoLinks[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
