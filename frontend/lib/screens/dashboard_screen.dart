import 'package:flutter/material.dart';
import '../theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, title: Row(children: [Container(width: 28, height: 28, decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.circular(6)), child: const Center(child: Text('P', style: TextStyle(fontWeight: FontWeight.bold)))), const SizedBox(width: 6), const Text('PennyPal', style: TextStyle(color: AppColors.darkTeal, fontWeight: FontWeight.bold))]), actions: [Padding(padding: const EdgeInsets.only(right: 12), child: CircleAvatar(backgroundColor: Colors.grey.shade300, child: const Text('SJ')))]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppColors.darkTeal, borderRadius: BorderRadius.circular(20)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Total Balance', style: TextStyle(color: Colors.white70)), const SizedBox(height: 4), Row(children: const [Text('\$2,450.75', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)), SizedBox(width: 6), Icon(Icons.arrow_upward, color: AppColors.yellow, size: 18)]), const Text('Updated: Oct 26', style: TextStyle(color: Colors.white54, fontSize: 12))])),
          const SizedBox(height: 20),
          const Text('Monthly Budget Progress', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Budget Status: 68% Spent (\$1,020 / \$1,500)', style: TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 12),
          Wrap(spacing: 12, runSpacing: 12, children: [
            _budgetChip('Groceries', '\$320 / \$450'), _budgetChip('Dining', '\$240 / \$300'),
            _budgetChip('Transport', '\$180 / \$250'), _budgetChip('Books', '\$150 / \$200'),
          ]),
          const SizedBox(height: 20),
          const Text('Quick Actions', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(children: [Expanded(child: ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.add), label: const Text('Add Expense'), style: ElevatedButton.styleFrom(backgroundColor: AppColors.yellow, foregroundColor: Colors.black))), const SizedBox(width: 12), Expanded(child: ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.add), label: const Text('Add Income')))]),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Recent Transactions', style: TextStyle(fontWeight: FontWeight.bold)), TextButton(onPressed: (){}, child: const Text('View all'))]),
          _tx('Groceries', 'Trader Joe\'s', '\$58.20', 'Oct 26', Icons.shopping_cart),
          _tx('Tuition Fee', 'Oct 25', '\$1200', 'Oct 25', Icons.school),
          _tx('Rent', 'Oct 24', '\$750', 'Oct 24', Icons.home),
          _tx('Dining', 'Cafe', '\$24.50', 'Oct 23', Icons.restaurant),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed, selectedItemColor: AppColors.primary, items: const [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Budget'), BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Insights'), BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')]),
    );
  }

  static Widget _budgetChip(String label, String value) => Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade200)), child: Text('$label  $value', style: const TextStyle(fontSize: 12)));
  static Widget _tx(String title, String sub, String amt, String date, IconData icon) => ListTile(leading: CircleAvatar(backgroundColor: Colors.white, child: Icon(icon, color: AppColors.primary, size: 18)), title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), subtitle: Text(sub, style: const TextStyle(fontSize: 12)), trailing: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [Text(amt, style: const TextStyle(fontWeight: FontWeight.bold)), Text(date, style: const TextStyle(fontSize: 11, color: Colors.grey))]), contentPadding: EdgeInsets.zero);
}