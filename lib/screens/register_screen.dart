import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:submission_5_story_app/config/state.dart';
import 'package:submission_5_story_app/providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dicoding Story App',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.left
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Register Page',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20)
                      )
                    ),
                    hintText: 'Input your name'
                  ),
                  controller: _name,
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20)
                      )
                    ),
                    hintText: 'Input your email or username'
                  ),
                  controller: _username,
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20)
                      )
                    ),
                    hintText: 'Input your password'
                  ),
                  controller: _password,
                ),
                const SizedBox(height: 10),
                Consumer<AuthProvider>(
                  builder: (context, provider, child) {
                    return ElevatedButton(
                      onPressed: () async {
                        await provider.register({
                          'name': _name.text,
                          'email': _username.text,
                          'password': _password.text
                        });

                        if (provider.state == ProviderState.success && context.mounted) {
                          context.go('/login');
                        }
                      }, 
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20)
                          )
                        )
                      ),
                      child: provider.state == ProviderState.loading 
                        ? const CircularProgressIndicator() 
                        : const Text('Register'),
                    );
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => context.go('/login'), 
                  child: const Text('Sudah punya akun? login sekarang')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}