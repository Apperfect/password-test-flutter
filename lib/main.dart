import 'package:flutter/material.dart';

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
  String result = '';
  bool strong = false;
  Color activeColor = Colors.transparent;
  Color strongColor = Colors.green;
  Color mediumColor = Colors.amber;
  Color weakColor = Colors.red;

  validatePassword(String password) {
    int length = password.length;

    if (length == 0) {
      this.result = '';
      this.strong = false;
    }

    if (length > 0 && length < 4) {
      this.result = 'Weak Password';
      this.activeColor = weakColor;
      this.strong = false;
    }

    if (length >= 4 && length < 7) {
      this.result = 'Medium Password';
      this.activeColor = mediumColor;
      this.strong = false;
    }

    if (length >= 7) {
      this.result = 'Strong Password';
      this.activeColor = strongColor;
      this.strong = true;
    }
  }

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
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  suffixIcon: this.strong ? Icon(Icons.check_circle, color: strongColor) : null,
                ),
                style: TextStyle(color: Colors.black),
                obscuringCharacter: '*',
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    this.validatePassword(value);
                  });
                },
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, activeColor],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 10, top: 10),
                height: 5,
              ),
              Text(
                this.result,
                style: TextStyle(color: activeColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
