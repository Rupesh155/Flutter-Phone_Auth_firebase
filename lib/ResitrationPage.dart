import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;



class RegitrationPage extends StatelessWidget {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xfff3f4ed),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 10,
                        spreadRadius: 10,
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent,
                        Colors.amberAccent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(80))),
                child: Center(
                  child: Text(
                    'Registration',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.08,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              textField(
                  hintText: 'Phone Number',
                  icon: Icon(Icons.phone),
                  isPhone: true),
              textField(
                  hintText: 'Password',
                  icon: Icon(FontAwesomeIcons.key),
                  isPhone: false),
              textField(
                  hintText: 'Confirm Password',
                  icon: Icon(FontAwesomeIcons.key),
                  isPhone: false),
              Expanded(child: SizedBox()),
              Container(
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange,
                        Colors.lightBlueAccent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithPhoneNumber(_phoneController.value.text)
                          .then((value) => print('success'));
                    },
                    child: Text(
                      'Registration',
                      style: TextStyle(color: Colors.white, shadows: [
                        Shadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          // offset: Offset(2, 2),
                        )
                      ]),
                    ),
                  )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ?'),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        // FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w900,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField({String hintText, Icon icon, bool isPhone}) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 20, color: Colors.grey[500])]),
      child: TextFormField(
        controller: isPhone ? _phoneController : _passwordController,
        keyboardType:
            isPhone ? TextInputType.number : TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
