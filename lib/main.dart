import 'package:flutter/material.dart';
import 'package:password_test/gradientBar.dart';
import 'package:password_test/constants.dart';
import 'package:password_test/strengthManager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Password Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New password',
                style: TextStyle(color: Colors.black38, fontSize: 16),
              ),
              TextField(
                textAlignVertical: TextAlignVertical.bottom,
                autofocus: true,
                decoration: textFieldDecoration.copyWith(
                    //Takes the decoration stored in the Constants file, and copies it with a suffix icon
                    suffixIcon: validatePassword(this.password.length).result
                        ? Icon(Icons.check_circle, color: strongColor)
                        : null),
                style: TextStyle(color: Colors.black),
                obscuringCharacter: '*',
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    this.password = value;
                  });
                },
              ),
              GradientBar(
                activeColor: validatePassword(this.password.length).resultColor,
              ),
              Text(
                validatePassword(this.password.length).resultString,
                style: TextStyle(
                    color: validatePassword(this.password.length).resultColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
