import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage("assets/images/pattern1.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/images/logo_splash.png"),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 32.0,
              child: Column(
                children: [
                  Text(
                    "From",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "ExpertFlutter",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
