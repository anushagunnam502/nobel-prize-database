<?php
// Connect to MariaDB
$conn = new mysqli("localhost", "root", "", "nobelprizedata");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL Query: Get recent Nobel Prize winners
$sql = "SELECT w.first_name, w.last_name, c.category_name, p.year_awarded
        FROM Winners w
        JOIN Prizes p ON w.winner_id = p.winner_id
        JOIN Categories c ON p.category_id = c.category_id
        ORDER BY p.year_awarded DESC
        LIMIT 10";

$result = $conn->query($sql);

// Display results
echo "<h2>Recent Nobel Prize Winners</h2>";
echo "<table border='1'><tr><th>Name</th><th>Category</th><th>Year</th></tr>";

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["first_name"] . " " . $row["last_name"] . "</td>
                  <td>" . $row["category_name"] . "</td>
                  <td>" . $row["year_awarded"] . "</td></tr>";
    }
} else {
    echo "<tr><td colspan='3'>No results found</td></tr>";
}

echo "</table>";

// Save report to a file
$file = fopen("nobel_prize_report.txt", "w");
fwrite($file, "Recent Nobel Prize Winners\n-----------------------\n");
if ($result->num_rows > 0) {
    mysqli_data_seek($result, 0); // Reset pointer for file writing
    while ($row = $result->fetch_assoc()) {
        fwrite($file, "{$row['first_name']} {$row['last_name']} - {$row['category_name']} ({$row['year_awarded']})\n");
    }
}
fclose($file);
echo "<p>Report saved to <b>nobel_prize_report.txt</b></p>";

// Close database connection
$conn->close();
?>
