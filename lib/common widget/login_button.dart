import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.buttonName,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0,
      shape: CircleBorder(),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, Colors.blue]),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black, blurRadius: 0.1, offset: Offset(5, 5))
            ]),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                buttonName,
                style: TextStyle(color: Colors.black),
              ),
              IconButton(
                icon: new Icon(Icons.arrow_forward),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
