// // // import 'package:firebase_database/firebase_database.dart';
// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // // import 'package:recycle_hub_bd/users/user_model.dart';
// // // import 'package:recycle_hub_bd/users/user_repository.dart';
// // // import 'package:recycle_hub_bd/service/database.dart';
// // // import 'package:fluttertoast/fluttertoast.dart';
// // // import 'package:random_string/random_string.dart';
// // // import 'package:recycle_hub_bd/service/database.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:recycle_hub_bd/scrap.dart';

// // class PickupDetails extends StatefulWidget {
// //   // PickupDetails({Key? key, required this.title}) : super(key: key);

// //   // final String title;

// //   @override
// //   _PickupDetailsState createState() => _PickupDetailsState();
// // }

// // class _PickupDetailsState extends State<PickupDetails> {
// //   // UserRepository _userRepository = UserRepository();

// //   final _formKey = GlobalKey<FormState>();

// //   String? _name;
// //   String? _phoneNumber;
// //   String? _address;
// //   String? _email;
// //   DateTime? _date;
// //   String? _remark;
// //   bool? _autoValidate;

// //   // final userNameController = TextEditingController();
// //   // final userPhoneNumberController = TextEditingController();
// //   // final userAddressController = TextEditingController();
// //   // final userEmailController = TextEditingController();
// //   // final userPickupDateController = TextEditingController();
// //   // final userAdditionInfoController = TextEditingController();

// //   bool _isLoading = false;

// //   String _status = "";

// //   final TextEditingController userNameController = TextEditingController();
// //   final TextEditingController userPhoneNumberController =
// //       TextEditingController();
// //   final TextEditingController userAddressController = TextEditingController();
// //   final TextEditingController userEmailController = TextEditingController();
// //   final TextEditingController userPickupDateController =
// //       TextEditingController();
// //   final TextEditingController userAdditionInfoController =
// //       TextEditingController();

// //   String temp = "";
// //   Future<void> insertRecord() async {
// //     if (userAdditionInfoController.text != "") {
// //       try {
// //         String uri = "http://172.20.232.97/recycle_api/insert_record.php";
// //         var res = await http.post(Uri.parse(uri), body: {
// //           "name": userNameController.text,
// //           "phoneNumber": userPhoneNumberController.text,
// //           "address": userAddressController.text,
// //           "email": userEmailController.text,
// //           "pickupDate": userPickupDateController.text,
// //           "additionalInformation": userAdditionInfoController.text
// //         });

// //         var response = jsonDecode(res.body);
// //         if (response["success"] == "true") {
// //           print("record inserted");
// //           temp = "record inserted";
// //         } else {
// //           print("some issues occurs");
// //         }
// //       } catch (e) {
// //         print(e);
// //       }
// //     } else {
// //       print("fill up the fields");
// //     }
// //   }

// //   // late DatabaseReference dbRef;

// //   // @override
// //   // void initState() {
// //   //   // TODO: implement initState
// //   //   super.initState();
// //   //   // dbRef = FirebaseDatabase.instance.ref().child('Users');
// //   // }

