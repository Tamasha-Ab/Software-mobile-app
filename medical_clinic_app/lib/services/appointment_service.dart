import 'package:http/http.dart' as http;
import 'dart:convert';

class AppointmentService {
  static const String baseUrl = 'http://localhost:3000/api/appointments'; 

  Future<bool> bookAppointment(Map<String, dynamic> appointmentData) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(appointmentData),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getAppointments(String patientId) async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/appointments?patientId=$patientId'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((appointment) => appointment as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }
}
