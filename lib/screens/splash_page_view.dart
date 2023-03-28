import 'dart:async';

import 'package:flutter/material.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    super.initState();
    splashTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.book,
              color: Colors.blue,
              size: 100,
            ),
            SizedBox(height: 10),
            Text('CRUD Provider',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }

  splashTime() {
    return Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/wrapper');
    });
  }
}
