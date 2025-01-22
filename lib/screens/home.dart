import 'package:flutter/material.dart';
import 'package:pisa_academy/models/lesson_model.dart';
import 'package:pisa_academy/widget/card_lesson_list.dart';
import 'package:pisa_academy/widget/home_card_lesson.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 248, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, Julhan A Malik',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'PISA academy',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.007),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              'assets/images/logo_pisa.png',
                              height: height * 0.065,
                              width: height * 0.065,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
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
                            icon: Icon(Icons.format_list_bulleted_rounded),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 168,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 172, 215, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 21,
                          top: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Materi Berqulitas',
                                  style: TextStyle(fontSize: 16),
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      '+50',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Pelajaran',
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Navigator.pushNamed(
                                        //     context, '/lessonsList');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text(
                                        'Lihat Semua',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.45,
                              child:
                                  Image.asset('assets/images/banner_image.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pelajaran Terbaru',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              SizedBox(
                height: height * 0.35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lessonList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 22 : 10,
                        right: index == lessonList.length - 1 ? 22 : 0,
                      ),
                      child: HomeCardLesson(lesson: lessonList[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'List Pelajar Populer',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 7),
                child: SizedBox(
                  height: height * 0.45,
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
              ),
              const SizedBox(height: 7),
            ],
          ),
        ),
      ),
    );
  }
}
