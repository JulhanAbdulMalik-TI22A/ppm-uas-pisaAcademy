class LessonModel {
  final String image, title, numberOfLesson, timePeriod, rating;

  LessonModel({
    required this.image,
    required this.title,
    required this.numberOfLesson,
    required this.timePeriod,
    required this.rating,
  });
}

class DetailLessonModel {
  final String title, time;

  DetailLessonModel({
    required this.title,
    required this.time,
  });
}

var lessonList = [
  LessonModel(
    image: 'assets/images/lessons_image-02.jpg',
    title: 'Membaca Pemahaman',
    numberOfLesson: '20 pelajaran',
    timePeriod: '4h 15min',
    rating: '4.8',
  ),
  LessonModel(
    image: 'assets/images/lessons_image-03.jpg',
    title: 'Matematika Dasar',
    numberOfLesson: '30 pelajaran',
    timePeriod: '7h 00min',
    rating: '4.9',
  ),
  LessonModel(
    image: 'assets/images/lessons_image-04.jpg',
    title: 'Eksperimen Sains',
    numberOfLesson: '25 pelajaran',
    timePeriod: '5h 30min',
    rating: '4.7',
  ),
  LessonModel(
    image: 'assets/images/lessons_image-05.jpg',
    title: 'Membaca Cepat',
    numberOfLesson: '18 pelajaran',
    timePeriod: '3h 45min',
    rating: '4.6',
  ),
  LessonModel(
    image: 'assets/images/lessons_image-06.jpg',
    title: 'Aljabar untuk Anak',
    numberOfLesson: '32 pelajaran',
    timePeriod: '6h 50min',
    rating: '5.0',
  ),
];

var detailLessonListMatematika = [
  DetailLessonModel(
    title: 'Pengenalan Angka',
    time: '10:00 min',
  ),
  DetailLessonModel(
    title: 'Penjumlahan dan Pengurangan',
    time: '12:30 min',
  ),
  DetailLessonModel(
    title: 'Perkalian Dasar',
    time: '15:00 min',
  ),
  DetailLessonModel(
    title: 'Pembagian Sederhana',
    time: '14:00 min',
  ),
  DetailLessonModel(
    title: 'Pengenalan Pecahan',
    time: '13:15 min',
  ),
  DetailLessonModel(
    title: 'Aljabar Dasar',
    time: '16:30 min',
  ),
  DetailLessonModel(
    title: 'Geometri Dasar',
    time: '11:45 min',
  ),
];
