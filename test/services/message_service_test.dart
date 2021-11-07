import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freedomcity/models/message.dart';
import 'package:freedomcity/services/message_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'message_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient client;
  late Uri url;
  late MessageService service;

  setUp(() {
    client = MockClient();
    url = Uri.parse("http://localhost/messages");
    service = MessageService(baseUrl: "http://localhost", client: client);
  });

  tearDown(() {
    client.close();
  });

  group("$MessageService", () {
    test("Returns a list of messages", () async {
      when(client.get(url)).thenAnswer(
        (_) async => http.Response(
          '[{"title": "Title 1", "body": "Body 1"}, {"title": "Title 2", "body": "Body 2"}]',
          200,
        ),
      );

      var actual = await service.list();
      var expected = List.of(<Message>{
        Message(title: "Title 1", body: "Body 1"),
        Message(title: "Title 2", body: "Body 2"),
      });

      expect(listEquals(actual, expected), isTrue);
    });

    test("Throws an exception when server response is not 200", () async {
      when(client.get(url))
          .thenAnswer((_) async => http.Response('{"error": "error"}', 500));

      expect(() async => await service.list(), throwsException);
    });
  });
}
