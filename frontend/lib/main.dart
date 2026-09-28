import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:frontend/pages/dashboard.dart';
import './pages/about.dart';

// dasboard
import 'pages/dashboard.dart';
import './pages/transaction.dart';
import './pages/contact_feedback.dart';
import './pages/mybudget.dart';
import './pages/savinggoals.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

void main() => runApp(const PennyPalApp());

// ========== CONFIG & COLORS ==========
class AppColors {
  static const primary = Color(0xFF0E6D68);
  static const darkTeal = Color(0xFF0A4440);
  static const yellow = Color(0xFFFFC93D);
  static const bg = Color(0xFFF8FBF9);
  static const greyText = Color(0xFF8A9A9A);
}

// Global token - simple for competition demo
String? authToken;

// ========== API SERVICE - REAL DATABASE ==========
class ApiService {
  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:5000/api';
    return 'http://10.0.2.2:5000/api'; // Android emulator
  }

  static Future<Map<String, dynamic>> register({
    required String fullName,
    required String email,
    required String mobileNumber,
    required String password,
  }) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fullName': fullName,
        'email': email,
        'mobileNumber': mobileNumber,
        'password': password,
      }),
    );
    return jsonDecode(res.body);
  }

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return jsonDecode(res.body);
  }
}

// ========== APP ==========
class PennyPalApp extends StatelessWidget {
  const PennyPalApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PennyPal',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
      ),
      initialRoute: '/',
      routes: {
        '/about' : (context) => About(),

        // dasboard
        '/dashboard_home' : (context) => Dashboard(),
        '/transactions' : (context) => Transactions(),
        '/contact_feedback' : (context) => ContactFeedback(),
        '/mybudget' : (context) => MyBudgets(),
        '/savings_goals' : (context) => SavingsGoals(),
        '/': (_) => const OnboardingScreen(),
        '/register': (_) => const RegisterScreen(),
        '/login': (_) => const LoginScreen(),
        '/reset': (_) => const ResetScreen(),
        '/dashboard': (_) => const DashboardScreen(),
      },
    );
  }
}

// ========== REUSABLE WIDGETS ==========
InputDecoration appInput(String label, String hint, IconData icon,
    {Widget? suffix}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    prefixIcon: Icon(icon, size: 18, color: Colors.grey.shade600),
    suffixIcon: suffix,
    filled: true,
    fillColor: Colors.white,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            const BorderSide(color: AppColors.primary, width: 1.5)),
  );
}

Widget primaryButton(String text, VoidCallback? onTap, {IconData? icon, bool loading = false}) {
  return SizedBox(
    width: double.infinity,
    height: 56,
    child: ElevatedButton(
      onPressed: loading ? null : onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28))),
      child: loading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                  strokeWidth: 2, color: Colors.white))
          : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(icon, size: 18)
              ]
            ]),
    ),
  );
}

Widget secondaryButton(String text, VoidCallback onTap) {
  return SizedBox(
    width: double.infinity,
    height: 56,
    child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primary),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28))),
        child: Text(text,
            style: const TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.w600))),
  );
}

// ========== 1. ONBOARDING ==========
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(children: [
            const SizedBox(height: 20),
            Row(children: [
              Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text('P',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)))),
              const SizedBox(width: 8),
              const Text('PennyPal',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkTeal))
            ]),
            const SizedBox(height: 12),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text('Your money, your way.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkTeal))),
            const Spacer(),
            Container(
                height: 220,
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.account_balance_wallet,
                    size: 110, color: AppColors.primary)),
            const SizedBox(height: 24),
            const Text(
                'Track your expenses, set budgets,\nsave for your goals and build a\nbrighter financial future.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.greyText, height: 1.4)),
            const Spacer(),
            primaryButton('Get Started',
                () => Navigator.pushNamed(context, '/register'),
                icon: Icons.arrow_forward),
            const SizedBox(height: 12),
            secondaryButton('I already have an account',
                () => Navigator.pushNamed(context, '/login')),

                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text(
                    'About PennyPal',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.teal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
          ]),
        ),
      ),
    );
  }
}

