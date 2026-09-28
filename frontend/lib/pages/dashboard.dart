import 'package:flutter/material.dart';
import '../components/navbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  color: Colors.teal.shade900,
                  child: Row(
                    children: [
                      const Text(
                        'PennyPal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Sarah J.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade800,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Text(
                                  '\$2,450.75',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Icon(
                                  Icons.arrow_upward,
                                  size: 28,
                                  color: Colors.yellow.shade400,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Updated: Oct 26',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Monthly Budget Progress',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Budget Status: 68% Spent (\$1,020 / \$1,500)',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 7),

                      LinearProgressIndicator(
                        value: 0.68,
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.teal,
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Groceries',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 5),
                                LinearProgressIndicator(
                                  value: 0.52,
                                  minHeight: 6,
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Colors.grey.shade300,
                                  color: Colors.teal,
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  '\$320 / \$450',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Dining',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 5),
                                LinearProgressIndicator(
                                  value: 0.75,
                                  minHeight: 6,
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Colors.grey.shade300,
                                  color: Colors.amber,
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  '\$240 / \$300',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Transport',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 5),
                                LinearProgressIndicator(
                                  value: 0.72,
                                  minHeight: 6,
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Colors.grey.shade300,
                                  color: Colors.teal,
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  '\$180 / \$250',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Books',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 5),
                                LinearProgressIndicator(
                                  value: 0.75,
                                  minHeight: 6,
                                  borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Colors.grey.shade300,
                                  color: Colors.amber,
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  '\$150 / \$200',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.teal,
                              ),
                              label: const Text(
                                'Add Expense',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.teal,
                              ),
                              label: const Text(
                                'Add Income',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          const Text(
                            'Recent Transactions',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'View all',
                            style: TextStyle(
                              color: Colors.teal.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal.shade100,
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.teal,
                          ),
                        ),
                        title: const Text(
                          'Groceries',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text("Trader Joe's\nOct 26"),
                        trailing: const Text(
                          '\$58.20',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber.shade100,
                          child: const Icon(
                            Icons.school,
                            color: Colors.amber,
                          ),
                        ),
                        title: const Text(
                          'Tuition Fee',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('Oct 25'),
                        trailing: const Text(
                          '\$1,200',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal.shade100,
                          child: const Icon(
                            Icons.home,
                            color: Colors.teal,
                          ),
                        ),
                        title: const Text(
                          'Rent',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('Oct 24'),
                        trailing: const Text(
                          '\$750',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber.shade100,
                          child: const Icon(
                            Icons.restaurant,
                            color: Colors.amber,
                          ),
                        ),
                        title: const Text(
                          'Dining',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('Cafe\nOct 23'),
                        trailing: const Text(
                          '\$24.50',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            if (index == 1) {
              Navigator.pushNamed(context, '/transactions');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/insights');
            } else if (index == 3) {
              Navigator.pushNamed(context, '/account');
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows_rounded),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Insights',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

