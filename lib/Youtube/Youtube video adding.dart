import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<String> videoLinks = [];
  List<String> Studentclass = [
    "Electrician",
    "Fitter",
    "Welder",
    "Turner",
    "Machinist",
    "Mechanic (Motor Vehicle)",
    "COPA",
    "Instrument Mechanic",
    "Electronics Mechanic",
    "Plumber",
    "Carpenter",
    "Draughtsman (Civil/Mechanical)",
    "Surveyor",
    //"Refrigeration and Air Conditioning Mechanic",
    "Mechanic Diesel Engine",
    "Mechanic Radio and Television",
    //"Stenographer and Secretarial Assistant (English/Hindi)",
    "Cutting and Sewing",
    "Hair and Skin Care",
    "Food Production (General)",
    //"Food and Beverage Service Assistant",
    "Health Sanitary Inspector",
  ];
  List year = ['1st Yr', '2nd yr'];
  List<String> Subject = ["Cad", "Auto Mobile", "Es"];
  String? selectedSyear;
  String? selectedSclass;
  String? selectedSsub;
  final Tradecontollor = TextEditingController();
  final Yearcontollor = TextEditingController();
  final Subjectcontollor = TextEditingController();
  final addTradeControllor = TextEditingController();
  TextEditingController linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6f9),
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.only(right: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: linkController,
                decoration: const InputDecoration(
                    labelText: 'Enter YouTube Video Link',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  DropdownMenu(
                    inputDecorationTheme: InputDecorationTheme(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.h),
                        border: OutlineInputBorder()),
                    hintText: "Select Trade",
                    menuStyle: const MenuStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    controller: Tradecontollor,
                    enableFilter: true,
                    enableSearch: true,
                    requestFocusOnTap: true,
                    dropdownMenuEntries: Studentclass.map(
                        (e) => DropdownMenuEntry(value: e, label: e)).toList(),
                    onSelected: (value) {
                      setState(() {
                        selectedSclass = value;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Add Trade'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  TextFormField(
                                    controller: addTradeControllor,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('TradeCollection')
                                          .add({
                                        'trade': addTradeControllor.text.trim()
                                      });
                                    },
                                    child: Text("Add Trade"),
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            ContinuousRectangleBorder())),
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("+"),
                    shape: CircleBorder(),
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DropdownMenu(
                inputDecorationTheme: InputDecorationTheme(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                    border: OutlineInputBorder()),
                hintText: "Select Trade",
                menuStyle: const MenuStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                controller: Yearcontollor,
                enableFilter: true,
                enableSearch: true,
                requestFocusOnTap: true,
                dropdownMenuEntries: year
                    .map((e) => DropdownMenuEntry(value: e, label: e))
                    .toList(),
                onSelected: (value) {
                  setState(() {
                    selectedSclass = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              DropdownMenu(
                inputDecorationTheme: InputDecorationTheme(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                    border: OutlineInputBorder()),
                hintText: "Select Subject",
                menuStyle: const MenuStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                controller: Subjectcontollor,
                enableFilter: true,
                enableSearch: true,
                requestFocusOnTap: true,
                dropdownMenuEntries:
                    Subject.map((e) => DropdownMenuEntry(value: e, label: e))
                        .toList(),
                onSelected: (value) {
                  setState(() {
                    selectedSclass = value;
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
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
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Dropdown Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String selectedCategory = '';
//   List<String> categories = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchCategories();
//   }
//
//   Future<void> fetchCategories() async {
//     // Assume 'categories' is the collection name in Firestore
//     QuerySnapshot<Map<String, dynamic>> snapshot =
//     await FirebaseFirestore.instance.collection('categories').get();
//
//     // Extract 'name' field from each document and populate the categories list
//     List<String> tempCategories = snapshot.docs
//         .map((DocumentSnapshot<Map<String, dynamic>> doc) => doc['name'] as String)
//         .toList();
//
//     setState(() {
//       categories = tempCategories;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Dropdown Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             DropdownButton<String>(
//               value: selectedCategory,
//               hint: Text('Select a category'),
//               onChanged: (String newValue) {
//                 setState(() {
//                   selectedCategory = newValue;
//                 });
//               },
//               items: categories.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20),
//             Text('Selected Category: $selectedCategory'),
//           ],
//         ),
//       ),
//     );
//   }
//}
// Future<void> _showMyDialog(BuildContext context) async {
//
// }
