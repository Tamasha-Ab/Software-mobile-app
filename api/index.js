// const express = require('express');
// const mongoose = require('mongoose');
// const bcrypt = require('bcrypt');
// const jwt = require('jsonwebtoken');
// const cors = require('cors');
// require('dotenv').config();

// const patientRoutes = require('./routes/patientRoutes');
// const doctorRoutes = require('./routes/doctorRoutes');
// const appointmentRoutes = require('./routes/appointmentRoutes'); // Import appointment routes
// const billRoutes = require('./routes/billRoutes'); // Import bill routes
// const prescriptionRoutes = require('./routes/prescriptionRoutes'); // Import prescription routes

// const app = express();

// // Import database connection
// require('./db');

// // Middleware
// app.use(express.json());
// app.use(cors()); // Enable CORS for frontend communication

// // Token verification middleware
// const authenticateToken = (req, res, next) => {
//   const token = req.headers['authorization']?.split(' ')[1];
//   if (!token) return res.sendStatus(401);

//   jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
//     if (err) return res.sendStatus(403);
//     req.user = user;
//     next();
//   });
// };

// // Use routes
// app.use('/api', patientRoutes);
// app.use('/api', doctorRoutes);
// app.use('/api', appointmentRoutes); // API endpoint for appointments
// app.use('/api', billRoutes); // API endpoint for bills
// app.use('/api', prescriptionRoutes); // API endpoint for prescriptions

// // Default route
// app.get('/', (req, res) => {
//   res.send('Welcome to the Medical Clinic API');
// });

// // Start server
// const PORT = process.env.PORT || 3000;
// app.listen(PORT, () => {
//   console.log(`Server running on port ${PORT}`);
// });


const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const cors = require('cors');
require('dotenv').config();

const patientRoutes = require('./routes/patientRoutes');
const doctorRoutes = require('./routes/doctorRoutes');
const appointmentRoutes = require('./routes/appointmentRoutes'); // Import appointment routes
const billRoutes = require('./routes/billRoutes'); // Import bill routes
const prescriptionRoutes = require('./routes/prescriptionRoutes'); // Import prescription routes
//const doctorDetailsRoutes = require('./routes/doctorDetailsRoutes.js');
const app = express();

// Import database connection
require('./db');

// Middleware
app.use(express.json());
app.use(cors()); // Enable CORS for frontend communication

// Token verification middleware
const authenticateToken = (req, res, next) => {
  const token = req.headers['authorization']?.split(' ')[1];
  if (!token) return res.sendStatus(401);

  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next();
  });
};

// Use routes
app.use('/api', patientRoutes);
app.use('/api', doctorRoutes);
app.use('/api', appointmentRoutes); // API endpoint for appointments
app.use('/api', billRoutes); // API endpoint for bills
app.use('/api', prescriptionRoutes); // API endpoint for prescriptions
//app.use('/api', doctorDetailsRoutes); // API endpoint for doctor details
// Default route
app.get('/', (req, res) => {
  res.send('Welcome to the Medical Clinic API');
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});