import 'package:flutter/material.dart';

class MyBudgets extends StatefulWidget {
  const MyBudgets({super.key});

  @override
  State<MyBudgets> createState() => _MyBudgetsState();
}

class _MyBudgetsState extends State<MyBudgets> {
  final List<Map<String, dynamic>> budgets = [
    {
      'name': 'September Student Budget',
      'month': 'September 2026',
      'budget': 120000.0,
      'spent': 85000.0,
    },
    {
      'name': 'August Personal Budget',
      'month': 'August 2026',
      'budget': 100000.0,
      'spent': 108000.0,
    },
  ];

  void showBudgetForm({int? index}) {
    final budget = index == null ? null : budgets[index];

    final nameController = TextEditingController(
      text: budget == null ? '' : budget['name'],
    );

    final amountController = TextEditingController(
      text: budget == null
          ? ''
          : budget['budget'].toStringAsFixed(0),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: Text(
            index == null ? 'Create Budget' : 'Edit Budget',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Set up your monthly spending limit.',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Budget name',
                  hintText: 'e.g. September Student Budget',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.teal,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Monthly budget',
                  hintText: 'Enter amount',
                  prefixText: '₦ ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.teal,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actionsPadding: const EdgeInsets.fromLTRB(
            20,
            0,
            20,
            15,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final amount =
                    double.tryParse(amountController.text.trim());

                if (name.isEmpty || amount == null || amount <= 0) {
                  return;
                }

                setState(() {
                  if (index == null) {
                    budgets.insert(
                      0,
                      {
                        'name': name,
                        'month': 'September 2026',
                        'budget': amount,
                        'spent': 0.0,
                      },
                    );
                  } else {
                    budgets[index]['name'] = name;
                    budgets[index]['budget'] = amount;
                  }
                });

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                index == null ? 'Create Budget' : 'Save Changes',
              ),
            ),
          ],
        );
      },
    );
  }

  void deleteBudget(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Delete Budget',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Are you sure you want to delete this budget?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  budgets.removeAt(index);
                });

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F8),
      body: SafeArea(
        child: budgets.isEmpty
            ? SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Budgets',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF172033),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Track your monthly spending and stay within your limits.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 55,
                            color: Colors.teal,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'No budgets yet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Create a budget to start tracking your spending.',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 18),
                          ElevatedButton(
                            onPressed: showBudgetForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 13,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Create Budget',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My Budgets',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF172033),
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Track your monthly spending and stay within your limits.',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton.icon(
                        onPressed: showBudgetForm,
                        icon: const Icon(Icons.add),
                        label: const Text('Create Budget'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 13,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  ...budgets.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;

                    final budget = item['budget'] as double;
                    final spent = item['spent'] as double;

                    final remaining = budget - spent;
                    final isOverBudget = remaining < 0;

                    final progress = budget == 0
                        ? 0.0
                        : (spent / budget).clamp(0.0, 1.0);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['month'],
                                      style: const TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == 'edit') {
                                    showBudgetForm(
                                      index: index,
                                    );
                                  } else {
                                    deleteBudget(index);
                                  }
                                },
                                itemBuilder: (context) => const [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: Text('Edit'),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Budget',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '₦${budget.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Spent',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '₦${spent.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: progress,
                              minHeight: 9,
                              backgroundColor:
                                  Colors.teal.shade50,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                isOverBudget
                                    ? Colors.red
                                    : Colors.teal,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isOverBudget
                                  ? Colors.red.shade50
                                  : Colors.teal.shade50,
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                            child: Text(
                              isOverBudget
                                  ? 'Overspent by ₦${remaining.abs().toStringAsFixed(0)}'
                                  : 'Remaining: ₦${remaining.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: isOverBudget
                                    ? Colors.red.shade700
                                    : Colors.teal.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/transactions');
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
    );
  }
}