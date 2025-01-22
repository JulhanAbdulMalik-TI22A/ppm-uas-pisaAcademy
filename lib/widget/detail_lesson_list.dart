import 'package:flutter/material.dart';
import 'package:pisa_academy/models/lesson_model.dart';

class DetailLessonList extends StatelessWidget {
  final DetailLessonModel detailLesson;

  const DetailLessonList({
    super.key,
    required this.detailLesson,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            IconButton(
              tooltip: 'Play',
              onPressed: () {},
              color: Colors.blue,
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                iconSize: 32,
                minimumSize: Size.zero,
              ),
              icon: const Icon(Icons.play_arrow_rounded),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailLesson.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    detailLesson.time,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
