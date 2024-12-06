```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the data successfully
      final jsonData = json.decode(response.body);
      // Use jsonData
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle exceptions, including network errors
    print('Error: $e');
    //Consider rethrowing the exception to be handled at a higher level
    rethrow;
  }
}
```