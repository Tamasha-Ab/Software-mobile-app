const mongoose = require("mongoose");

const billSchema = new mongoose.Schema({
  patientName: String,
  username:String,
  doctorFee: Number,
  reportFee: Number,
  clinicalFee: Number,
  totalFee: Number,
  createdAt: { type: Date, default: Date.now },
});

const Bill = mongoose.model("bills", billSchema);

module.exports = Bill;
