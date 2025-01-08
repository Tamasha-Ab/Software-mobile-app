const express = require('express');
const mongoose = require('mongoose');

const router = express.Router();

// Appointment Schema
const appointmentSchema = new mongoose.Schema({
  doctorName: { type: String, required: true },
  date: { type: String, required: true },
  time: { type: String, required: true },
  patientName: { type: String, required: true },
  patientEmail: { type: String, required: true },
  patientPhone: { type: String, required: true },
});

const Appointment = mongoose.model('Appointment', appointmentSchema);

// Save an appointment
router.post('/appointments', async (req, res) => {
  try {
    const {
      doctorName,
      date,
      time,
      patientName,
      patientEmail,
      patientPhone,
    } = req.body;

    // Check if the selected time slot is already booked
    const existingAppointment = await Appointment.findOne({ doctorName, date, time });
    if (existingAppointment) {
      return res.status(400).json({ message: 'This time slot is already booked.' });
    }

    // Save the appointment
    const newAppointment = new Appointment({
      doctorName,
      date,
      time,
      patientName,
      patientEmail,
      patientPhone,
    });

    const savedAppointment = await newAppointment.save();
    res.status(201).json(savedAppointment);
  } catch (error) {
    res.status(500).json({ message: 'Error saving appointment', error });
  }
});

module.exports = router;
