import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.receviedUser});
  var receviedUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(receviedUser["avatar"]),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(receviedUser["first_name"]),
                const SizedBox(
                  width: 5,
                ),
                Text(receviedUser["last_name"])
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(receviedUser["email"]),
          ],
        ),
      ),
    );
  }
}
