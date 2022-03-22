
<!DOCTYPE html>
<html>
    <head>
            <link rel="stylesheet" href="html/botstrap_css/bootstrap.min.css">
            
            <title>Serach Result</title>
    </head>
    <body>


    <?php
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect("localhost", "root", "chemistry101", "company1");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
 
// Attempt select query execution

$query = $_POST['name']; 
if ($query === ''){
    echo "enter a name";
}
else{
$sql = "SELECT * FROM employee WHERE (`lname` LIKE '%".$query."%')";
if($result = mysqli_query($link, $sql)){
    if(mysqli_num_rows($result) > 0){
        echo "<table class=\"table  table-dark table-borderless table-hover\">";
            echo "<tr>";
                echo "<th>Firstname</th>";
                echo "<th>Lastname</th>";
                echo "<th>SEX</th>";
                echo "<th>DNO</th>";
            echo "</tr>";
        while($row = mysqli_fetch_array($result)){
            echo "<tr>";
                echo "<td>" . $row['fname'] . "</td>";
                echo "<td>" . $row['lname'] . "</td>";
                echo "<td>" . $row['sex'] . "</td>";
                echo "<td>" . $row['dno'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
        // Free result set
        mysqli_free_result($result);
    } else{
        echo "No records matching your query were found.";
    }
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
}
} 
// Close connection
mysqli_close($link);
?>

    <button type="button" class="btn btn-danger"><a class="nav-link text-light" href="index.php">Reset</a></button>

      <script src="html/Bootstrp_js/Jq.js"></script>
      <script src="html/Bootstrp_js/popper.min.js"></script>
      <script src="html/Bootstrp_js/bootstrap.min.js"></script>
    </body>

</html>