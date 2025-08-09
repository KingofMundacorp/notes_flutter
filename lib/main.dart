// ignore_for_file: unreachable_switch_default

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, asyncSnapshot) {
        switch (asyncSnapshot.connectionState) {
          case ConnectionState.none:
            return const Center(child: Text('Not connected to the internet.'));

          case ConnectionState.waiting:
            // Show loading spinner while waiting
            return const Center(child: CircularProgressIndicator());

          case ConnectionState.active:
            return const Center(
              child: Text('Processing...'), // Optional for streams
            );
          case ConnectionState.done:
            final mtumiaji = FirebaseAuth.instance.currentUser;

            if (mtumiaji != null) {
              if (mtumiaji.emailVerified) {
                print('Wewe ni Mtumiaji aliyethibitishwa');
                return const Center(child: Text('Welcome'));
              } else {
                print('Tafadhali thibitisha barua pepe yako');
                return VerifyEmailView();
              }
            } else {
              return LoginView();
            }

            

          default:
            return const Center(child: Text('Something went wrong...'));
        }
      },
    );
  }
}
