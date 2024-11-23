// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:recycle_hub_bd/scrap.dart';

// class OTPScreen extends StatefulWidget {
//   final String verificationId;
//   OTPScreen({super.key, required this.verificationId});

//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   TextEditingController otpController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green.shade700,
//         title: Text("OTP Verification", style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Enter OTP", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),
//             TextField(
//               controller: otpController,
//               keyboardType: TextInputType.number,
//               textAlign: TextAlign.center,
//               maxLength: 6,
//               decoration: InputDecoration(
//                 counterText: "",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(color: Colors.grey.shade400),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.green.shade600),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   String smsCode = otpController.text.trim();
//                   PhoneAuthCredential credential =
//                       await PhoneAuthProvider.credential(
//                           verificationId: widget.verificationId,
//                           smsCode: smsCode);
//                   FirebaseAuth.instance
//                       .signInWithCredential(credential)
//                       .then((value) {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => OTPSuccessPage()));
//                   });
//                 } catch (ex) {
//                   print(ex);
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green.shade700,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//               ),
//               child: Text(
//                 "Login",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Resend PIN",
//                 style: TextStyle(color: Colors.green.shade700, fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class OTPSuccessPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green.shade700,
//         title: Text("OTP Success", style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.check_circle_outline,
//               color: Colors.green.shade700,
//               size: 100,
//             ),
//             SizedBox(height: 20),
//             Text(
//               "OTP Verified Successfully!",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green.shade700,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//               ),
//               child: Text(
//                 "Continue",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
