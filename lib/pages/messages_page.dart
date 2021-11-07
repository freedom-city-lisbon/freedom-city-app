import 'package:flutter/material.dart';
import 'package:freedomcity/models/message.dart';
import 'package:freedomcity/services/message_service.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key, required this.service}) : super(key: key);

  final MessageService service;

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  late Future<List<Message>> futureMessages;

  @override
  void initState() {
    super.initState();
    futureMessages = widget.service.list();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: Center(
        child: FutureBuilder<List<Message>>(
          future: futureMessages,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data!;
              // return Text("Messages: ${snapshot.data!.length}");
              return ListView.separated(
                padding: const EdgeInsets.only(top: 10),
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  );
                },
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          items[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          items[index].body,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
