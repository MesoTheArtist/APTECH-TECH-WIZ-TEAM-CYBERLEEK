import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                const Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 3),

                const Text(
                  'Track your spending and stay in control.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Total Spent',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              '\$580.25',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              '12% less than last month',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.white30,
                      ),

                      const SizedBox(width: 15),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Total Transactions',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '23',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black87,
                    labelStyle: const TextStyle(
                      fontSize: 11,
                    ),
                    tabs: const [
                      Tab(text: 'All'),
                      Tab(text: '🟢 Income'),
                      Tab(text: '🔴 Expenses'),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  height: 35,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 15,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'This Month (Oct 1 - Oct 31)',
                        style: TextStyle(fontSize: 10),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 18,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Expanded(
                  child: TabBarView(
                    children: [
                      AllTransactions(),
                      IncomeTransactions(),
                      ExpenseTransactions(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/mybudget');
            } else if (index == 3) {
              Navigator.pushNamed(context, '/contact_feedback');
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
              icon: Icon(Icons.account_balance_wallet),
              label: 'Budgets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: 'contact_feedback',
            ),
          ],
        ),
      ),
    );
  }
}


// All transactions
class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TransactionItem(
          icon: Icons.restaurant,
          title: 'Food & Beverages',
          description: 'Lunch at Campus Cafe',
          date: '10:24 AM',
          amount: '-\$8.50',
        ),
        TransactionItem(
          icon: Icons.directions_bus,
          title: 'Transport',
          description: 'Bus Fare',
          date: '8:12 AM',
          amount: '-\$2.00',
        ),
        TransactionItem(
          icon: Icons.menu_book,
          title: 'Education',
          description: 'Textbook (Maths)',
          date: 'Yesterday',
          amount: '-\$25.00',
        ),
        TransactionItem(
          icon: Icons.account_balance_wallet,
          title: 'Income',
          description: 'Allowance',
          date: 'Oct 25, 2025',
          amount: '+\$150.00',
          income: true,
        ),
        TransactionItem(
          icon: Icons.shopping_bag,
          title: 'Shopping',
          description: 'Stationery',
          date: 'Oct 24, 2025',
          amount: '-\$12.75',
        ),
        TransactionItem(
          icon: Icons.sports_esports,
          title: 'Entertainment',
          description: 'Movie Ticket',
          date: 'Oct 23, 2025',
          amount: '-\$10.00',
        ),
      ],
    );
  }
}


// Income transactions
class IncomeTransactions extends StatelessWidget {
  const IncomeTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              TransactionItem(
                icon: Icons.account_balance_wallet,
                title: 'Income',
                description: 'Allowance',
                date: 'Oct 25, 2025',
                amount: '+\$150.00',
                income: true,
              ),
              TransactionItem(
                icon: Icons.work,
                title: 'Part-time Job',
                description: 'Monthly payment',
                date: 'Oct 20, 2025',
                amount: '+\$300.00',
                income: true,
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () {
              showAddIncomeDialog(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: const Text(
              'Add Income',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
          ),
        ),

        const SizedBox(height: 5),
      ],
    );
  }
}


// Expense transactions
class ExpenseTransactions extends StatelessWidget {
  const ExpenseTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              TransactionItem(
                icon: Icons.restaurant,
                title: 'Food & Beverages',
                description: 'Lunch at Campus Cafe',
                date: '10:24 AM',
                amount: '-\$8.50',
              ),
              TransactionItem(
                icon: Icons.directions_bus,
                title: 'Transport',
                description: 'Bus Fare',
                date: '8:12 AM',
                amount: '-\$2.00',
              ),
              TransactionItem(
                icon: Icons.menu_book,
                title: 'Education',
                description: 'Textbook (Maths)',
                date: 'Yesterday',
                amount: '-\$25.00',
              ),
              TransactionItem(
                icon: Icons.shopping_bag,
                title: 'Shopping',
                description: 'Stationery',
                date: 'Oct 24, 2025',
                amount: '-\$12.75',
              ),
              TransactionItem(
                icon: Icons.sports_esports,
                title: 'Entertainment',
                description: 'Movie Ticket',
                date: 'Oct 23, 2025',
                amount: '-\$10.00',
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () {
              showAddExpenseDialog(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: const Text(
              'Add Expense',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
          ),
        ),

        const SizedBox(height: 5),
      ],
    );
  }
}


// Add income alert
void showAddIncomeDialog(BuildContext context) {
  final sourceController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();

  String category = 'Salary';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add Income'),

        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: sourceController,
                decoration: const InputDecoration(
                  labelText: 'Source',
                  hintText: 'e.g. Salary',
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  hintText: 'e.g. 50000',
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  hintText: 'e.g. Oct 25, 2026',
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: descriptionController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'e.g. Monthly salary',
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                value: category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Salary',
                    child: Text('Salary'),
                  ),
                  DropdownMenuItem(
                    value: 'Business',
                    child: Text('Business'),
                  ),
                  DropdownMenuItem(
                    value: 'Allowance',
                    child: Text('Allowance'),
                  ),
                  DropdownMenuItem(
                    value: 'Gift',
                    child: Text('Gift'),
                  ),
                  DropdownMenuItem(
                    value: 'Other',
                    child: Text('Other'),
                  ),
                ],
                onChanged: (value) {
                  category = value!;
                },
              ),
            ],
          ),
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Add Income'),
          ),
        ],
      );
    },
  );
}

// Add expense alert
void showAddExpenseDialog(BuildContext context) {
  final expenseController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final notesController = TextEditingController();

  String category = 'Food';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add Expense'),

        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: expenseController,
                decoration: const InputDecoration(
                  labelText: 'Expense Name',
                  hintText: 'e.g. Lunch',
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  hintText: 'e.g. 5000',
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                value: category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Food',
                    child: Text('Food'),
                  ),
                  DropdownMenuItem(
                    value: 'Transport',
                    child: Text('Transport'),
                  ),
                  DropdownMenuItem(
                    value: 'Education',
                    child: Text('Education'),
                  ),
                  DropdownMenuItem(
                    value: 'Shopping',
                    child: Text('Shopping'),
                  ),
                  DropdownMenuItem(
                    value: 'Entertainment',
                    child: Text('Entertainment'),
                  ),
                  DropdownMenuItem(
                    value: 'Bills',
                    child: Text('Bills'),
                  ),
                  DropdownMenuItem(
                    value: 'Other',
                    child: Text('Other'),
                  ),
                ],
                onChanged: (value) {
                  category = value!;
                },
              ),

              const SizedBox(height: 10),

              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  hintText: 'e.g. Oct 25, 2026',
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: notesController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Notes',
                  hintText: 'e.g. Lunch at Campus Cafe',
                ),
              ),
            ],
          ),
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Add Expense'),
          ),
        ],
      );
    },
  );
}


// Transaction item
class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String date;
  final String amount;
  final bool income;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.date,
    required this.amount,
    this.income = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor:
                income ? Colors.teal.shade100 : Colors.teal.shade50,
            child: Icon(
              icon,
              size: 18,
              color: Colors.teal,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.blueGrey,
                  ),
                ),

                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 8,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),

          Text(
            amount,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: income ? Colors.teal : Colors.blueGrey.shade900,
            ),
          ),

          const SizedBox(width: 8),

          const Icon(
            Icons.chevron_right,
            size: 18,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}