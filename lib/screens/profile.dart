import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisa_academy/controllers/auth_controller.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 248, 255),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color.fromARGB(255, 244, 248, 255),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.settings_rounded),
      //     ),
      //     SizedBox(width: width * 0.03),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.03),
                Center(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/profile_JulhanAbdulMalik.jpg',
                          height: height * 0.11,
                          width: height * 0.11,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: width * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: Color.fromARGB(255, 12, 53, 106),
                          ),
                          SizedBox(height: height * 0.005),
                          const Text(
                            'Julhan A Malik',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'julhan.abdul_ti22@nusaputra.ac.id',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Bagian Pilihan Menu
                const Text(
                  'Informasi Akun',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.015),

                MenuItem(
                  icon: Icons.person,
                  text: 'Edit Profil',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.lock,
                  text: 'Ubah Kata Sandi',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.notifications,
                  text: 'Notifikasi',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.settings_rounded,
                  text: 'Pengaturan',
                  onTap: () {},
                ),

                SizedBox(height: height * 0.005),

                const Text(
                  'Lainnya',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.015),

                MenuItem(
                  icon: Icons.help_outline,
                  text: 'Bantuan',
                  onTap: () {},
                ),
                MenuItem(
                  icon: Icons.info_outline,
                  text: 'Tentang Aplikasi',
                  onTap: () {},
                ),

                SizedBox(height: height * 0.01),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      authController.logout();
                      Get.toNamed('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 17,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: SizedBox(
                      width: width * 0.2,
                      height: height * 0.03,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: width * 0.02),
                          const Text(
                            'Keluar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blue,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 15,
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.arrow_forward_ios),
              //   color: Colors.grey,
              //   iconSize: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
