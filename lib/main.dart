import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisa_academy/controllers/auth_controller.dart';
import 'package:pisa_academy/screens/bottom_nav_screen.dart';
import 'package:pisa_academy/screens/lesson/course_overview.dart';
import 'package:pisa_academy/screens/lesson/lessons_list.dart';
import 'package:pisa_academy/screens/login.dart';
import 'package:pisa_academy/screens/onboarding.dart';
import 'package:pisa_academy/screens/student/add_student.dart';
import 'package:pisa_academy/screens/student/edit_student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi AuthenticationController
    Get.put(AuthController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PISA academy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 12, 53, 106),
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 12, 53, 106),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 12, 53, 106),
          ),
        ),
      ),
      home: Obx(() {
        final authController = Get.find<AuthController>();
        return authController.isAuthenticated
            ? BottomNavScreen()
            : Onboarding();
      }),
      getPages: [
        GetPage(name: '/', page: () => const Onboarding()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(
          name: '/bottomNavScreen',
          page: () => BottomNavScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 800),
        ),
        GetPage(
          name: '/courseOverview',
          page: () => CourseOverview(
            lessonModel: Get.arguments,
          ),
        ),
        GetPage(name: '/lessonsList', page: () => const LessonsList()),
        GetPage(name: '/addStudent', page: () => const AddStudent()),
        GetPage(
          name: '/editStudent',
          page: () => EditStudent(
            studentModel: Get.arguments,
          ),
        ),
      ],
    );
  }
}
