import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:e_saviour/user/screens/register.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 4, 4));
      
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular( 5.0),
                      side: const BorderSide(
                          color:   Color.fromARGB(193, 244, 67, 54),), 
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(
                        193, 244, 67, 54), // Background color
                  ),
        ),
      ),
      home: const RegisterForm(),
    );
  }
}

