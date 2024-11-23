// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:recycle_hub_bd/camerapage.dart';
// import 'package:recycle_hub_bd/phoneAuth.dart';
// import 'package:recycle_hub_bd/scrap.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Supabase.initialize(
//   //     url: 'https://gbkhkohszudhslolqdaj.supabase.co',
//   //     anonKey:
//   //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdia2hrb2hzenVkaHNsb2xxZGFqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYxNDIzOTcsImV4cCI6MjAzMTcxODM5N30.-GkEu1c_O2mQlNai_mw0UGlBYDx_ArsngCzjb4px6Xo');

//   // await Firebase.initializeApp(
//   // options: FirebaseOptions(
//   //     apiKey: 'AIzaSyBjNWKe7ijBzFI6xEOGnklUBC5CEj8ePys',
//   //     appId: '1:650601995318:android:aa09b6e13a564d7fc50c97',
//   //     messagingSenderId: '650601995318',
//   //     projectId: 'recyclehubbd-6dc16')
//   // );

//    WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,  
//       title: 'Recycle Hub BD',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   // late AnimationController _scaleController;
//   // late Animatable<double> _scaleAnimation;

//   // bool hide = false;

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();

//   //   _scaleController = AnimationController(
//   //       vsync: this, duration: const Duration(microseconds: 500));

//   //   _scaleAnimation = Tween<double>(begin: 1.0, end: 30.0)
//   //       .animate(_scaleController)
//   //       .addStatusListener((status) {
//   //     if (status == AnimationStatus.completed) {
//   //       Navigator.push(context,
//   //           PageTransition(child: ScrapPage(), type: PageTransitionType.fade));
//   //     }
//   //   }) as Animatable<double>;
//   // }

//   // final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/images/cover.jpg'), fit: BoxFit.cover),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
//           Colors.black.withOpacity(.9),
//           Colors.black.withOpacity(.3),
//         ])),
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               Text(
//                 "Recycle Hub BD",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "Revolutionizing Recycling, Reshaping Bangladesh",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white),
//               ),
//               SizedBox(
//                 height: 70,
//               ),


              
//               InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => PhoneAuth()));
//                   setState(() {
//                     // hide = true;
//                   });
//                   // _scaleController.forward();
//                 },
//                 // child: AnimatedBuilder(
//                 //   animation: _scaleController,
//                 //   builder: (context, child) => Transform.scale(
//                 // scale: _scaleAnimation.value,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                       child: Text(
//                     "Login",
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
//                   )),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),


//               InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => ScrapPage()));
//                   setState(() {
//                     // hide = true;
//                   });
//                   // _scaleController.forward();
//                 },
//                 // child: AnimatedBuilder(
//                 //   animation: _scaleController,
//                 //   builder: (context, child) => Transform.scale(
//                 // scale: _scaleAnimation.value,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(
//                       child: Text(
//                     "Get Started",
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
//                   )),
//                 ),
//               ),


//               SizedBox(
//                 height: 50,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle_hub_bd/phoneAuth.dart';
import 'package:recycle_hub_bd/scrap.dart';

Future <void> main() async {
  
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IntroPage(),

    theme: ThemeData(
      primarySwatch: Colors.green,
      textTheme: GoogleFonts.poppinsTextTheme(),
    ),
  ));
}

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade100, Colors.green.shade50],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/recycle_hub_logo.png',
                height: 350,
              ),
              SizedBox(height: 60),
              
              SizedBox(height: 70),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black45,
                ),
                onPressed: () {
                  // Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => PhoneAuth()));
        
                  // Add functionality for login button
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent.shade400,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black45,
                ),
                onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ScrapPage()));
                  // Add functionality for get started button
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
