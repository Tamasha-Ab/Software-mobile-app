// const mongoose = require('mongoose');

// const userSchema = new mongoose.Schema({
//   fullName: String,
//   email: String,
//   phoneNumber: String,
//   password: String,
//   role: String,
//   medicalLicenseNumber: String,
//   specialization: String,
//   yearsOfExperience: Number
// });

// module.exports = mongoose.model('User', userSchema); // Model for 'users' collection



const mongoose = require('mongoose');

const timeSlotSchema = new mongoose.Schema({
  startTime: String,
  endTime: String,
  maxPatients: Number,
});

const availabilitySchema = new mongoose.Schema({
  day: String,
  timeSlots: [timeSlotSchema],
});

const userSchema = new mongoose.Schema({
  fullName: String,
  email: String,
  phoneNumber: String,
  password: String,
  role: String,
  medicalLicenseNumber: String,
  specialization: String,
  yearsOfExperience: Number,
  availability: [availabilitySchema], // Add availability field
});

module.exports = mongoose.model('User', userSchema); // Model for 'users' collection