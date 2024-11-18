import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://192.168.68.207/insert_record.php';

  static Future<void> submitRequest(
      String name,
      // String phoneNumber,
      // String address,
      // String state,
      // String postalCode,
      // String email,
      // String pickupDate,
      // String additionalInformation
      
      ) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        body: {
          'name': name,
          // 'phoneNumber': phoneNumber,
          // 'address': address,
          // 'state': state,
          // 'postalCode': postalCode,
          // 'email': email,
          // 'pickupDate': pickupDate,
          // 'additionalInformation': additionalInformation,
        },
      );
      if (response.statusCode == 200) {
        print("Data submitted: ${response.body}");
      } else {
        print("Failed to submit data: ${response.body}");
      }
    } catch (e) {
      print("Error submitting data: $e");
    }
  }
}
