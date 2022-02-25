import 'package:flutter/material.dart';
import 'package:map_demo/common%20widget/login_button.dart';
import 'package:map_demo/screen/home_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen(columnvalue: 5, rowvalue: 5)),
                  );
                },
                child: LoginButton(buttonName: "House Owner")),
            // LoginButton(buttonName: "Society Secretary"),
            // LoginButton(buttonName: "Society Owner"),
          ],
        ),
      ),
    );
  }
}
