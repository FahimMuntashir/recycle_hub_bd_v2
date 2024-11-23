// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiService {
//   static const String _baseUrl = "http://192.168.0.8/recycle_hub_api/insert_record.php";

//   static Future<void> submitPickupRequest(Map<String, String> data) async {
//     try {
//       final response = await http.post(
//         Uri.parse(_baseUrl),
//         headers: {
//           // 'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: data,
//       );

//       if (response.statusCode == 200) {
//         print("Pickup request submitted successfully.");
//       } else {
//         print("Failed to submit pickup request: ${response.statusCode} ${response.body}");
//       }
//     } catch (e) {
//       print("Error occurred: $e");
//     }
//   }
// }
