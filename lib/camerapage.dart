// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';

// // // class RecycleHubCameraApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Recycle Hub Camera',
// // //       theme: ThemeData(primarySwatch: Colors.green),
// // //       home: CameraPage(),
// // //     );
// // //   }
// // // }

// // class CameraPage extends StatefulWidget {
// //   @override
// //   _CameraPageState createState() => _CameraPageState();
// // }

// // class _CameraPageState extends State<CameraPage> {
// //   File? _image;
// //   final ImagePicker _picker = ImagePicker();

// //   // Function to take a picture
// //   Future<void> _takePicture() async {
// //     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
// //     if (pickedFile != null) {
// //       setState(() {
// //         _image = File(pickedFile.path);
// //       });
// //     }
// //   }

// //   // Mock function to calculate price of recyclable items
// //   String _projectPrice() {
// //     if (_image != null) {
// //       // Mock price calculation logic
// //       return "Estimated Value: \$5.00";
// //     } else {
// //       return "No image selected.";
// //     }
// //   }

// //   // Placeholder function for uploading the image
// //   Future<void> _uploadImage() async {
// //     if (_image == null) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text("Please capture an image first!")));
// //       return;
// //     }
// //     // Simulate a backend upload process
// //     ScaffoldMessenger.of(context)
// //         .showSnackBar(SnackBar(content: Text("Uploading image...")));
// //     await Future.delayed(Duration(seconds: 2));
// //     ScaffoldMessenger.of(context)
// //         .showSnackBar(SnackBar(content: Text("Upload Successful!")));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Recycle Hub Camera'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               'Take a picture of your recyclable items:',
// //               style: TextStyle(fontSize: 16.0),
// //             ),
// //             SizedBox(height: 20),
// //             _image == null
// //                 ? Text('No image selected.', style: TextStyle(fontSize: 14.0))
// //                 : Image.file(_image!),
// //             SizedBox(height: 20),
// //             ElevatedButton.icon(
// //               onPressed: _takePicture,
// //               icon: Icon(Icons.camera_alt),
// //               label: Text('Take Picture'),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton.icon(
// //               onPressed: _uploadImage,
// //               icon: Icon(Icons.upload),
// //               label: Text('Upload Image'),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               _projectPrice(),
// //               style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }





// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// typedef OnChanged = void Function(String value);



// class CameraPage extends StatefulWidget {
//   @override
//   _CameraPageState createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   XFile? _image;
//   final picker = ImagePicker();

//   Future<void> _getImage(ImageSource source) async {
//     final pickedFile = await picker.pickImage(source: source);

//     setState(() {
//       _image = pickedFile;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.green.shade700,
//         title: Text('Recycle Hub BD', style: TextStyle(fontWeight: FontWeight.bold)),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: _image == null
//                     ? Center(
//                         child: Text(
//                           'No image selected',
//                           style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
//                         ),
//                       )
//                     : ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.file(
//                           File(_image!.path),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//               ),
//               SizedBox(height: 15),
//               Row(
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () => _getImage(ImageSource.camera),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green.shade600,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     icon: Icon(Icons.camera_alt, color: Colors.white,),
//                     label: Text('Take Picture', style: TextStyle(color: Colors.white),),
                    
//                   ),
//                   SizedBox(width: 10),
//                   ElevatedButton.icon(
//                     onPressed: () => _getImage(ImageSource.gallery),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue.shade600,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     icon: Icon(Icons.upload_file, color: Colors.white,),
//                     label: Text('Upload Picture', style: TextStyle(color: Colors.white),),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Type of Scrap',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               SizedBox(height: 15),
//               ScrapInputField(label: 'Paper'),
//               ScrapInputField(label: 'Plastic'),
//               ScrapInputField(label: 'E-Waste'),
//               ScrapInputField(label: 'Glass'),
//               SizedBox(height: 25),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Add submit logic here
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green.shade700,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   ),
//                   child: Text(
//                     'Submit',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ScrapInputField extends StatefulWidget {
//   final String label;

//   ScrapInputField({required this.label});

//   @override
//   _ScrapInputFieldState createState() => _ScrapInputFieldState();
// }

// class _ScrapInputFieldState extends State<ScrapInputField> {
//   bool isChecked = false;
//   String unit = "KG";
//   // String type = "Other";

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         children: [
//           Checkbox(
//             value: isChecked,
//             onChanged: (value) {
//               setState(() {
//                 isChecked = value!;
//               });
//             },
//             activeColor: Colors.green.shade700,
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 TextFormField(
//                   keyboardType: TextInputType.numberWithOptions(),
//                   decoration: InputDecoration(
                    
//                     labelText: '${widget.label} ($unit)',
//                     labelStyle: TextStyle(fontSize: 16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.green.shade600),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
                
//               ],
//             ),
//           ),
//           SizedBox(width: 10),
//           DropdownButton<String>(
//             value: unit,
//             items: [
//               DropdownMenuItem(
//                 value: "KG",
//                 child: Text("KG"),
//               ),
//               DropdownMenuItem(
//                 value: "PCS",
//                 child: Text("PCS"),
//               ),
//             ],
//             onChanged: (value) {
//               setState(() {
//                 unit = value!;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycle Hub Camera'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!, height: 200, width: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.camera),
              child: Text('Take Picture'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.gallery),
              child: Text('Upload Picture'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
