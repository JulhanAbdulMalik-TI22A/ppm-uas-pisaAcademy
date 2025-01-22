import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisa_academy/controllers/student_controller.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    //
    final StudentController studentController = Get.find();

    final namaController = TextEditingController();
    final kelasController = TextEditingController();
    final sekolahController = TextEditingController();
    final imageUrlController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 248, 255),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: const Text('Tambah Siswa'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.25,
                      child: Image.asset(
                        'assets/images/add_student.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //
                    _buildCustomTextField(
                        namaController, ' Nama', Icons.person),
                    const SizedBox(height: 16),
                    _buildCustomTextField(
                        kelasController, ' Kelas', Icons.class_),
                    const SizedBox(height: 16),
                    _buildCustomTextField(
                        sekolahController, ' Sekolah', Icons.school),
                    const SizedBox(height: 16),
                    _buildCustomTextField(
                        imageUrlController, ' Image URL', Icons.link),
                    const SizedBox(height: 30),
                    //
                    ElevatedButton(
                      onPressed: () {
                        if (namaController.text.isNotEmpty &&
                            kelasController.text.isNotEmpty &&
                            sekolahController.text.isNotEmpty &&
                            imageUrlController.text.isNotEmpty) {
                          studentController
                              .addStudent(
                            namaController.text,
                            kelasController.text,
                            sekolahController.text,
                            imageUrlController.text,
                          )
                              .then(
                            (_) {
                              Get.back();

                              Get.snackbar(
                                'Sukses',
                                'Data berhasil ditambahkan',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor:
                                    const Color.fromARGB(128, 76, 175, 79),
                                margin: const EdgeInsets.all(15),
                              );
                            },
                          );
                        } else {
                          Get.snackbar(
                            'Erorr',
                            'All field are required',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor:
                                const Color.fromARGB(49, 244, 67, 54),
                            margin: const EdgeInsets.all(15),
                          );
                        }
                      },
                      //
                      child: const Text('Tambah Siswa'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                    //
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 121, 168, 255)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 235, 242, 254), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 244, 248, 255), width: 1),
        ),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
      cursorColor: const Color.fromARGB(255, 121, 168, 255),
    );
  }
}
