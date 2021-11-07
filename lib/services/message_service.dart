import 'package:freedomcity/models/message.dart';
import 'package:http/http.dart' as http;

class MessageService {
  String baseUrl;
  http.Client client;

  MessageService({
    required this.client,
    required this.baseUrl,
  });

  Future<List<Message>> list() =>
      client.get(Uri.parse("$baseUrl/messages")).then((response) {
        if (response.statusCode == 200) {
          return MessageList.fromJson(response.body);
        } else {
          throw Exception(response.body);
        }
      });
}
