import 'package:flutter/material.dart';
import 'package:medical_clinic_app/services/appointment_service.dart';

class ViewAppointmentsPage extends StatelessWidget {
  final String patientId;
  final AppointmentService _appointmentService = AppointmentService();

  ViewAppointmentsPage({required this.patientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
        backgroundColor: const Color.fromARGB(255, 99, 181, 249),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _appointmentService.getAppointments(patientId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading appointments.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No appointments found.'));
          } else {
            final appointments = snapshot.data!;
            return ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return ListTile(
                  title: Text('Dr. ${appointment['doctorName']}'),
                  subtitle: Text('${appointment['date']} at ${appointment['time']}'),
                  trailing: Text(appointment['patientName']),
                );
              },
            );
          }
        },
      ),
    );
  }
}