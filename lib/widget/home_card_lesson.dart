import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisa_academy/models/lesson_model.dart';

class HomeCardLesson extends StatelessWidget {
  final LessonModel lesson;

  const HomeCardLesson({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Get.toNamed('/courseOverview', arguments: lesson);
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          width: width * 0.6,
          height: height * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(15),
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
                        lesson.image,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: FavoriteButton(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: lesson.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 53, 106),
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: ' (${lesson.numberOfLesson})',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 96, 96, 96),
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 221, 240, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 2, bottom: 2, left: 7, right: 7),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.schedule_rounded,
                              color: Colors.blue,
                              size: 17,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              lesson.timePeriod,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star_rate_rounded,
                      size: 20,
                      color: Colors.amber,
                    ),
                    Text(
                      lesson.rating,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
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
      color: Colors.grey,
      style: IconButton.styleFrom(
        iconSize: 20,
        minimumSize: Size.zero,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 2,
      ),
      icon: isFavorite
          ? const Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : const Icon(Icons.favorite_border),
      tooltip: 'Favorite',
    );
  }
}