// ========== 2. REGISTER - NOW HITS REAL DB ==========
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _mobile = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();
  bool agreed = true;
  bool o1 = true, o2 = true;
  bool loading = false;

  Future<void> _register() async {
    if (_fullName.text.isEmpty ||
        _email.text.isEmpty ||
        _mobile.text.isEmpty ||
        _pass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields')));
      return;
    }
    if (_pass.text != _confirm.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')));
      return;
    }
    setState(() => loading = true);
    try {
      final data = await ApiService.register(
        fullName: _fullName.text,
        email: _email.text,
        mobileNumber: _mobile.text,
        password: _pass.text,
      );
      if (data['status'] == 'success') {
        authToken = data['data']['token'];
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Account created! Welcome ${data['data']['user']['fullName']}')));
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Registration failed')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e\nIs backend running on 5000?')));
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Row(children: [
          Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(8)),
              child: const Center(
                  child:
                      Text('P', style: TextStyle(fontWeight: FontWeight.bold)))),
          const SizedBox(width: 6),
          const Text('PennyPal',
              style: TextStyle(fontWeight: FontWeight.w800))
        ]),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Create Account',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const Text('Start your journey to better money management.',
              style: TextStyle(color: AppColors.greyText)),
          const SizedBox(height: 24),
          TextField(
              controller: _fullName,
              decoration: appInput('Full Name', 'Enter your full name',
                  Icons.person_outline)),
          const SizedBox(height: 14),
          TextField(
              controller: _email,
              decoration: appInput('Email Address', 'Enter your email address',
                  Icons.email_outlined)),
          const SizedBox(height: 14),
          TextField(
              controller: _mobile,
              decoration: appInput('Mobile Number', 'Enter your mobile number',
                  Icons.phone_android_outlined)),
          const SizedBox(height: 14),
          TextField(
              controller: _pass,
              obscureText: o1,
              decoration: appInput('Password', 'Create a password',
                  Icons.lock_outline,
                  suffix: IconButton(
                      icon: Icon(o1
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () => setState(() => o1 = !o1)))),
          const SizedBox(height: 14),
          TextField(
              controller: _confirm,
              obscureText: o2,
              decoration: appInput('Confirm Password', 'Confirm your password',
                  Icons.lock_outline,
                  suffix: IconButton(
                      icon: Icon(o2
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () => setState(() => o2 = !o2)))),
          const SizedBox(height: 16),
          Row(children: [
            Checkbox(
                value: agreed,
                onChanged: (v) => setState(() => agreed = v!),
                activeColor: AppColors.primary),
            const Expanded(
                child: Text('I agree to the Terms & Privacy Policy',
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600)))
          ]),
          const SizedBox(height: 16),
          primaryButton('Create Account', _register, loading: loading),
          const SizedBox(height: 16),
          Center(
              child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: const Text('Already have an account? Log in',
                      style: TextStyle(color: AppColors.primary)))),
        ]),
      ),
    );
  }
}

