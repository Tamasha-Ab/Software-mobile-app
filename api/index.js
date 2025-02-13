/*const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const patientRoutes = require('./routes/patientRoutes'); // Import patient routes
const doctorRoutes = require('./routes/doctorRoutes');


// Load environment variables from .env file
require('dotenv').config();

// Initialize the Express app
const app = express();

// Import database connection
require('./db'); // MongoDB connection logic in db.js

// Middleware to parse JSON requests
app.use(express.json());

// Token verification middleware
const authenticateToken = (req, res, next) => {
  const token = req.headers['authorization']?.split(' ')[1];
  if (!token) return res.sendStatus(401); // Unauthorized

  jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
    if (err) return res.sendStatus(403); // Forbidden
    req.user = user; // Save user info for use in other routes
    next();
  });
};

// Use the patient routes
app.use('/api', patientRoutes);

// Use the doctor routes
app.use('/api', doctorRoutes); // API endpoint for doctors

// Example of a protected route
app.get('/api/protected-route', authenticateToken, (req, res) => {
  res.send('This is a protected route.');
});

// Default route for testing
app.get('/', (req, res) => {
  res.send('Welcome to the Medical Clinic API');
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});*/

const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const cors = require('cors');
require('dotenv').config();

const patientRoutes = require('./routes/patientRoutes');
const doctorRoutes = require('./routes/doctorRoutes');
const appointmentRoutes = require('./routes/appointmentRoutes'); // Import appointment routes

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

// Default route
app.get('/', (req, res) => {
  res.send('Welcome to the Medical Clinic API');
});

// Start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
