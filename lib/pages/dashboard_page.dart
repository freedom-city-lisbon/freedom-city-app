import 'package:flutter/material.dart';
import 'package:freedomcity/config.dart';
import 'package:freedomcity/pages/messages_page.dart';
import 'package:freedomcity/services/message_service.dart';
import 'package:http/http.dart' as http;

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
              MaterialPageRoute(builder: (context) => MessagesPage(service: MessageService(baseUrl: config.baseUrl, client: http.Client()))),
            );
          },
        ),
      ),
    );
  }
}
