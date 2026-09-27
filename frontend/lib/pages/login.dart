import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 10),

                // Logo
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),

                    const Spacer(),

                    const Text(
                      'PennyPal',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),

                    const Spacer(),

                    const SizedBox(width: 45),
                  ],
                ),

                const SizedBox(height: 30),

                // Title
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                // Description
                const Text(
                  'Log in to your account and\n'
                  'continue your financial journey.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 18),

                // Email
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enter your email address',
                    prefixIcon: const Icon(Icons.mail_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(
                      Icons.visibility_off_outlined,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Login button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Create account
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.blueGrey,
                      ),
                      children: [
                        const TextSpan(
                          text: 'New to PennyPal? ',
                        ),

                        TextSpan(
                          text: 'Create account',
                          style: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/register');
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}