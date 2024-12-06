```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      //Handle different status codes with specific error messages
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  } on SocketException catch (e) {
    // Handle network errors separately
    print('Network error: $e');
    return null; // Or throw a custom exception
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('JSON decoding error: $e');
    return null; // Or throw a custom exception
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; //Rethrow for handling at a higher level
  }
}
```