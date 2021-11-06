import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<MessageProvider>(context).fetchMessages();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: const Center(),
    );
  }
}