// //   void _validateInputs() {
// //     if (_formKey.currentState!.validate()) {
// //       _formKey.currentState!.save();
// //       // Here you can send the form data to your server
// //       print(
// //           'Form Submitted: $_name, $_phoneNumber, $_address, $_email, $_date, $_remark');
// //     } else {
// //       setState(() {
// //         _autoValidate = true;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Pickup Details"),
// //       ),
// //       body: Form(
// //         key: _formKey,
// //         // autovalidateMode: _autoValidate,
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 TextFormField(
// //                   controller: userNameController,
// //                   decoration: InputDecoration(labelText: 'Name *'),
// //                   validator: (String? value) {
// //                     if (value == null || value.isEmpty) {
// //                       return 'Name cannot be empty';
// //                     }
// //                     return null;
// //                   },
// //                   onSaved: (String? value) {
// //                     _name = value;
// //                   },
// //                 ),
// //                 TextFormField(
// //                   keyboardType: TextInputType.number,
// //                   controller: userPhoneNumberController,
// //                   decoration: InputDecoration(labelText: 'Phone Number *'),
// //                   validator: (String? value) {
// //                     if (value == null || value.isEmpty) {
// //                       return 'Phone Number cannot be empty';
// //                     }
// //                     return null;
// //                   },
// //                   onSaved: (String? value) {
// //                     _phoneNumber = value;
// //                   },
// //                 ),
// //                 TextFormField(
// //                   controller: userAddressController,
// //                   decoration: InputDecoration(labelText: 'Address *'),
// //                   validator: (String? value) {
// //                     if (value == null || value.isEmpty) {
// //                       return 'Address cannot be empty';
// //                     }
// //                     return null;
// //                   },
// //                   onSaved: (String? value) {
// //                     _address = value;
// //                   },
// //                 ),
// //                 TextFormField(
// //                   controller: userEmailController,
// //                   keyboardType: TextInputType.emailAddress,
// //                   decoration: InputDecoration(labelText: 'Email'),
// //                   validator: (String? value) {
// //                     if (value == null || value.isEmpty) {
// //                       return null;
// //                     }
// //                     String pattern =
// //                         r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$';
// //                     RegExp regex = RegExp(pattern);
// //                     if (!regex.hasMatch(value)) {
// //                       return 'Enter Valid Email';
// //                     } else {
// //                       return null;
// //                     }
// //                   },
// //                   onSaved: (String? value) {
// //                     _email = value;
// //                   },
// //                 ),
// //                 TextFormField(
// //                   controller: userPickupDateController,
// //                   // readOnly: true,
// //                   decoration: InputDecoration(labelText: 'Pickup Date'),
// //                   // keyboardType: TextInputType.datetime,
// //                   // initialValue: _date != null
// //                   //     ? '${_date!.day}/${_date!.month}/${_date!.year}'
// //                   //     : '',
// //                   // onTap: () async {
// //                   //   final DateTime? picked = await showDatePicker(
// //                   //     context: context,
// //                   //     initialDate: _date ?? DateTime.now(),
// //                   //     firstDate: DateTime(2000),
// //                   //     lastDate: DateTime(2025),
// //                   //   );
// //                   //   if (picked != null && picked != _date) {
// //                   //     setState(() {
// //                   //       _date = picked;
// //                   //     });
// //                   //   }
// //                   // },
// //                 ),
// //                 TextFormField(
// //                   controller: userAdditionInfoController,
// //                   decoration: InputDecoration(labelText: 'Additional Info'),
// //                   maxLines: 5,
// //                   onSaved: (value) => _remark = value,
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.push(context,
// //                         MaterialPageRoute(builder: (context) => ScrapPage()));
// //                     insertRecord();
// //                     // String name = userNameController.text;
// //                     // String phoneNumber = userPhoneNumberController.text;
// //                     // String address = userAddressController.text;
// //                     // String email = userEmailController.text;
// //                     // String pickupDate = userPickupDateController.text;
// //                     // String additionalInformation =
// //                     //     userAdditionInfoController.text;

// //                     // if (name.isNotEmpty &&
// //                     //     phoneNumber.isNotEmpty &&
// //                     //     address.isNotEmpty) {
// //                     //   setState(() {
// //                     //     print(email);
// //                     //     print(name);
// //                     //     _isLoading = true;
// //                     //     _status = "Uploading ...";
// //                     //   });
// //                     //   Users users = Users(null, name, phoneNumber, address,
// //                     //       email, pickupDate, additionalInformation);
// //                     //   _userRepository.addUsers(users).then((value) {
// //                     //     userNameController.clear();
// //                     //     userAdditionInfoController.clear();
// //                     //     userAddressController.clear();
// //                     //     userEmailController.clear();
// //                     //     userPhoneNumberController.clear();
// //                     //     userPickupDateController.clear();

// //                     //     _status = "Details Send";
// //                     //   }).catchError((e) {
// //                     //     print(e);
// //                     //     _status = "failed";
// //                     //   }).whenComplete(() {
// //                     //     setState(() {
// //                     //       _isLoading = false;
// //                     //     });
// //                     //   });
// //                     // } else {
// //                     //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //                     //       content: Text("Please enter data completely")));
// //                     // }
// //                   },

// //                   // onPressed: () async {
// //                   //   String id = randomAlphaNumeric(10);
// //                   //   Map<String, dynamic> users = {
// //                   // 'name': userNameController.text,
// //                   // 'phoneNumber': userPhoneNumberController.text,
// //                   // 'address': userAddressController.text,
// //                   // 'email': userEmailController.text,
// //                   // 'pickupDate': userPickupDateController.text,
// //                   // 'additionalInfo': userAdditionInfoController.text,
// //                   // 'ID': id
// //                   // };

// //                   // // await DatabaseMethods().users(users, id).then((value) {
// //                   // //   Fluttertoast.showToast(
// //                   // //       msg: "users pickup information has been uploaded successfully",
// //                   // //       toastLength: Toast.LENGTH_SHORT,
// //                   // //       gravity: ToastGravity.CENTER,
// //                   // //       timeInSecForIosWeb: 1,
// //                   // //       backgroundColor: Colors.red,
// //                   // //       textColor: Colors.white,
// //                   // //       fontSize: 16.0);
// //                   // });

// //                   // dbRef.push().set(users);

// //                   child: Text('Submit'),

// //                 ),
// //                 Divider(),
// //                 if (_isLoading) CircularProgressIndicator(),
// //                 Text(_status),
// //                 Text(temp),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class PickupRequestForm extends StatefulWidget {
//   @override
//   _PickupRequestFormState createState() => _PickupRequestFormState();
// }

// class _PickupRequestFormState extends State<PickupRequestForm> {
//   final _formKey = GlobalKey<FormState>();

//   String? _selectedState;
//   List<String> _states = ["Dhaka", "Chittagong", "Sylhet"];
//   List<String> _scrapTypes = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pickup Request Form'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: <Widget>[
//               Center(
//                 child: Image.asset(
//                   'assets/images/recycle_hub_logo.png',
//                   height: 150,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Name *',
//                   hintText: 'Enter your name here',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Phone No *',
//                   hintText: 'Enter your Whatsapp no./ Mobile no.',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your phone number';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Address *',
//                   hintText: 'Enter your Address',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your address';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'State *',
//                   border: OutlineInputBorder(),
//                 ),
//                 value: _selectedState,
//                 items: _states.map((String state) {
//                   return DropdownMenuItem<String>(
//                     value: state,
//                     child: Text(state),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedState = newValue;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select a state';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Postal Code *',
//                   hintText: 'Enter Pin Code',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the pin code';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'Enter your Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Text('Type of Scrap *'),
//               // CheckboxListTile(
//               //   title: Text('Paper'),
//               //   value: _scrapTypes.contains('Paper'),
//               //   onChanged: (bool? value) {
//               //     setState(() {
//               //       value == true ? _scrapTypes.add('Paper') : _scrapTypes.remove('Paper');
//               //     });
//               //   },
//               // ),
//               // CheckboxListTile(
//               //   title: Text('Plastic'),
//               //   value: _scrapTypes.contains('Plastic'),
//               //   onChanged: (bool? value) {
//               //     setState(() {
//               //       value == true ? _scrapTypes.add('Plastic') : _scrapTypes.remove('Plastic');
//               //     });
//               //   },
//               // ),
//               // CheckboxListTile(
//               //   title: Text('E-Waste'),
//               //   value: _scrapTypes.contains('E-Waste'),
//               //   onChanged: (bool? value) {
//               //     setState(() {
//               //       value == true ? _scrapTypes.add('E-Waste') : _scrapTypes.remove('E-Waste');
//               //     });
//               //   },
//               // ),
//               // CheckboxListTile(
//               //   title: Text('Glass'),
//               //   value: _scrapTypes.contains('Glass'),
//               //   onChanged: (bool? value) {
//               //     setState(() {
//               //       value == true ? _scrapTypes.add('Glass') : _scrapTypes.remove('Glass');
//               //     });
//               //   },
//               // ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Pickup Date *',
//                   border: OutlineInputBorder(),
//                 ),
//                 readOnly: true,
//                 onTap: () async {
//                   DateTime? date = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2100),
//                   );
//                   if (date != null) {
//                     setState(() {
//                       // Do something with the selected date
//                     });
//                   }
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select a pickup date';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Additional Information',
//                   hintText: 'Message',
//                   border: OutlineInputBorder(),
//                 ),
//                 maxLines: 3,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Process data
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Processing Data')),
//                     );
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'api_service.dart';

class PickupRequestForm extends StatefulWidget {
  @override
  _PickupRequestFormState createState() => _PickupRequestFormState();
}

class _PickupRequestFormState extends State<PickupRequestForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedState;
  List<String> _states = ["Dhaka", "Chittagong", "Sylhet"];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pickupDateController = TextEditingController();
  TextEditingController _additionalInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pickup Request Form'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Name Input
              _buildTextField(_nameController, 'Name', 'Enter your name here'),
              // Phone Number Input
              _buildTextField(_phoneController, 'Phone No',
                  'Enter your Whatsapp no./ Mobile no.',
                  isNumber: true),
              // Address Input
              _buildTextField(
                  _addressController, 'Address', 'Enter your address'),
              // State Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'State *', border: OutlineInputBorder()),
                value: _selectedState,
                items: _states.map((String state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedState = newValue;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a state' : null,
              ),
              SizedBox(height: 10),
              // Postal Code Input
              _buildTextField(
                  _postalCodeController, 'Postal Code', 'Enter Pin Code',
                  isNumber: true),
              // Email Input
              _buildTextField(_emailController, 'Email', 'Enter your Email'),
              // Pickup Date Input
              _buildTextField(
                  _pickupDateController, 'Pickup Date', 'Select Pickup Date',
                  isReadOnly: true, onTap: _pickDate),
              // Additional Info Input
              _buildTextField(_additionalInfoController,
                  'Additional Information', 'Message',
                  maxLines: 3),
              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint,
      {bool isNumber = false,
      bool isReadOnly = false,
      int maxLines = 1,
      VoidCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        readOnly: isReadOnly,
        onTap: onTap,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: '$label *',
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        _pickupDateController.text = date.toIso8601String().split('T').first;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ApiService.submitRequest(
        _nameController.text,
        // _phoneController.text,
        // _addressController.text,
        // _selectedState!,
        // _postalCodeController.text,
        // _emailController.text,
        // _pickupDateController.text,
        // _additionalInfoController.text,
      );
    }
  }
}
