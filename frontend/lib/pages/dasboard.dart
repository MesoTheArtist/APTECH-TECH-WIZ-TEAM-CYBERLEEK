// import 'package:flutter/material.dart';

// class Dasboard extends StatelessWidget{
//   const Dasboard({super.key});

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Text(
//                       'PennyPal'
//                     ),
//                   ),

//                   const Spacer(),

//                   Expanded(
//                     flex: 2,
//                     child: Text(
//                       'Profile'
//                     ),
//                   )
//                 ],
//               ),

//               SizedBox(height: 10,),

//               Text(
//                 'Dashboard',

//                 style: TextStyle(
//                   fontWeight: FontWeight.w800,
//                   fontSize: 30
//                 ),
//               ),

//               SizedBox(height: 20,),

//               Card(
//                 color: Colors.green,
//                 elevation: 4,
//                 child: Center(
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           child: Text(
//                             'Total Balance',
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               color: Colors.white
//                             ),
//                           ),
//                         ),

//                         Container(
//                           width: double.infinity,
//                           child: Text(
//                             'N750,000.75',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                               fontSize: 40
//                             ),
//                           ),
//                         ),

//                         Container(
//                           width: double.infinity,
//                           child: Text(
//                             'Updated: Oct 26',
//                             style: TextStyle(
//                               color: Colors.white
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ),
//                 ),
//               ),

//               SizedBox(height: 20,),

//               Text(
//                 'Monthly Budget Progress'
//               ),
//               // ========== progress bar ==========
//               Text(
//                 'Budget Status: 60% Spent (N100,000/N500,000)'
//               ),

//               SizedBox(height: 10,),

//               Text(
//                 'Groceries'
//               )
//             ],
//           ),
//         )
//       )
//     );
//   }
// }


import 'package:flutter/material.dart';

class Dasboard extends StatelessWidget {
  const Dasboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.white,

        // ================= BODY =================
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ================= TOP BAR =================
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

                // ================= MAIN CONTENT =================
                Padding(
                  padding: const EdgeInsets.all(15),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Dashboard title
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),

                      const SizedBox(height: 15),

                      // ================= BALANCE CARD =================
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
                                )
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

                      // ================= BUDGET =================
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
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 7),

                      // Main progress bar
                      LinearProgressIndicator(
                        value: 0.68,
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.teal,
                      ),

                      const SizedBox(height: 15),

                      // ================= CATEGORIES =================
                      Row(
                        children: [

                          // Groceries
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

                          // Dining
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

                          // Transport
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

                          // Books
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

                      // ================= QUICK ACTIONS =================
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
                        ],
                      ),

                      const SizedBox(height: 20),

                      // ================= RECENT TRANSACTIONS =================
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

                      // Transaction 1
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: const Text(
                          "Trader Joe's\nOct 26",
                        ),

                        trailing: const Text(
                          '\$58.20',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Transaction 2
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: const Text(
                          'Oct 25',
                        ),

                        trailing: const Text(
                          '\$1200',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Transaction 3
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: const Text(
                          'Oct 24',
                        ),

                        trailing: const Text(
                          '\$750',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Transaction 4
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: const Text(
                          'Cafe\nOct 23',
                        ),

                        trailing: const Text(
                          '\$24.50',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // ================= BOTTOM NAVIGATION =================
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,

          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,

          items: const [

            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'Budget',
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