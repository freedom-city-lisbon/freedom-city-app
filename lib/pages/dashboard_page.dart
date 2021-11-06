import 'package:flutter/material.dart';
import 'package:freedomcity/pages/messages_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Freedom City"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Messages"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MessagesPage()),
            );
          },
        ),
      ),
    );
  }
}
