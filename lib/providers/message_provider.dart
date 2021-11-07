import 'package:flutter/cupertino.dart';
import 'package:freedomcity/models/message.dart';
import 'package:freedomcity/services/message_service.dart';

class MessageProvider with ChangeNotifier {
  MessageService service;
  List<Message>? _messages;
  String? _error;
  bool _loading = false;

  MessageProvider({
    required this.service,
  });

  fetchMessages() {
    _loading = true;
    notifyListeners();

    service.list().then((result) {
      _error = null;
      _messages = result;
    }).catchError((error, stackTrace) {
      _error = "There was an error loading the messages";
    }).whenComplete(() {
      _loading = false;
      notifyListeners();
    });
  }

  bool isLoading() {
    return _loading;
  }

  List<Message> getMessages() {
    return _messages ?? List.empty();
  }

  String getError() {
    return _error ?? '';
  }
}
