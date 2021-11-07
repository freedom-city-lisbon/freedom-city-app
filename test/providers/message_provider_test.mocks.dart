// Mocks generated by Mockito 5.0.16 from annotations
// in freedomcity/test/providers/message_provider_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:freedomcity/models/message.dart' as _i5;
import 'package:freedomcity/services/message_service.dart' as _i3;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeClient_0 extends _i1.Fake implements _i2.Client {}

/// A class which mocks [MessageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMessageService extends _i1.Mock implements _i3.MessageService {
  MockMessageService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get baseUrl =>
      (super.noSuchMethod(Invocation.getter(#baseUrl), returnValue: '')
          as String);
  @override
  set baseUrl(String? _baseUrl) =>
      super.noSuchMethod(Invocation.setter(#baseUrl, _baseUrl),
          returnValueForMissingStub: null);
  @override
  _i2.Client get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeClient_0()) as _i2.Client);
  @override
  set client(_i2.Client? _client) =>
      super.noSuchMethod(Invocation.setter(#client, _client),
          returnValueForMissingStub: null);
  @override
  _i4.Future<List<_i5.Message>> list() =>
      (super.noSuchMethod(Invocation.method(#list, []),
              returnValue: Future<List<_i5.Message>>.value(<_i5.Message>[]))
          as _i4.Future<List<_i5.Message>>);
  @override
  String toString() => super.toString();
}