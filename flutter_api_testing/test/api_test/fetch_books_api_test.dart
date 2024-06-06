import 'package:flutter_api_testing/fetch_books.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fetch_books_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
  });

  tearDown(() {
    mockClient.close();
  });

  group("Fetch Books API Call Test -", () {
    test("Return Books - Success", () async {
      when(mockClient.get(Uri.parse(fetchBooksURL))).thenAnswer(
          (realInvocation) async => http.Response(
              '[{"name": "The 5 Second Rule","auther": "Mel Robbins"}]', 200));

      //Act & Assert
      expect(await fetchBooks(mockClient), isA<List<BooksListModel>>());
    });

    test("Exception - Error", () async {
      when(mockClient.get(Uri.parse(fetchBooksURL))).thenAnswer(
          (realInvocation) async => http.Response('Not Found', 404));

      //Act & Assert
      expect(fetchBooks(mockClient), throwsException);
    });
  });
}
