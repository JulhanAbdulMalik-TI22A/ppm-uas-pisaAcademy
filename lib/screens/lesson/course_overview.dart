import 'package:flutter/material.dart';
import 'package:pisa_academy/models/lesson_model.dart';
import 'package:pisa_academy/widget/detail_lesson_list.dart';

class CourseOverview extends StatelessWidget {
  final LessonModel lessonModel;

  const CourseOverview({
    super.key,
    required this.lessonModel,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 248, 255),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
          title: const Text('Pelajaran'),
          actions: const [
            FavoriteButton(),
            SizedBox(width: 12),
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
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            child: Image.asset(
                              lessonModel.image,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: height * 0.09,
                            right: width * 0.38,
                            child: Material(
                              elevation: 3,
                              shape: const CircleBorder(),
                              child: IconButton(
                                tooltip: 'Play',
                                onPressed: () {},
                                color: Colors.blue,
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  iconSize: 40,
                                  minimumSize: Size.zero,
                                ),
                                icon: const Icon(Icons.play_arrow_rounded),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        lessonModel.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 12, 53, 106),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule_rounded,
                                color: Colors.grey,
                                size: 19,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                lessonModel.timePeriod,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              const Text('  -  ',
                                  style: TextStyle(color: Colors.grey)),
                              Text(
                                lessonModel.numberOfLesson,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 221, 240, 255),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, bottom: 2, left: 7, right: 13),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star_rate_rounded,
                                    size: 23,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    lessonModel.rating,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const TabBar(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                        unselectedLabelColor:
                            Color.fromARGB(255, 207, 207, 207),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(text: 'Lessons'),
                          Tab(text: 'Description'),
                        ],
                      ),
                      //

                      Expanded(
                        child: ListView.builder(
                          itemCount: detailLessonListMatematika.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: index == 0 ? 10 : 0,
                                    bottom: index ==
                                            detailLessonListMatematika.length -
                                                1
                                        ? 10
                                        : 0,
                                  ),
                                  child: DetailLessonList(
                                    detailLesson:
                                        detailLessonListMatematika[index],
                                  ),
                                ),
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
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: isFavorite
          ? const Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            )
          : const Icon(Icons.favorite_outline_rounded),
    );
  }
}
