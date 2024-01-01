import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double animationEnd = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          children: [
            TweenAnimationBuilder(
              onEnd: () {
                setState(() {
                  animationEnd = 1.0;
                });
              },
              tween: Tween<double>(begin: 100.0, end: 500.0),
              duration: const Duration(seconds: 3),
              builder: (context, value, child) {
                return Container(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/4/4f/Dash%2C_the_mascot_of_the_Dart_programming_language.png',
                    height: value,
                    width: value,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: animationEnd,
              child: const Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
