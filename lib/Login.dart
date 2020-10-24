// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:layouting/ApiService/ApiService.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:layouting/Dashboard.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
//   final _username = TextEditingController();
//   final _password = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _saving = false;
//   ApiService apiServices;

//   @override
//   void initState() {
//     super.initState();
//     apiServices = ApiService();
//   }

//   void showToast(String msg) {
//     Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       timeInSecForIos: 1,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }

//   void login(String username, String password) {
//     var body = {"email": username, "password": password, "role": "admin"};

//     apiServices.login(body).then((value) async {
//       setState(() {
//         _saving = false;
//       });
//       if (value.message == 'login_success') {
//         showToast(value.message);
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => MyApp()),
//             (Route<dynamic> route) => false);
//       } else {
//         showToast(value.message);
//         setState(() {
//           _saving = false;
//         });
//       }
//     });
//     setState(() {
//       _saving = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final username = TextFormField(
//       controller: _username,
//       obscureText: false,
//       //validator: (val) => val.isEmpty ? "Harap isi username" : null,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Username",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//     );

//     final passwordField = TextFormField(
//       obscureText: true,
//       controller: _password,
//       //validator: (val) => val.length < 1 ? "Harap isi Password" : null,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Password",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//     );

//     final loginButon = Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(32.0),
//         color: Color.fromRGBO(192, 192, 192, .9),
//       ),

//       // color: Color(0xff01A0C7),
//       child: MaterialButton(
//         minWidth: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         onPressed: () {
//           //  if (_formKey.currentState.validate()) {
//           login(_username.text, _password.text);
//           // }
//         },
//         child: Text("Login",
//             textAlign: TextAlign.center,
//             style: style.copyWith(
//                 color: Colors.black, fontWeight: FontWeight.bold)),
//       ),
//     );

//     final appBar = CupertinoNavigationBar(
//       middle: Text(
//         "Login",
//       ),
//       automaticallyImplyLeading: true,
//     );
//     return Scaffold(
//         appBar: appBar,
//         body: SingleChildScrollView(
//           child: Center(
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(height: 155.0),
//                     username,
//                     SizedBox(height: 25.0),
//                     passwordField,
//                     SizedBox(
//                       height: 35.0,
//                     ),
//                     loginButon,
//                     SizedBox(
//                       height: 15.0,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass
    };
    var jsonResponse = null;
    var response = await http.post("YOUR_BASE_URL", body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed: emailController.text == "" || passwordController.text == "" ? null : () {
          setState(() {
            _isLoading = true;
          });
          signIn(emailController.text, passwordController.text);
        },
        elevation: 0.0,
        color: Colors.purple,
        child: Text("Sign In", style: TextStyle(color: Colors.white70)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white70),
              hintText: "Email",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Code Land",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
    );
  }
}
