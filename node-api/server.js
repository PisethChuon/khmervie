const express = require("express");
const bodyParser = require("body-parser");
const bcrypt = require("bcryptjs");
const mysql = require("mysql2");

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());

// MySQL Connection
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "12345678",
  database: "testdb1",
});

db.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL: ", err);
  }
  console.log("Connecte to MYSQL!");
});

// Signup Route
app.post("/signup", async (req, res) => {
  const { name, email, password } = req.body;

  console.log("Received data:", { name, email, password }); // Log the incoming data

  if (!name || !email || !password) {
    return res.status(400).json({ message: "All fields are required" });
  }

  try {
    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user into the database
    db.query(
      "INSERT INTO users (name, email, password) VALUES (?, ?, ?)",
      [name, email, hashedPassword],
      (error, results) => {
        if (error) {
          console.error("Error inserting user:", error); // Log the error
          if (error.code === "ER_DUP_ENTRY") {
            return res.status(400).json({ message: "Email already exists" });
          }
          return res
            .status(500)
            .json({ message: "Internal server error", error: error.message });
        }
        console.log("User inserted successfully:", results); // Log success
        res
          .status(201)
          .json({ message: "User registered successfully", user: results });
      }
    );
  } catch (error) {
    console.error("Error hashing password:", error); // Log error
    res
      .status(500)
      .json({ message: "Error hashing password", error: error.message });
  }
});

// Start Server
app.listen(port, "0.0.0.0", () => {
  console.log(`Server running on http://localhost:${port}`);
});
