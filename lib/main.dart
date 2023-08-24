import 'package:flutter/material.dart';
import 'package:flutter_application/application.dart';
import 'package:flutter_application/initialize_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(Application());
}
