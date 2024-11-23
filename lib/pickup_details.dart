// import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:recycle_hub_bd/users/user_model.dart';
// import 'package:recycle_hub_bd/users/user_repository.dart';
// import 'package:recycle_hub_bd/service/database.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:random_string/random_string.dart';
// import 'package:recycle_hub_bd/service/database.dart';
import 'package:http/http.dart' as http;

class PickupDetails extends StatefulWidget {
  // PickupDetails({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  _PickupDetailsState createState() => _PickupDetailsState();
}

class _PickupDetailsState extends State<PickupDetails> {
  // UserRepository _userRepository = UserRepository();

  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _phoneNumber;
  String? _address;
  String? _email;
  DateTime? _date;
  String? _remark;
  bool? _autoValidate;

  // final userNameController = TextEditingController();
  // final userPhoneNumberController = TextEditingController();
  // final userAddressController = TextEditingController();
  // final userEmailController = TextEditingController();
  // final userPickupDateController = TextEditingController();
  // final userAdditionInfoController = TextEditingController();

  bool _isLoading = false;

  String _status = "";

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPhoneNumberController =
      TextEditingController();
  final TextEditingController userAddressController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPickupDateController =
      TextEditingController();
  final TextEditingController userAdditionInfoController =
      TextEditingController();

  String temp = "";
  Future<void> insertRecord() async {
    if (userAdditionInfoController.text != "") {
      try {
        String uri = "http://192.168.0.8/recycle_api/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name": userNameController.text,
          "phoneNumber": userPhoneNumberController.text,
          "address": userAddressController.text,
          "email": userEmailController.text,
          "pickupDate": userPickupDateController.text,
          "additionalInformation": userAdditionInfoController.text
        });

        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("record inserted");
          temp = "record inserted";
        } else {
          print("some issues occurs");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("fill up the fields");
    }
  }

  // late DatabaseReference dbRef;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // dbRef = FirebaseDatabase.instance.ref().child('Users');
  // }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here you can send the form data to your server
      print(
          'Form Submitted: $_name, $_phoneNumber, $_address, $_email, $_date, $_remark');
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pickup Details"),
      ),
      body: Form(
        key: _formKey,
        // autovalidateMode: _autoValidate,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(labelText: 'Name *'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _name = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: userPhoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number *'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number cannot be empty';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _phoneNumber = value;
                  },
                ),
                TextFormField(
                  controller: userAddressController,
                  decoration: InputDecoration(labelText: 'Address *'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Address cannot be empty';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _address = value;
                  },
                ),
                TextFormField(
                  controller: userEmailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    String pattern =
                        r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Enter Valid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String? value) {
                    _email = value;
                  },
                ),
                TextFormField(
                  controller: userPickupDateController,
                  // readOnly: true,
                  decoration: InputDecoration(labelText: 'Pickup Date'),
                  keyboardType: TextInputType.datetime,
                  // initialValue: _date != null
                  //     ? '${_date!.day}/${_date!.month}/${_date!.year}'
                  //     : '',
                  // onTap: () async {
                  //   final DateTime? picked = await showDatePicker(
                  //     context: context,
                  //     initialDate: _date ?? DateTime.now(),
                  //     firstDate: DateTime(2000),
                  //     lastDate: DateTime(2025),
                  //   );
                  //   if (picked != null && picked != _date) {
                  //     setState(() {
                  //       _date = picked;
                  //     });
                  //   }
                  // },
                ),
                TextFormField(
                  controller: userAdditionInfoController,
                  decoration: InputDecoration(labelText: 'Additional Info'),
                  maxLines: 5,
                  onSaved: (value) => _remark = value,
                ),
                ElevatedButton(
                  onPressed: () {
                    insertRecord();
                    // String name = userNameController.text;
                    // String phoneNumber = userPhoneNumberController.text;
                    // String address = userAddressController.text;
                    // String email = userEmailController.text;
                    // String pickupDate = userPickupDateController.text;
                    // String additionalInformation =
                    //     userAdditionInfoController.text;

                    // if (name.isNotEmpty &&
                    //     phoneNumber.isNotEmpty &&
                    //     address.isNotEmpty) {
                    //   setState(() {
                    //     print(email);
                    //     print(name);
                    //     _isLoading = true;
                    //     _status = "Uploading ...";
                    //   });
                    //   Users users = Users(null, name, phoneNumber, address,
                    //       email, pickupDate, additionalInformation);
                    //   _userRepository.addUsers(users).then((value) {
                    //     userNameController.clear();
                    //     userAdditionInfoController.clear();
                    //     userAddressController.clear();
                    //     userEmailController.clear();
                    //     userPhoneNumberController.clear();
                    //     userPickupDateController.clear();

                    //     _status = "Details Send";
                    //   }).catchError((e) {
                    //     print(e);
                    //     _status = "failed";
                    //   }).whenComplete(() {
                    //     setState(() {
                    //       _isLoading = false;
                    //     });
                    //   });
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //       content: Text("Please enter data completely")));
                    // }
                  },

                  // onPressed: () async {
                  //   String id = randomAlphaNumeric(10);
                  //   Map<String, dynamic> users = {
                  // 'name': userNameController.text,
                  // 'phoneNumber': userPhoneNumberController.text,
                  // 'address': userAddressController.text,
                  // 'email': userEmailController.text,
                  // 'pickupDate': userPickupDateController.text,
                  // 'additionalInfo': userAdditionInfoController.text,
                  // 'ID': id
                  // };

                  // // await DatabaseMethods().users(users, id).then((value) {
                  // //   Fluttertoast.showToast(
                  // //       msg: "users pickup information has been uploaded successfully",
                  // //       toastLength: Toast.LENGTH_SHORT,
                  // //       gravity: ToastGravity.CENTER,
                  // //       timeInSecForIosWeb: 1,
                  // //       backgroundColor: Colors.red,
                  // //       textColor: Colors.white,
                  // //       fontSize: 16.0);
                  // });

                  // dbRef.push().set(users);

                  child: Text('Submit'),
                ),
                Divider(),
                if (_isLoading) CircularProgressIndicator(),
                Text(_status),
                Text(temp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
