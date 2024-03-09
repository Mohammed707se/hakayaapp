// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ListBooksScreen extends StatefulWidget {
  const ListBooksScreen({super.key});

  @override
  State<ListBooksScreen> createState() => _ListBooksScreenState();
}

class _ListBooksScreenState extends State<ListBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'الكُتب',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}