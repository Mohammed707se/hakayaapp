// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hakaya/Colors.dart';

class ReadBookScreen extends StatefulWidget {
  const ReadBookScreen({super.key});

  @override
  State<ReadBookScreen> createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 330,
          height: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/png/book1read.png',
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 300,
                child: Text(
                  '"عدت، ولم يعد معي غير الأشياء التي حملتها، وشيء فيّ ليس منها"',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PagesBook(),
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
                    child: Text(
                      'لنبدأ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
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

class PagesBook extends StatefulWidget {
  const PagesBook({super.key});

  @override
  State<PagesBook> createState() => _PagesBookState();
}

class _PagesBookState extends State<PagesBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
