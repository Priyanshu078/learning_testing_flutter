import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:testingsample1/fetch_album.dart';
import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("fetchAlbum", () {
    test('returns an album if http call completed successfully', () async {
      final client = MockClient();

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async {
        return http.Response(
            '{"userId": 1, "id": 1, "title": "PriyanshuPaliwal"}', 200);
      });

      expect(await fetchAlbum(client), isA<Album>());
    });
    test('returns an exception if http call completes with an exception',
        () async {
      final client = MockClient();

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async {
        return http.Response('Not Found', 404);
      });

      expect(fetchAlbum(client), throwsException);
    });
  });
}
