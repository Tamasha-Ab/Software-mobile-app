import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DoctorDetailsPage extends StatefulWidget {
  @override
  _DoctorDetailsPageState createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  List<dynamic> doctors = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    final String apiUrl = "http://localhost:3000/api/doctor"; // Use your PC’s IP

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        setState(() {
          doctors = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "Failed to load doctor details.";
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = "Error: $error";
        isLoading = false;
      });
      print('Error fetching doctor details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Details'), backgroundColor: Colors.blue),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.blueAccent))
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage, style: TextStyle(color: Colors.red, fontSize: 16)))
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];

                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.blue),
                        title: Text("${doctor['fullName']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [                            
                            Text("Phone: ${doctor['phoneNumber'] ?? 'N/A'}"),
                            Text("Specialization: ${doctor['specialization'] ?? 'N/A'}"),
                            Text("Experience: ${doctor['yearsOfExperience'] ?? 'N/A'} years"),
                            Text("Doctor Fee: LKR ${doctor['doctorFee'] ?? 'N/A'}"),

                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
