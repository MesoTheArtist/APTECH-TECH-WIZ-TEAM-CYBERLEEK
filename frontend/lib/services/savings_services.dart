import 'dart:convert';
import 'package:http/http.dart' as http;

class SavingsService {
  static const baseUrl = 'http://10.0.2.2:5000/api';

  static Future<List<dynamic>> getGoals(String token) async {
    final res = await http.get(
      Uri.parse('$baseUrl/savings'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(res.body)['data'];
  }

  static Future<void> createGoal(String token, String name, double amount, String date) async {
    await http.post(
      Uri.parse('$baseUrl/savings'),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
      body: jsonEncode({'goalName': name, 'targetAmount': amount, 'targetDate': date}),
    );
  }

  static Future<void> addMoney(String token, String id, double amount) async {
    await http.patch(
      Uri.parse('$baseUrl/savings/$id/add'),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
      body: jsonEncode({'amount': amount}),
    );
  }
}