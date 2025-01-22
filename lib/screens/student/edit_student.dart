import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisa_academy/controllers/student_controller.dart';
import 'package:pisa_academy/models/student_model.dart';

class EditStudent extends StatelessWidget {
  final StudentModel studentModel;

  const EditStudent({
    super.key,
    required this.studentModel,
  });

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    //
    final StudentController studentController = Get.find();

    final namaController = TextEditingController(text: studentModel.nama);
    final kelasController = TextEditingController(text: studentModel.kelas);
    final sekolahController = TextEditingController(text: studentModel.sekolah);
    final imageUrlController =
        TextEditingController(text: studentModel.imageUrl);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 248, 255),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: const Text('Edit Siswa'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: CachedNetworkImage(
                          imageUrl: imageUrlController.text,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.network(
                              'https://i.pinimg.com/736x/16/18/20/1618201e616f4a40928c403f222d7562.jpg'),
                          fit: BoxFit.cover,
                        ),
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
                              .editStudent(
                            studentModel.nisn,
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
                                'Data berhasil diedit',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor:
                                    const Color.fromARGB(133, 255, 235, 59),
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
                      child: const Text('Edit Siswa'),
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
