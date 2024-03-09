// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakaya/BooksDetails/BookDetailsScreen.dart';
import 'package:hakaya/Colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:hakaya/HomeScreens/ListBooksScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.sizeOf(context).height;
    double W = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/jpg/backgroundSplash.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                        'مرحبا ,أحمد',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.almarai(
                            color: Colors.black, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'اهلاً بك في تطبيقنا!',
                      style: GoogleFonts.almarai(
                          color: AppColors.B200, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  width: 180,
                ),
                SvgPicture.asset(
                  'assets/svg/bell1.svg',
                  width: 20,
                )
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                width: W / 1.1,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3), // لون الحدود
                      width: 1, // عرض الحدود
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(width: 6),
                        Column(
                          children: [
                            Container(
                              width: 150,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'ابحث عن كتابك',
                                  hintStyle: TextStyle(
                                    color: AppColors.B75,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/svg/filter_search.svg',
                        width: 30,
                      ),
                      onPressed: () {
                        // يمكنك إضافة السلوك المناسب هنا
                      },
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
                  buildOption(1, 'كتب', 'assets/svg/diary-bookmarks1_no.svg'),
                  buildOption(
                      2, 'مجتمعات', 'assets/svg/diary-bookmarks2_no.svg'),
                  buildOption(
                      3, 'ملخصات', 'assets/svg/diary-bookmarks3_no.svg'),
                  buildOption(4, 'كُتاب', 'assets/svg/diary-bookmarks4_no.svg'),
                ],
              ),
              SizedBox(height: 20),
              // يمكنك عرض المحتوى المحدد هنا
              selectedOption == 1
                  ? Book()
                  : selectedOption == 2
                      ? Text('محتوى الخيار 2')
                      : selectedOption == 3
                          ? Text('محتوى الخيار 3')
                          : Text('محتوى الخيار 4'),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildOption(int option, String text, String imagePath) {
    String selectedImagePath = 'assets/svg/diary-bookmarks$option.svg';

    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Column(
        children: [
          SvgPicture.asset(
            selectedOption == option ? selectedImagePath : imagePath,
            width: 50,
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: selectedOption == option ? AppColors.B300 : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class Book extends StatefulWidget {
  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  Future<List<dynamic>> loadBookData() async {
    String jsonString = await rootBundle.loadString('assets/data/Books.json');
    return json.decode(jsonString)['Books'];
  }

  Future<List<dynamic>> loadBookData2() async {
    String jsonString = await rootBundle.loadString('assets/data/Book2.json');
    return json.decode(jsonString)['Books'];
  }

  Future<List<dynamic>> loadBookData3() async {
    String jsonString = await rootBundle.loadString('assets/data/Book3.json');
    return json.decode(jsonString)['Books'];
  }

  Future<List<dynamic>> loadBookData4() async {
    String jsonString = await rootBundle.loadString('assets/data/Book4.json');
    return json.decode(jsonString)['Books'];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(
                  'الكتب الأكثرة شهرة',
                  style: GoogleFonts.almarai(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListBooksScreen(),
                    ),
                  );
                },
                child: Text(
                  'المزيد',
                  style: GoogleFonts.almarai(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(),
                ),
              );
            },
            child: FutureBuilder(
              future: loadBookData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }

                  // Assuming snapshot.data contains a list of books
                  List<dynamic> books = snapshot.data ?? [];

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List<Widget>.generate(books.length, (index) {
                        var book = books[index];
                        return Container(
                          width: 200,
                          height: 250,
                          child: Column(
                            children: [
                              Container(
                                width: 130,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    book['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 140,
                                child: Text(
                                  book['title'],
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 140,
                                child: Text(
                                  book['author'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xffABABAB),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(
                  'ادب وروايات',
                  style: GoogleFonts.almarai(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListBooksScreen(),
                    ),
                  );
                },
                child: Text(
                  'المزيد',
                  style: GoogleFonts.almarai(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: loadBookData2(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }

                // Assuming snapshot.data contains a list of books
                List<dynamic> books = snapshot.data ?? [];

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List<Widget>.generate(books.length, (index) {
                      var book = books[index];
                      return Container(
                        width: 200,
                        height: 250,
                        child: Column(
                          children: [
                            Container(
                              width: 130,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  book['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 140,
                              child: Text(
                                book['title'],
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 140,
                              child: Text(
                                book['author'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffABABAB),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(
                  'علم النفس',
                  style: GoogleFonts.almarai(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListBooksScreen(),
                    ),
                  );
                },
                child: Text(
                  'المزيد',
                  style: GoogleFonts.almarai(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: loadBookData3(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }

                // Assuming snapshot.data contains a list of books
                List<dynamic> books = snapshot.data ?? [];

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List<Widget>.generate(books.length, (index) {
                      var book = books[index];
                      return Container(
                        width: 200,
                        height: 250,
                        child: Column(
                          children: [
                            Container(
                              width: 130,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  book['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 140,
                              child: Text(
                                book['title'],
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 140,
                              child: Text(
                                book['author'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffABABAB),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(
                  'الكتب المضافة حديثاً',
                  style: GoogleFonts.almarai(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListBooksScreen(),
                    ),
                  );
                },
                child: Text(
                  'المزيد',
                  style: GoogleFonts.almarai(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: loadBookData4(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }

                // Assuming snapshot.data contains a list of books
                List<dynamic> books = snapshot.data ?? [];

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List<Widget>.generate(books.length, (index) {
                      var book = books[index];
                      return Container(
                        width: 200,
                        height: 250,
                        child: Column(
                          children: [
                            Container(
                              width: 130,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  book['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 140,
                              child: Text(
                                book['title'],
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 140,
                              child: Text(
                                book['author'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffABABAB),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
