import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(45),
              child: Image.asset(
                'assets/images/on-boarding.png',
                height: height * 0.55,
              ),
            ),
            const Text(
              'Selamat Datang di \nAplikasi PISA academy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.01),
            const Text(
              'Solusi Digital untuk Meningkatkan \nPrestasi Global!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 35, right: 35),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    '/login',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 61, 143, 239),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 16, height: 3),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
