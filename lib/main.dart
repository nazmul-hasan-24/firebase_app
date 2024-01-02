
import 'package:firebase/fire_base_app.dart';
import 'package:firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 void main() async {
   WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   runApp(const FirebaseStudentApp());
 }
