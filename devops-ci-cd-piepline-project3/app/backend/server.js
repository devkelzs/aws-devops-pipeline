const express = require("express");
const app = express();
const PORT = process.env.PORT || 5000;

app.get("/", (req, res) => {
  res.json({ message: "Welcome to the E-commerce API!" });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
