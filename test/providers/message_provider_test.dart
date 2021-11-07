import 'package:flutter_test/flutter_test.dart';
import 'package:freedomcity/models/message.dart';
import 'package:freedomcity/providers/message_provider.dart';
import 'package:freedomcity/services/message_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'message_provider_test.mocks.dart';

/// Mocks a callback function on which you can use verify
class MockCallbackFunction extends Mock {
  call();
}

@GenerateMocks([MessageService])
void main() {
  late MessageService service;
  late MessageProvider provider;
  final notifyListenerCallback = MockCallbackFunction();

  setUp(() {
    service = MockMessageService();
    provider = MessageProvider(service: service)..addListener(notifyListenerCallback);
    reset(notifyListenerCallback);
  });

  group('$MessageProvider', () {
    test("Has default false loading and empty messages", () {
      expect(provider.isLoading(), isFalse);
      expect(provider.getError(), isEmpty);
      expect(provider.getMessages(), isEmpty);
    });

    test("Toggles loading and sets messages", () async {
      var messages = List.of(<Message>{
        Message(title: "Title 1", body: "Body 1"),
        Message(title: "Title 2", body: "Body 2"),
      });
      when(service.list()).thenAnswer((_) async => messages);
      var future = provider.fetchMessages();

      expect(provider.isLoading(), isTrue);
      verify(notifyListenerCallback()).called(1);

      await future;
      expect(provider.isLoading(), isFalse);
      expect(provider.getError(), isEmpty);
      expect(provider.getMessages(), equals(messages));
      verify(notifyListenerCallback()).called(1);
    });

    test("Sets error on exception", () async {
      when(service.list()).thenAnswer((_) async => Future.error("Error"));
      var future = provider.fetchMessages();

      expect(provider.isLoading(), isTrue);
      verify(notifyListenerCallback()).called(1);

      await future;

      expect(provider.isLoading(), isFalse);
      expect(provider.getError(), isNotEmpty);
      expect(provider.getMessages(), isEmpty);
      verify(notifyListenerCallback()).called(1);
    });
  });
}
