import 'package:flutter/material.dart';
import 'package:freshcut_test/views/home_page.dart';

import '../utils/utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freshcut Test',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