// ========== 3. LOGIN - NOW HITS REAL DB ==========
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController(text: 'martin@test.com');
  final _pass = TextEditingController(text: '123456');
  bool o = true;
  bool loading = false;

  Future<void> _login() async {
    setState(() => loading = true);
    try {
      final data = await ApiService.login(_email.text, _pass.text);
      if (data['status'] == 'success') {
        authToken = data['data']['token'];
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Login failed')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(children: [
          Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(8)),
              child: const Center(
                  child:
                      Text('P', style: TextStyle(fontWeight: FontWeight.bold)))),
          const SizedBox(width: 6),
          const Text('PennyPal', style: TextStyle(fontWeight: FontWeight.w800))
        ]),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Welcome back!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const Text(
              'Log in to your account and continue your financial journey.',
              style: TextStyle(color: AppColors.greyText)),
          const SizedBox(height: 24),
          TextField(
              controller: _email,
              decoration: appInput('Email Address', 'Enter your email address',
                  Icons.email_outlined)),
          const SizedBox(height: 14),
          TextField(
              controller: _pass,
              obscureText: o,
              decoration: appInput('Password', 'Enter your password',
                  Icons.lock_outline,
                  suffix: IconButton(
                      icon: Icon(o
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () => setState(() => o = !o)))),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/reset'),
                  child: const Text('Forget Password?',
                      style: TextStyle(color: AppColors.primary)))),
          const SizedBox(height: 10),
          primaryButton('Log In', _login, loading: loading),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(child: Divider(color: Colors.grey.shade300)),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text('or continue with',
                    style: TextStyle(color: Colors.grey, fontSize: 12))),
            Expanded(child: Divider(color: Colors.grey.shade300))
          ]),
          const SizedBox(height: 20),
          SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata, size: 30),
                  label: const Text('Continue with Google'),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28))))),
          const SizedBox(height: 20),
          Center(
              child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: const Text('New to PennyPal? Create account',
                      style: TextStyle(color: AppColors.primary)))),
        ]),
      ),
    );
  }
}

// ========== 4. RESET ==========
class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
              child: Container(
                  width: 160,
                  height: 140,
                  decoration: BoxDecoration(
                      color: const Color(0xFFEAF6F5),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.mail_rounded,
                      size: 80, color: AppColors.yellow))),
          const SizedBox(height: 30),
          const Text('Reset your password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text(
              'Enter your email address and we\'ll send you a link to reset your password.',
              style: TextStyle(color: AppColors.greyText)),
          const SizedBox(height: 24),
          TextField(
              decoration: appInput('Email Address', 'Enter your email address',
                  Icons.email_outlined)),
          const SizedBox(height: 24),
          primaryButton('Send Reset Link', () => Navigator.pop(context)),
          const SizedBox(height: 20),
          Center(
              child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back to Login',
                      style: TextStyle(color: AppColors.primary)))),
        ]),
      ),
    );
  }
}

