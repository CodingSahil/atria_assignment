import 'package:atria_assignment/app_bindings.dart';
import 'package:atria_assignment/core/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';

// firebase hosting:channel:deploy atria-assignment

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Atria Assignment',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
