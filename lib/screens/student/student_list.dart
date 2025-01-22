import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisa_academy/controllers/student_controller.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final StudentController getStudentController = Get.put(StudentController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 248, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('List Siswa'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/addStudent');
            },
            icon: const Icon(Icons.add_rounded),
          ),
          SizedBox(width: width * 0.03),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.73,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Pencarian',
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 192, 192, 192)),
                              prefixIcon: const Icon(Icons.search_rounded),
                              prefixIconColor:
                                  const Color.fromARGB(255, 168, 168, 168),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.058,
                          width: width * 0.12,
                          child: IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 61, 143, 239),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            icon: const Icon(Icons.filter_list_rounded),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),
                    //
                    Expanded(
                      child: Obx(
                        () => getStudentController.studentsSave.isEmpty
                            ? const Center(
                                child: Text('Tidak ada Siswa.'),
                              )
                            : ListView.builder(
                                itemCount:
                                    getStudentController.studentsSave.length,
                                itemBuilder: (context, index) {
                                  //
                                  final students =
                                      getStudentController.studentsSave[index];

                                  return Card(
                                    elevation: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 7,
                                        bottom: 7,
                                      ),
                                      child: ListTile(
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            child: CachedNetworkImage(
                                              imageUrl: students.imageUrl,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.network(
                                                'https://i.pinimg.com/736x/16/18/20/1618201e616f4a40928c403f222d7562.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          students.nama,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromARGB(
                                                255, 12, 53, 106),
                                          ),
                                        ),
                                        subtitle: Text(
                                          'Kelas ${students.kelas} - ${students.sekolah}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromARGB(255, 96, 96, 96),
                                          ),
                                        ),
                                        trailing: PopupMenuButton(
                                          itemBuilder: (BuildContext context) =>
                                              [
                                            const PopupMenuItem(
                                              value: 'edit',
                                              child: ListTile(
                                                leading: Icon(
                                                  Icons.edit,
                                                  size: 17,
                                                  color: Color.fromARGB(
                                                      255, 96, 96, 96),
                                                ),
                                                title: Text(
                                                  'Edit',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 96, 96, 96),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const PopupMenuItem(
                                              value: 'delete',
                                              child: ListTile(
                                                leading: Icon(
                                                  Icons.delete,
                                                  size: 17,
                                                  color: Color.fromARGB(
                                                      255, 96, 96, 96),
                                                ),
                                                title: Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 96, 96, 96),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                          onSelected: (value) {
                                            if (value == 'edit') {
                                              Get.toNamed('/editStudent',
                                                  arguments: students);
                                            } else if (value == 'delete') {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text('Delete'),
                                                    content: const Text(
                                                      'Are you sure delete the player?',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child:
                                                            const Text('Batal'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          getStudentController
                                                              .deleteData(
                                                                  students
                                                                      .nisn);
                                                        },
                                                        child: const Text(
                                                          'Hapus',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          child: const Icon(
                                            Icons.more_vert,
                                            color:
                                                Color.fromARGB(255, 96, 96, 96),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                    // const SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
