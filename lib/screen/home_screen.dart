import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_api_app/screen/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data;
  Future getData() async {
    var response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
    setState(() {
      var decode = json.decode(response.body);
      data = decode["data"];
      print(data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(receviedUser: data[index])));
                  },
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(data[index]["avatar"]),
                  ),
                  title: Row(
                    children: [
                      Text(data[index]["first_name"]),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(data[index]["last_name"]),
                    ],
                  ),
                  subtitle: Text(data[index]["email"]),
                  trailing: Text(data[index]["id"].toString()),
                ),
              );
            }),
      ),
    );
  }
}
