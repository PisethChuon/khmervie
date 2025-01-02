const express = require("express");
const bodyParser = require("body-parser");
const bcrypt = require("bcryptjs");
const mysql = require("mysql2");

const app = express();
// const port = 3000;

// // Middleware
// app.use(bodyParser.json());

// // MySQL Connection
// const db = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "12345678",
//   database: "testdb1",
// });

// db.connect((err) => {
//   if (err) {
//     console.error("Error connecting to MySQL: ", err);
//   }
//   console.log("Connecte to MYSQL!");
// });

// // Signup Route
// app.post("/signup", async (req, res) => {
//   const { name, email, password } = req.body;

//   console.log("Received data:", { name, email, password }); // Log the incoming data

//   if (!name || !email || !password) {
//     return res.status(400).json({ message: "All fields are required" });
//   }

//   try {
//     // Hash the password
//     const hashedPassword = await bcrypt.hash(password, 10);

//     // Insert user into the database
//     db.query(
//       "INSERT INTO users (name, email, password) VALUES (?, ?, ?)",
//       [name, email, hashedPassword],
//       (error, results) => {
//         if (error) {
//           console.error("Error inserting user:", error); // Log the error
//           if (error.code === "ER_DUP_ENTRY") {
//             return res.status(400).json({ message: "Email already exists" });
//           }
//           return res
//             .status(500)
//             .json({ message: "Internal server error", error: error.message });
//         }
//         console.log("User inserted successfully:", results); // Log success
//         res
//           .status(201)
//           .json({ message: "User registered successfully", user: results });
//       }
//     );
//   } catch (error) {
//     console.error("Error hashing password:", error); // Log error
//     res
//       .status(500)
//       .json({ message: "Error hashing password", error: error.message });
//   }
// });

// Validate Function
function validatePassword(password) {
  // at least 8 characters

  const minLength = 8;

  if (password.length < minLength) {
    return {
      valid: false,
      message: `Password must be at least ${minLength} characters.`,
    };
  }

  // Password must contain at least one uppercase letter
  if (!/[A-Z]/.test(password)) {
    return {
      valid: false,
      message: "Password must contain at least one uppercase letter.",
    };
  }

  // Password must contain at least one lowercase letter
  if (!/[a-z]/.test(password)) {
    return {
      valid: false,
      message: "Password must contain at least one lowercase letter.",
    };
  }

  // Password must contain at least one number
  if (!/[0-9]/.test(password)) {
    return {
      valid: false,
      message: "Password must contain at least one number.",
    };
  }

  // Password must contain at least one special character
  if (!/[^A-Za-z0-9]/.test(password)) {
    return {
      valid: false,
      message: "Password must contain at least one special character.",
    };
  }

  return { valid: true, message: "Password is valid." };
}

const password = "T";
const result = validatePassword(password);
if (!result.valid) {
  console.log(result.message);
} else {
  console.log("Password is valid!");
}

// Start Server
// app.listen(port, "0.0.0.0", () => {
//   console.log(`Server running on http://localhost:${port}`);
// });
