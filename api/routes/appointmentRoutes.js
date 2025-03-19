const express = require('express');
const Appointment = require('../models/appointments'); // Import the Appointment model
const router = express.Router();

// Fetch appointments for a specific doctor
router.get('/appointments/doctor/:doctorName', async (req, res) => {
  try {
    const appointments = await Appointment.find({ doctorName: req.params.doctorName });
    res.status(200).json(appointments);
  } catch (error) {
    console.error('Error fetching appointments:', error);
    res.status(500).json({ message: 'Error fetching appointments', error });
  }
});

// Book an appointment
router.post('/appointments', async (req, res) => {
  try {
    const { doctorName, date, time, patientName, patientEmail, patientPhone, patientUsername } = req.body;

    console.log('Booking appointment with data:', req.body);

    // Check if the slot is already booked
    const existingAppointment = await Appointment.findOne({ doctorName, date, time });
    if (existingAppointment) {
      return res.status(400).json({ message: 'This time slot is already booked.' });
    }

    // Create and save appointment
    const newAppointment = new Appointment({
      doctorName,
      date,
      time,
      patientName,
      patientEmail,
      patientPhone,
      patientUsername,
    });

    const savedAppointment = await newAppointment.save();
    res.status(201).json({ message: 'Appointment booked successfully', appointment: savedAppointment });

  } catch (error) {
    console.error('Error booking appointment:', error);
    res.status(500).json({ message: 'Error booking appointment', error });
  }
});

// Fetch appointments by patientUsername
router.get('/appointments/username/:username', async (req, res) => {
  try {
    const { username } = req.params;
    const appointments = await Appointment.find({ patientUsername: username });
    
    res.json(appointments);
  } catch (error) {
    console.error('Error retrieving appointments:', error);
    res.status(500).json({ message: 'Error retrieving appointments', error });
  }
});

// Define the endpoint to fetch patient info by username
router.get('/patient/username/:username', async (req, res) => {
  try {
    const username = req.params.username;
    const patient = await Patient.findOne({ username: username });

    if (!patient) {
      return res.status(404).json({ message: 'Patient not found' });
    }

    res.status(200).json(patient);
  } catch (error) {
    console.error('Error fetching patient info:', error);
    res.status(500).json({ message: 'Error fetching patient info', error: error.message });
  }
});

module.exports = router;