import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cinema/home.dart';
import 'firebase_options.dart';
import 'register.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
// String selectedValue = 'Undergraduate';
 //String selectedGender = 'Male';
 late final TextEditingController _email;
 late final TextEditingController _password;

@override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
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
  
  return Scaffold(
  body:
   Stack(children: [
  Container(
   child: 
  Center(child: 
  Column(
    children: [
      SizedBox(height: 80,),
      Image.asset('assets/images/logo.png',height: 200,),
       SizedBox(height: 50,),
Container(
 height: 243,
      width: 250,
      decoration: BoxDecoration(
      //  color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.black,width: 1)
      ),
    child: FutureBuilder(
      future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform
          ),

      builder: (context, snapshot) {
        //switch (snapshot.connectionState){
       //   case ConnectionState.done:
       return  Column(
        children: [
          SizedBox(height: 10,),
          Text('EMAIL',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
       Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 2),
          
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: TextField(
          controller:_email ,
            keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          enableSuggestions: true,
              style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15), // Adjust the vertical padding
      ),
          ),
       ),
       SizedBox(height: 20,),
          Text('PASSWORD',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
       Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: TextField(
          controller: _password,
          autocorrect: false,
          enableSuggestions: true,
          obscureText: true,
                style: TextStyle(color:  Color.fromARGB(178, 5, 74, 131)),
            decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15), // Adjust the vertical padding
      ),
          ),
       ),
       SizedBox(height: 20,),
      
      
       Container(
        height: 35,
        width: 200,
        decoration: BoxDecoration(
        color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white,width: 1)
        ),
        child: TextButton(
         onPressed: () async{
      
          
           final email =_email.text;
           final password = _password.text;
       try {
    final UserCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
     if (UserCredential.user != null) {
      final user = UserCredential.user!;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
   
           print(UserCredential);
          
        }}
      on FirebaseAuthException  catch (e){
        if (e.code=='invalid-credential'){
          print('Invalid Credential');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials')));
        }  
        }
         }, 
         child: Text('LOGIN',style: TextStyle(color: Colors.white),),
         
          ),
          
       ),
       SizedBox(height: 2,),
  Container(
    height: 30,
    width: 200,
     decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color:Colors.black,),
child: TextButton(onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder:(context) => register() ));
  },
   child:      Text('Register',style:TextStyle(fontSize: 10,color: Colors.white),)),
   
  ),
 Align(alignment: Alignment.bottomCenter,
 child:TextButton(onPressed:() {
   
 },
  style: ButtonStyle(
     overlayColor: MaterialStateProperty.all(Colors.transparent), 
   
  ),
 child:  Text('forgot password?',style: TextStyle(fontSize: 10,color: Color.fromARGB(178, 5, 74, 131)),) ,)),
        ],
      );
      
          //default:
          //return const Text('Loading...');
        }
    
      
    ),
),
    
    ],
  
  )
   
  )  
    
  ),
  
    ]),
  );
}

Widget DeskTopNavBar() {
  return Scaffold( 
  body:
  Container(
   
  
   child: 
  Center(child: 
  Column(
    children: [
      SizedBox(height: 80,),
      Image.asset('assets/images/logo.png',height: 200,),
       SizedBox(height: 50,),
Container(
 height: 243,
      width: 250,
      decoration: BoxDecoration(
      //  color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.black,width: 1)
      ),
    child: FutureBuilder(
      future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform
          ),

      builder: (context, snapshot) {
        //switch (snapshot.connectionState){
       //   case ConnectionState.done:
       return  Column(
        children: [
          SizedBox(height: 20,),
          Text('EMAIL',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
       Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: TextField(
          controller:_email ,
            keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          enableSuggestions: true,
             style: TextStyle(color:  Color.fromARGB(178, 5, 74, 131)),
          decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15), // Adjust the vertical padding
      ),
          ),
       ),
       SizedBox(height: 20,),
          Text('PASSWORD',style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
       Container(
        height: 30,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: TextField(
          controller: _password,
          autocorrect: false,
          enableSuggestions: true,
          obscureText: true,
             style: TextStyle(color: Color.fromARGB(178, 5, 74, 131)),
            decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15), // Adjust the vertical padding
      ),
          ),
       ),
      
                 
           SizedBox(height: 20,),
      
       Container(
        height: 25,
        width: 200,
        decoration: BoxDecoration(
        color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.white,width: 1)
        ),
        child: TextButton(
         onPressed: () async{
      
          
           final email =_email.text;
           final password = _password.text;
 try {
    final UserCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    // Check the selected role and navigate accordingly
    if (UserCredential.user != null) {
      final user = UserCredential.user!;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    

    }
    print(UserCredential);
    
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-credential') {
      print('Invalid Credential');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials')));
    }
  }
},      child: Text('LOGIN',style: TextStyle(color: Colors.white),),
         
          ),
          
       ),
       SizedBox(height: 2,),
  Container(
    height: 30,
    width: 200,
     decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color:Colors.black,),
child: TextButton(onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder:(context) => register() ));
  },
   child:      Text('Register',style:TextStyle(fontSize: 10,color: Colors.white),)
   ),
   
  ),
 Align(alignment: Alignment.bottomCenter,
 child:TextButton(onPressed:() {
   
 },
 style: ButtonStyle(
     overlayColor: MaterialStateProperty.all(Colors.transparent), 
   
  ),
 child:  Text('forgot password?',style: TextStyle(fontSize: 10,color: Color.fromARGB(178, 5, 74, 131)),) ,)
 ),
        ],
      );
      
          //default:
          //return const Text('Loading...');
        }
    
      
    ),
),
    
    ],
  
  )
   
  )  
    
  ),
  
    
  );}
}