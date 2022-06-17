import 'package:flutter/material.dart';

class GoogleLoginPage extends StatefulWidget {
  const GoogleLoginPage({Key? key}) : super(key: key);

  @override
  _GoogleLoginPageState createState() => _GoogleLoginPageState();
}

class _GoogleLoginPageState extends State<GoogleLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.redAccent,
                  Colors.blueAccent,
                ],
              ),
            ),
            child: Card(
              margin:
                  EdgeInsets.only(top: 150, bottom: 150, left: 30, right: 30),
              elevation: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Text(
                    "Login With google",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: () {},
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   height: 30,
                        //   width: 30,
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: NetworkImage(
                        //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTouwCuB4AjiAfwmec9TL4gJEKqXw3pxBDe8g&usqp=CAU"),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}