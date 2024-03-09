// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaya/BooksDetails/ReadBookScreen.dart';
import 'package:hakaya/Colors.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  ValueNotifier<bool> isPlayingNotifier = ValueNotifier(false);
  PlayerController playerController = PlayerController();

  RecorderController controller = RecorderController();

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  void toggleAudio() async {
    if (isPlayingNotifier.value) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(AssetSource('/podcast.mp3'));
    }

    isPlayingNotifier.value = !isPlayingNotifier.value; // تحديث الحالة هنا
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'عن الكتاب',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.B50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/png/Book1.png',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'الخيميائي',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'باولو كويلي',
                        style:
                            TextStyle(color: Color(0xffABABAB), fontSize: 15),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.verified_outlined,
                                color: AppColors.B300,
                              ),
                              Text(
                                '2014',
                                style: TextStyle(color: AppColors.B300),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_border,
                                color: AppColors.B300,
                              ),
                              Text(
                                '4.00',
                                style: TextStyle(color: AppColors.B300),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 19,
              ),
              Container(
                width: 350,
                child: Text(
                  'وصف الكتاب',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.B50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                      '🌟 الدعوة المغرية: لا تُفوت فرصة الانضمام إلى سانتياغو في رحلته المثيرة. \"الخيميائي\" ليس مجرد كتاب، بل هو خريطة الكنوز لروحك. اقلب الصفحة، واستعد لرحلة تُغير من نظرتك للعالم! هل أنت مستعد لتتبع أحلامك؟ افتح الكتاب وابدأ الرحلة! 🚀'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                child: Text(
                  'الفصول',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.B50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                              color: AppColors.B500,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'الفصل الأول',
                                      style: TextStyle(
                                        color: AppColors.B50,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'البداية',
                                      style: TextStyle(
                                          color: AppColors.B100, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset('assets/svg/fsol.svg')
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 70,
                          decoration: BoxDecoration(
                              color: AppColors.B500,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'الفصل الثاني',
                                      style: TextStyle(
                                        color: AppColors.B50,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'مسارات السلام والتحول',
                                      style: TextStyle(
                                          color: AppColors.B100, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset('assets/svg/fsol.svg')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                child: Text(
                  'قالوا عن الكتاب',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 350,
                height: 130,
                decoration: BoxDecoration(
                  color: AppColors.B50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                15), // يضيف دائرة القص للزوايا
                            child: Image.asset(
                              'assets/png/come.png',
                              fit: BoxFit
                                  .cover, // هذا سيجعل الصورة تغطي الحاوية بالكامل
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                15), // يضيف دائرة القص للزوايا
                            child: Image.asset(
                              'assets/png/come.png',
                              fit: BoxFit
                                  .cover, // هذا سيجعل الصورة تغطي الحاوية بالكامل
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                15), // يضيف دائرة القص للزوايا
                            child: Image.asset(
                              'assets/png/come.png',
                              fit: BoxFit
                                  .cover, // هذا سيجعل الصورة تغطي الحاوية بالكامل
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadBookScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColors.B300,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/ktab.svg',
                              width: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'قراءة الكتاب',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 500,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  'assets/png/Book2.png',
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'موسم الهجرة إلى الشمال',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'الطيب الصالح',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center, // لتوسيط الزر
                                  children: [
                                    CircleAvatar(
                                        radius: 30, // حجم الدائرة
                                        backgroundColor:
                                            AppColors.B300, // لون خلفية الدائرة
                                        child: ValueListenableBuilder(
                                          valueListenable: isPlayingNotifier,
                                          builder: (context, value, child) {
                                            return CircleAvatar(
                                              radius: 30,
                                              backgroundColor: AppColors.B300,
                                              child: IconButton(
                                                icon: Icon(value
                                                    ? Icons.pause
                                                    : Icons.play_arrow),
                                                color: Colors.white,
                                                onPressed: toggleAudio,
                                              ),
                                            );
                                          },
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.B300),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/AI.svg',
                              width: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'بودكاست',
                              style: TextStyle(
                                color: AppColors.B300,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
