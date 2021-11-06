import 'package:flutter/cupertino.dart';
import 'package:freedomcity/models/message.dart';
import 'package:http/http.dart' as http;

class MessageProvider with ChangeNotifier {
  String baseUrl;
  List<Message>? messages;
  String? error;
  bool loading = false;

  MessageProvider({
    required this.baseUrl,
  });

  fetchMessages() {
    setLoading(true);
    http.get(Uri.parse("$baseUrl/messages")).then((response) {
      setLoading(false);
      if (response.statusCode == 200) {
        setMessages(MessageList.fromJson(response.body));
      } else {
        setError("There was an error fetching the messages");
      }
    });
  }

  bool isLoading() {
    return loading;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setMessages(value) {
    messages = value;
    notifyListeners();
  }

  List<Message> getMessages() {
    return messages ?? List.empty(); //returns the fetched user
  }

  void setError(value) {
    error = value;
    notifyListeners();
  }

  String getError() {
    return error ?? '';
  }
}
