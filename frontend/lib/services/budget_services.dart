import 'dart:convert';
import 'package:http/http.dart' as http;

class BudgetService {
  static const baseUrl = 'http://10.0.2.2:5000/api'; // Android emulator
  // Use http://localhost:5000/api for web/chrome

  static Future<List<dynamic>> getBudgets(String token) async {
    final res = await http.get(
      Uri.parse('$baseUrl/budgets'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(res.body)['data'];
  }

  static Future<void> createBudget(String token, String category, double limit) async {
    await http.post(
      Uri.parse('$baseUrl/budgets'),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
      body: jsonEncode({'category': category, 'limit': limit, 'period': 'monthly'}),
    );
  }
}