// ========== 5. DASHBOARD ==========
// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

  // Widget chip(String text) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  //     decoration: BoxDecoration(
  //         color: const Color(0xFFF5F7F7),
  //         borderRadius: BorderRadius.circular(20),
  //         border: Border.all(color: Colors.grey.shade200)),
  //     child: Text(text,
  //         style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
  //   );
  // }

  // Widget tx(String title, String sub, String amt, IconData icon, Color c) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 10),
  //     padding: const EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //         color: Colors.white, borderRadius: BorderRadius.circular(14)),
  //     child: Row(children: [
  //       Container(
  //           width: 40,
  //           height: 40,
  //           decoration: BoxDecoration(
  //               color: c.withOpacity(0.15),
  //               borderRadius: BorderRadius.circular(10)),
  //           child: Icon(icon, size: 20, color: c)),
  //       const SizedBox(width: 12),
  //       Expanded(
  //           child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //             Text(title,
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.w600, fontSize: 13)),
  //             Text(sub,
  //                 style: const TextStyle(
  //                     fontSize: 11, color: AppColors.greyText))
  //           ])),
  //       Text(amt,
  //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
  //     ]),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //         backgroundColor: Colors.white,
  //         elevation: 0,
  //         title: Row(children: [
  //           Container(
  //               width: 28,
  //               height: 28,
  //               decoration: BoxDecoration(
  //                   color: AppColors.yellow,
  //                   borderRadius: BorderRadius.circular(6)),
  //               child: const Center(
  //                   child: Text('P',
  //                       style: TextStyle(fontWeight: FontWeight.bold)))),
  //           const SizedBox(width: 6),
  //           const Text('PennyPal',
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
  //         ]),
  //         actions: [
  //           Padding(
  //               padding: const EdgeInsets.only(right: 16),
  //               child: CircleAvatar(
  //                   radius: 18,
  //                   backgroundColor: Colors.grey.shade200,
  //                   child: Text(authToken != null ? '✓' : 'SJ')))
  //         ]),
  //     body: SingleChildScrollView(
  //       padding: const EdgeInsets.all(16),
  //       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Container(
  //             width: double.infinity,
  //             padding: const EdgeInsets.all(20),
  //             decoration: BoxDecoration(
  //                 color: AppColors.darkTeal,
  //                 borderRadius: BorderRadius.circular(20)),
  //             child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   const Text('Total Balance',
  //                       style: TextStyle(color: Colors.white70, fontSize: 13)),
  //                   const SizedBox(height: 4),
  //                   const Text('\$2,450.75 ↑',
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 26,
  //                           fontWeight: FontWeight.bold)),
  //                   Text(
  //                       authToken != null
  //                           ? 'Connected to Atlas • ${authToken!.substring(0, 20)}...'
  //                           : 'Updated: Oct 26',
  //                       style: const TextStyle(
  //                           color: Colors.white54, fontSize: 11))
  //                 ])),
  //         const SizedBox(height: 20),
  //         const Text('Monthly Budget Progress',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
  //         const SizedBox(height: 8),
  //         Container(
  //           padding: const EdgeInsets.all(12),
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(12)),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const Text('Budget Status: 68% Spent (\$1,020 / \$1,500)',
  //                   style: TextStyle(fontSize: 12, color: Colors.black54)),
  //               const SizedBox(height: 10),
  //               LinearProgressIndicator(
  //                   value: 0.68,
  //                   backgroundColor: Colors.grey.shade200,
  //                   color: AppColors.primary,
  //                   minHeight: 6),
  //               const SizedBox(height: 12),
  //               Wrap(spacing: 8, runSpacing: 8, children: [
  //                 chip('Groceries \$320 / \$450'),
  //                 chip('Dining \$240 / \$300'),
  //                 chip('Transport \$180 / \$250'),
  //                 chip('Books \$150 / \$200'),
  //               ]),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //         const Text('Quick Actions',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
  //         const SizedBox(height: 10),
  //         Row(children: [
  //           Expanded(
  //               child: SizedBox(
  //                   height: 44,
  //                   child: ElevatedButton.icon(
  //                       onPressed: () {},
  //                       icon: const Icon(Icons.add, size: 18),
  //                       label: const Text('Add Expense',
  //                           style: TextStyle(fontSize: 13)),
  //                       style: ElevatedButton.styleFrom(
  //                           backgroundColor: AppColors.yellow,
  //                           foregroundColor: Colors.black)))),
  //           const SizedBox(width: 12),
  //           Expanded(
  //               child: SizedBox(
  //                   height: 44,
  //                   child: ElevatedButton.icon(
  //                       onPressed: () {},
  //                       icon: const Icon(Icons.add, size: 18),
  //                       label: const Text('Add Income',
  //                           style: TextStyle(fontSize: 13)),
  //                       style: ElevatedButton.styleFrom(
  //                           backgroundColor: AppColors.primary,
  //                           foregroundColor: Colors.white)))),
  //         ]),
  //         const SizedBox(height: 20),
  //         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           const Text('Recent Transactions',
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
  //           TextButton(
  //               onPressed: () {},
  //               child: const Text('View all', style: TextStyle(fontSize: 12)))
  //         ]),
  //         tx('Groceries', "Trader Joe's • Oct 26", '\$58.20',
  //             Icons.shopping_bag, Colors.blue),
  //         tx('Tuition Fee', 'Oct 25', '\$1200', Icons.school, Colors.orange),
  //         tx('Rent', 'Oct 24', '\$750', Icons.home, Colors.green),
  //         tx('Dining', 'Cafe • Oct 23', '\$24.50', Icons.restaurant, Colors.red),
  //       ]),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //         type: BottomNavigationBarType.fixed,
  //         selectedItemColor: AppColors.primary,
  //         items: const [
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.home_filled), label: 'Home'),
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.account_balance_wallet_outlined),
  //               label: 'Budget'),
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.bar_chart), label: 'Insights'),
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.person_outline), label: 'Account')
  //         ]),
  //   );
  // }
// }


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
    Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Dashboard(),
      ),
    );
  }
}