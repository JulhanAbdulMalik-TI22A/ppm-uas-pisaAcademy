import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pisa_academy/models/student_model.dart';

class StudentController extends GetxController {
  /// Penyimpanan sementara Student
  var studentsSave = <StudentModel>[].obs;

  /// Link Firebase
  Uri baseUrl = Uri.parse('https://pisa-academy-default-rtdb.firebaseio.com/');

  @override
  void onInit() {
    super.onInit();
    initialData();
  }

  /// Fungsi untuk Tambah Student
  Future<void> addStudent(
    String nama,
    String kelas,
    String sekolah,
    String imageUrl,
  ) async {
    //
    Uri addUrl = baseUrl.replace(path: '/students.json');

    try {
      final response = await http.post(
        addUrl,
        body: json.encode(
          {
            'nama': nama,
            'kelas': kelas,
            'sekolah': sekolah,
            'imageUrl': imageUrl,
            'createdAt': DateTime.now().toString(),
          },
        ),
      );

      if (response.statusCode == 200) {
        final firebaseKey = json.decode(response.body)['name'].toString();

        final newStudent = StudentModel(
          nisn: firebaseKey,
          nama: nama,
          kelas: kelas,
          sekolah: sekolah,
          imageUrl: imageUrl,
          createdAt: DateTime.now(),
        );
        studentsSave.add(newStudent);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (erorr) {
      Get.snackbar(
        'Erorr',
        'Gagal menambahkan data: $erorr',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        margin: const EdgeInsets.all(15),
      );
    }
  }

  /// Fungsi untuk Edit Student
  Future<void> editStudent(
    String nisn,
    String nama,
    String kelas,
    String sekolah,
    String imageUrl,
  ) async {
    //
    Uri editUrl = baseUrl.replace(path: '/students/$nisn.json');

    try {
      final response = await http.patch(
        editUrl,
        body: json.encode(
          {
            "nama": nama,
            "kelas": kelas,
            "sekolah": sekolah,
            "imageUrl": imageUrl,
          },
        ),
      );

      if (response.statusCode == 200) {
        //
        final studentIndex =
            studentsSave.indexWhere((student) => student.nisn == nisn);

        if (studentIndex != -1) {
          studentsSave[studentIndex] = StudentModel(
            nisn: nisn,
            nama: nama,
            kelas: kelas,
            sekolah: sekolah,
            imageUrl: imageUrl,
            createdAt: studentsSave[studentIndex].createdAt,
          );
        } else {
          throw Exception(response.statusCode);
        }
      }
    } catch (erorr) {
      Get.snackbar(
        'Erorr',
        'Gagal mengedit data $erorr',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        margin: const EdgeInsets.all(15),
      );
    }
  }

  /// Fungsi untuk Delete Player
  Future<void> deleteData(String nisn) async {
    //
    Uri deleteUrl = baseUrl.replace(path: '/students/$nisn.json');

    try {
      final response = await http.delete(deleteUrl);

      if (response.statusCode == 200) {
        studentsSave.removeWhere((student) => student.nisn == nisn);

        Get.snackbar(
          'Hapus',
          'Data berhasil dihapus',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 255, 193, 188),
          margin: const EdgeInsets.all(15),
        );
      } else {
        throw Exception(response.statusCode);
      }
    } catch (erorr) {
      Get.snackbar(
        'Erorr',
        'Gagal Menghapus Data $erorr',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        margin: const EdgeInsets.all(15),
      );
    }
  }

  /// Fungsi untuk mengambil Data Student dari Firbase
  Future<void> initialData() async {
    //
    Uri getUrl = baseUrl.replace(path: '/students.json');

    try {
      final response = await http.get(getUrl);

      if (response.statusCode == 200) {
        final dataRespone = json.decode(response.body) as Map<String, dynamic>?;

        if (dataRespone != null && dataRespone.isNotEmpty) {
          for (var entry in dataRespone.entries) {
            final value = entry.value;

            if (value.containsKey('nama') &&
                value.containsKey('kelas') &&
                value.containsKey('sekolah') &&
                value.containsKey('imageUrl') &&
                value.containsKey('createdAt')) {
              final getStudent = StudentModel(
                nisn: entry.key,
                nama: value['nama'],
                kelas: value['kelas'],
                sekolah: value['sekolah'],
                imageUrl: value['imageUrl'],
                createdAt: DateTime.parse(value['createdAt']),
              );

              if (!studentsSave.any((student) => student.nisn == entry.key)) {
                studentsSave.add(getStudent);
              } else {
                print('Data Student dengan NISN ${entry.key} tidak valid');
              }
            } else {
              print('Tidak ada Data untuk diambil');
            }
          }
        } else {
          throw Exception(response.statusCode);
        }
      }
    } catch (erorr) {
      Get.snackbar(
        'Erorr',
        'Gagal mendapatkan data: $erorr',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        margin: const EdgeInsets.all(15),
      );
    }
  }
}
