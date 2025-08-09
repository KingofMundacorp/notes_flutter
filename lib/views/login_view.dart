// ignore_for_file: unreachable_switch_default

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 204, 154),
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 240, 154, 5),
        elevation: 4,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Sign in to an Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
        
              // Email Field
              TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
        
              // Password Field
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 32),
        
              // Register Button
              SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      final thisCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                      // print(thisCredential);
        
                      // Success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Welcome back, ${thisCredential.user?.email}!',
                          ),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-credential') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('The Credentials used are incorrect'),
                          ),
                        );
                      } else if (e.code == 'invalid-email') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("The email format isn't correct")),
                        );
                      }
                    } catch (e) {
                      // Catch other errors
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Unexpected error: $e')),
                      );
                    }
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text('Login', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: TextButton.icon(
                  onPressed: () async {
                    Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil('/register/', (route) => false);
                  },
                  icon: const Icon(Icons.person_add, color: Colors.blueAccent),
                  label: const Text(
                    'Not registered yet? Register here',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blueAccent, // Icon & text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
