import 'package:flutter/material.dart';
import '../theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(children: [Container(width: 38, height: 38, decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.circular(10)), child: const Center(child: Text('P', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))),), const SizedBox(width: 8), const Text('PennyPal', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.darkTeal))]),
              const SizedBox(height: 12),
              const Text('Your money, your way.', style: TextStyle(fontSize: 16, color: AppColors.darkTeal)),
              const Spacer(),
              // Replace with your wallet image asset
              Image.asset('assets/wallet.png', height: 220),
              const SizedBox(height: 24),
              const Text('Track your expenses, set budgets,\nsave for your goals and build a\nbrighter financial future.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.greyText)),
              const Spacer(),
              ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Get Started'), SizedBox(width: 8), Icon(Icons.arrow_forward, size: 18)])),
              const SizedBox(height: 12),
              OutlinedButton(onPressed: () => Navigator.pushNamed(context, '/login'), style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 56), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)), side: const BorderSide(color: AppColors.primary)), child: const Text('I already have an account')),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}