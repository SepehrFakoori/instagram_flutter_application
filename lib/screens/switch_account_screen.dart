import 'dart:ui';

import 'package:flutter/material.dart';

class SwitchAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/switch_account_background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        height: 352.0,
                        width: 340.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.red,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              // Colors.white.withOpacity(0.5),
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 32.0,
                            ),
                            Image(
                              image: AssetImage("assets/images/profile.png"),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Amir Ahmad Adibi",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              height: 46,
                              width: 129,
                              child: ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () {},
                                child: Text("Confirm"),
                              ),
                            ),
                            SizedBox(
                              height: 32.0,
                            ),
                            Text(
                              "switch account",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 62.0, top: 132.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an account? /',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontFamily: "GB",
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "GB",
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
