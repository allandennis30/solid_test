import 'package:flutter/material.dart';
import 'package:solid_project/solid_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SolidAppRunner.run();
  runApp(const SolidApp());
}
