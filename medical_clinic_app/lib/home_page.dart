// import 'package:flutter/material.dart';
// import 'login_page.dart';
// import 'generalPatientInformation.dart';
// import 'view_profile.dart';
// import 'make_appointment_page.dart'; // Import the MakeAppointmentPage
// import 'health_education_page.dart'; // Import the HealthEducationPage
// import 'view_appointments_page.dart'; // Import the ViewAppointmentsPage

// class HomePage extends StatelessWidget {
//   final String userName;
//   final String patientId;

//   const HomePage({required this.userName, required this.patientId, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome $userName'),
//         backgroundColor: const Color.fromARGB(255, 99, 181, 249),
//       ),
//       body: Container(
//         color: const Color.fromARGB(255, 255, 255, 255), // Background color
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.stretch, // Ensures Row fills screen height
//           children: [
//             Container(
//               color: const Color.fromARGB(187, 10, 216, 213),
//               width: MediaQuery.of(context).size.width * 0.5,
//               padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Hi !\n$userName',
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => GeneralPatientInformation(patientId: patientId),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 99, 181, 249)),
//                       child: const Text('Edit Your Profile'),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ViewProfile(userId: patientId),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 99, 181, 249)),
//                       child: const Text('View Your Profile'),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ViewAppointmentsPage(username: userName), // Navigate to ViewAppointmentsPage
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 99, 181, 249)),
//                       child: const Text('View My Appointments'),
//                     ),
//                     const SizedBox(height: 20),
//                     for (var text in [
//                       'Make an Appointment',
//                       'View Test Results',
//                       'View Prescription',
//                       'View the Bill',
//                       'Health Educations'
//                     ])
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: ElevatedButton(
//                           onPressed: text == 'Make an Appointment'
//                               ? () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => MakeAppointmentPage(patientId: patientId),
//                                     ),
//                                   );
//                                 }
//                               : text == 'Health Educations'
//                                   ? () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => const HealthEducationPage(),
//                                         ),
//                                       );
//                                     }
//                                   : () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color.fromARGB(255, 105, 181, 247),
//                           ),
//                           child: Text(text),
//                         ),
//                       ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => const LoginPage()),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                       child: const Text('Log Out'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 color: const Color.fromARGB(255, 155, 239, 237),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Flexible(
//                           child: Text(
//                             'Care',
//                             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Flexible(
//                           child: Text(
//                             'Plus',
//                             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 105, 181, 247)),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Image.network(
//                       'https://s3-media0.fl.yelpcdn.com/bphoto/kROaBMMNs2u1t9RHYMbv9g/1000s.jpg',
//                       width: 100,
//                       height: 100,
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'The Best Medical Clinic for You!',
//                       style: TextStyle(fontSize: 16, color: Colors.black54),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Add this dependency for better icons
import 'login_page.dart';
import 'generalPatientInformation.dart';
import 'view_profile.dart';
import 'make_appointment_page.dart';
import 'health_education_page.dart';
import 'view_appointments_page.dart';
import 'view_bill_page.dart';
import 'prescription.dart';

class HomePage extends StatelessWidget {
  final String userName;
  final String patientId;

  const HomePage({required this.userName, required this.patientId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 186, 205, 226), Color(0xFF67C8FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sidebar (Now Bigger)
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF67C8FF), Color.fromARGB(255, 186, 205, 226)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Text
                    Text(
                      'Hi ! $userName',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Sidebar Buttons with Icons
                    buildSidebarButton(
                        context, FontAwesomeIcons.userEdit, 'Edit Your Profile', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GeneralPatientInformation(patientId: patientId),
                        ),
                      );
                    }),

                    buildSidebarButton(
                        context, FontAwesomeIcons.user, 'View Your Profile', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewProfile(userId: patientId),
                        ),
                      );
                    }),

                    buildSidebarButton(
                        context, FontAwesomeIcons.calendarCheck, 'View Appointments',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ViewAppointmentsPage(username: userName),
                        ),
                      );
                    }),

                    buildSidebarButton(
                        context, FontAwesomeIcons.calendarPlus, 'Make Appointment',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MakeAppointmentPage(patientId: patientId),
                        ),
                      );
                    }),

                    buildSidebarButton(
                        context, FontAwesomeIcons.fileMedical, 'View Test Results', () {
                      // Add the correct page navigation when available
                    }),

                    buildSidebarButton(
                        context, FontAwesomeIcons.prescription, 'View Prescription',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrescriptionPage(patientUsername: userName),
                        ),
                      );
                    }),

                    buildSidebarButton(
                        context, FontAwesomeIcons.receipt, 'View Bill', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewBillPage(username: userName),
                        ),
                      );
                    }),

                    buildSidebarButton(
                        context, FontAwesomeIcons.bookMedical, 'Health Educations',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HealthEducationPage(),
                        ),
                      );
                    }),

                    // Logout Button
                    const SizedBox(height: 25),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        },
                        icon: const Icon(FontAwesomeIcons.signOutAlt, color: Colors.white, size: 18),
                        label: const Text(
                          'Log Out',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 212, 29, 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Right Panel with Welcome Image
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 186, 205, 226), Color(0xFF67C8FF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'CarePlus',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 71, 92),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/doctor.png',
                      width: 160,
                      height: 160,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'The Best Medical Clinic for You!',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated Button Style
  Widget buildSidebarButton(
      BuildContext context, IconData icon, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          elevation: 4,
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF67C8FF), size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF67C8FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}