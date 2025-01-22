import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pisa_academy/models/lesson_model.dart';

class CardLessonList extends StatelessWidget {
  final LessonModel lesson;

  const CardLessonList({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/courseOverview', arguments: lesson);
      },
      child: Stack(
        children: [
          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Image.asset(
                      lesson.image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 53, 106),
                          ),
                        ),
                        Text(
                          lesson.numberOfLesson,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 96, 96, 96),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              size: 19,
                              color: Colors.amber,
                            ),
                            Text(
                              lesson.rating,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const Text(
                              '  -  ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              lesson.timePeriod,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 7,
            right: 7,
            child: FavoriteButton(),
          ),
        ],
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
        iconSize: 25,
      ),
      icon: isFavorite
          ? const Icon(Icons.favorite, color: Colors.red)
          : const Icon(Icons.favorite_border),
    );
  }
}
