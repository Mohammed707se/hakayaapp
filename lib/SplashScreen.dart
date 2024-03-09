// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakaya/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaya/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.sizeOf(context).height;
    double W = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.B300,
      body: Column(
        children: [
          SizedBox(
            height: H / 3,
          ),
          Center(
            child: Image.asset(
              'assets/png/SplashScreen.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: H / 3.5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SplashScreen2(),
                ),
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                    child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20,
                  color: AppColors.B200,
                )),
                Container(
                  child: Text(
                    'ابدا المتعة',
                    style: GoogleFonts.almarai(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.sizeOf(context).height;
    double W = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/jpg/backgroundSplash.jpg'), // استبدل بمسار صورتك
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black87.withOpacity(0.60), // تحديد شفافية اللون الأسود
              BlendMode.darken, // وضع الدمج لتحقيق التأثير المطلوب
            ),
          ),
        ),
        child: Center(
          // يمكنك إضافة محتوى إضافي هنا
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: H / 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Stack(
                      children: [
                        Image.asset('assets/png/splash2.png'),
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0, right: 70),
                          child: Image.asset(
                            'assets/png/hakaya.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150.0),
                    child: Image.asset('assets/png/slider.png'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 300,
                        child: Text(
                          'اهلاً بك',
                          style: GoogleFonts.almarai(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        child: Text(
                          'نبث الحياة في الحروف و  القصص إلى , نعيد صياغة مفهوم القراءة ليصبح نشاطاً ممتعاً يجمع بين التعلم والتسلية',
                          style: GoogleFonts.almarai(
                            color: AppColors.B200,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset('assets/svg/arrow_co.svg'),
                        Text(
                          'ابدا المتعة',
                          style: GoogleFonts.almarai(color: AppColors.B200),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
