import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String mainTitle = "";

  Future<void> _getData() async {
    String urlString = "https://jsonplaceholder.typicode.com/albums/1/";

    Uri uri = Uri.parse(urlString);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseDecoded = jsonDecode(response.body) as Map<String, dynamic>;
      String title = responseDecoded["title"];
      print("Result: " + title);
      setState(() {
        mainTitle = title;
      });
    } else {
      // Handle the error case
      print('Failed to load data');
    }
  }

  Future<void> _getListData() async {
    String urlString = "https://jsonplaceholder.typicode.com/albums/";

    Uri uri = Uri.parse(urlString);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseDecoded = jsonDecode(response.body) as List;
      // Assuming you want to display the title of the first album in the list
      String title = responseDecoded.isNotEmpty
          ? responseDecoded[0]["title"]
          : 'No albums found';
      print("List Result: " + title);
      setState(() {
        mainTitle = title;
      });
    } else {
      // Handle the error case
      print('Failed to load list data');
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
    _getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(mainTitle), // Use variable mainTitle
      ),
    );
  }
}
