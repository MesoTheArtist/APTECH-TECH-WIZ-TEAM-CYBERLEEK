import 'package:flutter/material.dart';

class SavingsGoals extends StatefulWidget {
  const SavingsGoals({super.key});

  @override
  State<SavingsGoals> createState() => _SavingsGoalsState();
}

class _SavingsGoalsState extends State<SavingsGoals> {
  final List<Map<String, dynamic>> goals = [
    {
      'name': 'New Laptop',
      'target': 500000.0,
      'saved': 210000.0,
      'date': '30 June 2027',
      'contribution': 50000.0,
      'milestone': 250000.0,
      'completed': false,
    },
    {
      'name': 'Travel Fund',
      'target': 300000.0,
      'saved': 75000.0,
      'date': '15 December 2026',
      'contribution': 30000.0,
      'milestone': 150000.0,
      'completed': false,
    },
  ];

  final List<Map<String, dynamic>> history = [
    {
      'name': 'Emergency Fund',
      'target': 200000.0,
      'saved': 200000.0,
      'date': '12 April 2026',
      'contribution': 25000.0,
      'milestone': 200000.0,
      'completed': true,
    },
  ];

  void showGoalForm({int? index}) {
    final goal = index == null ? null : goals[index];

    final nameController = TextEditingController(
      text: goal == null ? '' : goal['name'],
    );

    final targetController = TextEditingController(
      text: goal == null ? '' : goal['target'].toStringAsFixed(0),
    );

    final savedController = TextEditingController(
      text: goal == null ? '' : goal['saved'].toStringAsFixed(0),
    );

    final dateController = TextEditingController(
      text: goal == null ? '' : goal['date'],
    );

    final contributionController = TextEditingController(
      text: goal == null
          ? ''
          : goal['contribution'].toStringAsFixed(0),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: Text(
            index == null ? 'Create Savings Goal' : 'Edit Savings Goal',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Goal name',
                    hintText: 'e.g. New Laptop',
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
                  controller: targetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Target amount',
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
                const SizedBox(height: 12),
                TextField(
                  controller: savedController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Current savings',
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
                const SizedBox(height: 12),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Target date',
                    hintText: 'e.g. 30 June 2027',
                    prefixIcon: const Icon(
                      Icons.calendar_today_outlined,
                    ),
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
                  controller: contributionController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Monthly contribution',
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
          ),
          actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
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
                final target =
                    double.tryParse(targetController.text.trim());
                final saved =
                    double.tryParse(savedController.text.trim());
                final contribution =
                    double.tryParse(
                  contributionController.text.trim(),
                );
                final date = dateController.text.trim();

                if (name.isEmpty ||
                    target == null ||
                    target <= 0 ||
                    saved == null ||
                    saved < 0 ||
                    contribution == null ||
                    contribution <= 0 ||
                    date.isEmpty) {
                  return;
                }

                setState(() {
                  if (index == null) {
                    goals.insert(
                      0,
                      {
                        'name': name,
                        'target': target,
                        'saved': saved,
                        'date': date,
                        'contribution': contribution,
                        'milestone': target * 0.5,
                        'completed': false,
                      },
                    );
                  } else {
                    goals[index]['name'] = name;
                    goals[index]['target'] = target;
                    goals[index]['saved'] = saved;
                    goals[index]['date'] = date;
                    goals[index]['contribution'] = contribution;
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
                index == null ? 'Create Goal' : 'Save Changes',
              ),
            ),
          ],
        );
      },
    );
  }

  void updateContribution(int index) {
    final controller = TextEditingController(
      text: goals[index]['contribution'].toStringAsFixed(0),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Update Contribution',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Monthly contribution',
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
                final amount =
                    double.tryParse(controller.text.trim());

                if (amount == null || amount <= 0) {
                  return;
                }

                setState(() {
                  goals[index]['contribution'] = amount;
                });

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void addSavings(int index) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Add Savings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Amount saved',
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
                final amount =
                    double.tryParse(controller.text.trim());

                if (amount == null || amount <= 0) {
                  return;
                }

                setState(() {
                  goals[index]['saved'] += amount;

                  if (goals[index]['saved'] >= goals[index]['target']) {
                    goals[index]['saved'] = goals[index]['target'];
                  }
                });

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void markMilestone(int index) {
    final goal = goals[index];
    final target = goal['target'] as double;
    final saved = goal['saved'] as double;
    final milestone = target * 0.5;

    if (saved >= milestone) {
      setState(() {
        goal['milestone'] = milestone;
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            title: const Text(
              'Milestone Reached!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'You have reached ₦${milestone.toStringAsFixed(0)} on your ${goal['name']} goal.',
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Great!'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            title: const Text(
              'Milestone',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Save ₦${(milestone - saved).toStringAsFixed(0)} more to reach your 50% milestone.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Okay'),
              ),
            ],
          );
        },
      );
    }
  }

  void completeGoal(int index) {
    final goal = goals[index];
    final target = goal['target'] as double;
    final saved = goal['saved'] as double;

    if (saved < target) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            title: const Text(
              'Goal Not Complete',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              'Keep saving until you reach your target amount.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Okay'),
              ),
            ],
          );
        },
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Complete Goal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Move this completed goal to your goal history?',
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
                  goals.removeAt(index);
                  history.insert(0, {
                    ...goal,
                    'completed': true,
                  });
                });

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: const Text('Archive Goal'),
            ),
          ],
        );
      },
    );
  }

  void deleteGoal(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Delete Goal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Are you sure you want to delete this savings goal?',
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
                  goals.removeAt(index);
                });

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void showHistory() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text(
            'Goal History',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: history.isEmpty
                ? const Text(
                    'You have no completed goals yet.',
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      final goal = history[index];

                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal.shade50,
                          child: const Icon(
                            Icons.check,
                            color: Colors.teal,
                          ),
                        ),
                        title: Text(
                          goal['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '₦${goal['target'].toStringAsFixed(0)} • ${goal['date']}',
                        ),
                      );
                    },
                  ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
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
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF172033),
                  ),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),
                const SizedBox(width: 4),
                const Text(
                  'Savings Goals',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF172033),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: showHistory,
                  icon: const Icon(
                    Icons.history,
                    color: Colors.teal,
                  ),
                  tooltip: 'Goal History',
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                'Save towards the things that matter to you.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: showGoalForm,
                icon: const Icon(Icons.add),
                label: const Text('Create Savings Goal'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ...goals.asMap().entries.map((entry) {
              final index = entry.key;
              final goal = entry.value;

              final target = goal['target'] as double;
              final saved = goal['saved'] as double;
              final contribution =
                  goal['contribution'] as double;

              final remaining = target - saved;
              final progress =
                  target == 0 ? 0.0 : saved / target;
              final percentage =
                  (progress * 100).clamp(0, 100).round();

              final monthsLeft = contribution > 0
                  ? (remaining / contribution).ceil()
                  : 0;

              final isComplete = saved >= target;

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                goal['name'],
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Target date: ${goal['date']}',
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
                              showGoalForm(index: index);
                            } else if (value == 'contribution') {
                              updateContribution(index);
                            } else if (value == 'milestone') {
                              markMilestone(index);
                            } else if (value == 'complete') {
                              completeGoal(index);
                            } else {
                              deleteGoal(index);
                            }
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            PopupMenuItem(
                              value: 'contribution',
                              child: Text(
                                'Update Contribution',
                              ),
                            ),
                            PopupMenuItem(
                              value: 'milestone',
                              child: Text(
                                'Check Milestone',
                              ),
                            ),
                            PopupMenuItem(
                              value: 'complete',
                              child: Text(
                                'Archive Goal',
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Saved',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '₦${saved.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 18,
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
                              'Target',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '₦${target.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        minHeight: 10,
                        backgroundColor: Colors.teal.shade50,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(
                          Colors.teal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$percentage% complete',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.teal,
                          ),
                        ),
                        Text(
                          isComplete
                              ? 'Goal reached!'
                              : '₦${remaining.toStringAsFixed(0)} left',
                          style: const TextStyle(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        isComplete
                            ? 'Congratulations! You reached your goal.'
                            : 'At ₦${contribution.toStringAsFixed(0)} per month, about $monthsLeft month${monthsLeft == 1 ? '' : 's'} remaining.',
                        style: TextStyle(
                          color: Colors.teal.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              addSavings(index);
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 18,
                            ),
                            label: const Text('Add Savings'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.teal,
                              side: const BorderSide(
                                color: Colors.teal,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              markMilestone(index);
                            },
                            icon: const Icon(
                              Icons.star_outline,
                              size: 18,
                            ),
                            label: const Text('Milestone'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}