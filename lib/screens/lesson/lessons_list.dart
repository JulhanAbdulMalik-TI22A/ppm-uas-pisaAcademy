import 'package:flutter/material.dart';
import 'package:pisa_academy/models/lesson_model.dart';
import 'package:pisa_academy/widget/card_lesson_list.dart';

class LessonsList extends StatelessWidget {
  const LessonsList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 248, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('List Pelajaran'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 221, 240, 255),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 14, right: 14),
                              child: Row(
                                children: [
                                  const Text(
                                    'UI Design',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.close_rounded,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 221, 240, 255),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 14, right: 14),
                              child: Row(
                                children: [
                                  const Text(
                                    'UX Design',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.close_rounded,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 221, 240, 255),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 14, right: 14),
                              child: Row(
                                children: [
                                  const Text(
                                    'UI & UX Design',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.close_rounded,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 221, 240, 255),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 14, right: 14),
                              child: Row(
                                children: [
                                  const Text(
                                    'UI Design',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.close_rounded,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    //

                    Expanded(
                      child: ListView.builder(
                        itemCount: lessonList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CardLessonList(lesson: lessonList[index]),
                            ],
                          );
                        },
                      ),
                    ),
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
