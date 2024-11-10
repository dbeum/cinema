import 'package:cinema/firebase_options.dart';
import 'package:cinema/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cinema/home.dart';


class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}


class _registerState extends State<register> {
 
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      print('Firebase initialized');
    } catch (e) {
      print('Error initializing Firebase: $e');
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileNavBar(),
      desktop: (BuildContext context) => DeskTopNavBar(),
    );
  }

  Widget MobileNavBar() {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
    body: 
    Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Image.asset('assets/images/logo.png', height: 200),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 250,
              // decoration: BoxDecoration(
              // //  color: Colors.black,
              //   borderRadius: BorderRadius.all(Radius.circular(15)),
              //     border: Border.all(color: Colors.black, width: 2),
              // ),
              child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'EMAIL',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 30,
                          width: 200,
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black, width: 2),
                          //   borderRadius: BorderRadius.all(Radius.circular(5)),
                          // ),
                          child: TextField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            enableSuggestions: true,
                                style: TextStyle(  color: isDarkMode ? Colors.white : Colors.black,),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black,)),
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'PASSWORD',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 30,
                          width: 200,
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black, width: 2),
                          //   borderRadius: BorderRadius.all(Radius.circular(5)),
                          // ),
                          child: TextField(
                            controller: _password,
                            autocorrect: false,
                            enableSuggestions: true,
                            obscureText: true,
                                 style: TextStyle(  color: isDarkMode ? Colors.white : Colors.black,),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black,)),
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                      SizedBox(height: 10,),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(width: 1,color: Colors.white)
                          ),

                          child: TextButton(
                            onPressed: () async {
                              final email = _email.text;
                              final password = _password.text;
                             
                              try {
                                final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );

                             

                                await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
                                  'email': email,
                                  
                                });

                                print('User registered: ${userCredential.user!.uid}');
                                
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => login(),
                                  ),
                                );
                              } catch (e) {
                                if (e is FirebaseAuthException) {
                                  if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weak Password')));
                                    print('Weak password');
                                  } else if (e.code == 'email-already-in-use') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email already in use')));
                                    print('Email is already in use');
                                  } else if (e.code == 'invalid-email') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Email')));
                                    print('Invalid email');
                                  } else {
                                    print(e);
                                  }
                                } else {
                                  print('Unexpected error: $e');
                                }
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed')));
                              }
                            },
                            child: Text(
                              'REGISTER',
                              style: TextStyle(color: Colors.white,fontSize: 10),
                            ),
                          ),
                        ),
                      ],
              
                    )
                  
                
              
            )   
          ],
        ),
      ),
    ));
  }

  Widget DeskTopNavBar() {
    return Scaffold(body: 
    Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Image.asset('assets/images/logo.png', height: 200),
            SizedBox(height: 20),
            Container(
              height: 210,
              width: 250,
              decoration: BoxDecoration(
           //     color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(width: 2,color: Colors.black)
              ),
              child: FutureBuilder(
                future: Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'EMAIL',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 30,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: TextField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            enableSuggestions: true,
                            style: TextStyle(color:  Color.fromARGB(178, 5, 74, 131)),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'PASSWORD',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 30,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: TextField(
                            controller: _password,
                            autocorrect: false,
                            enableSuggestions: true,
                            obscureText: true,
                              style: TextStyle(color:  Color.fromARGB(178, 5, 74, 131)),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                      
                        SizedBox(height: 9),
                        Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              final email = _email.text;
                              final password = _password.text;
                            
                              try {
                                final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );

                              

                                await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
                                  'email': email,
                                
                                });

                                print('User registered: ${userCredential.user!.uid}');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => login(),
                                  ),
                                );
                              } catch (e) {
                                if (e is FirebaseAuthException) {
                                  if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weak Password')));
                                    print('Weak password');
                                  } else if (e.code == 'email-already-in-use') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email already in use')));
                                    print('Email is already in use');
                                  } else if (e.code == 'invalid-email') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Email')));
                                    print('Invalid email');
                                  } else {
                                    print(e);
                                  }
                                } else {
                                  print('Unexpected error: $e');
                                }
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed')));
                              }
                            },
                            child: Text(
                              'REGISTER',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
