import 'package:flutter/material.dart';
import 'package:flutter_application/presentation/pages/home_page.dart';

import 'themes.dart';

class Application extends StatefulWidget {
  static const path = 'Application';

  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light(context),
      home: HomePage(),
    );
  }
}
