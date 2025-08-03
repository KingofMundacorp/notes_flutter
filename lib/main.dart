// ignore_for_file: unreachable_switch_default

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 204, 154),
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: const Color.fromARGB(255, 240, 154, 5),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, asyncSnapshot) {
          switch (asyncSnapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('Not connected to the internet.'),
              );

            case ConnectionState.waiting:
              // Show loading spinner while waiting
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.active:
              return const Center(
                child: Text('Processing...'), // Optional for streams
              );
            case ConnectionState.done:
              final mtumiaji = FirebaseAuth.instance.currentUser;

              if (mtumiaji?.emailVerified ?? false) {
                print('Wewe ni Mtumiaji aliyethibitishwa');
              } else {
                print('Tafadhali thibitisha barua pepe yako');
              }
              return const Center(child: Text('Welcome'));
            default:
              return const Center(child: Text('Something went wrong...'));
          }
        },
      ),
    );
  }
}
