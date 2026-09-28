import 'package:flutter/material.dart';
import '../../theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _mobile = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();
  bool agreed = true;

  InputDecoration _dec(String label, String hint, IconData icon) {
    return InputDecoration(
      labelText: label, hintText: hint,
      prefixIcon: Icon(icon, size: 18),
      filled: true, fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: ()=>Navigator.pop(context)), title: Row(children: [Container(width: 32, height: 32, decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.circular(8)), child: const Center(child: Text('P', style: TextStyle(fontWeight: FontWeight.bold)))), const SizedBox(width: 6), const Text('PennyPal', style: TextStyle(fontWeight: FontWeight.w700))]), backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Create Account', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('Start your journey to better\nmoney management.', style: TextStyle(color: AppColors.greyText)),
          const SizedBox(height: 24),
          TextField(controller: _fullName, decoration: _dec('Full Name', 'Enter your full name', Icons.person_outline)),
          const SizedBox(height: 14),
          TextField(controller: _email, decoration: _dec('Email Address', 'Enter your email address', Icons.email_outlined)),
          const SizedBox(height: 14),
          TextField(controller: _mobile, decoration: _dec('Mobile Number', 'Enter your mobile number', Icons.phone_android_outlined)),
          const SizedBox(height: 14),
          TextField(controller: _pass, obscureText: true, decoration: _dec('Password', 'Create a password', Icons.lock_outline).copyWith(suffixIcon: const Icon(Icons.visibility_outlined))),
          const SizedBox(height: 14),
          TextField(controller: _confirm, obscureText: true, decoration: _dec('Confirm Password', 'Confirm your password', Icons.lock_outline).copyWith(suffixIcon: const Icon(Icons.visibility_outlined))),
          const SizedBox(height: 16),
          Row(children: [Checkbox(value: agreed, onChanged: (v)=>setState(()=>agreed=v!), activeColor: AppColors.primary), const Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: 'I agree to the '), TextSpan(text: 'Terms & Privacy Policy', style: TextStyle(color: AppColors.primary, decoration: TextDecoration.underline))])))]),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () async {
            // CALL YOUR API HERE - matches backend we fixed
            final body = {'fullName': _fullName.text, 'email': _email.text, 'mobileNumber': _mobile.text, 'password': _pass.text};
            // await AuthService.register(body);
            Navigator.pushNamed(context, '/login');
          }, child: const Text('Create Account')),
          const SizedBox(height: 16),
          Center(child: TextButton(onPressed: ()=>Navigator.pushNamed(context, '/login'), child: const Text.rich(TextSpan(text: 'Already have an account?  ', style: TextStyle(color: Colors.black54), children: [TextSpan(text: 'Log in', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold))])))),
        ]),
      ),
    );
  }
}