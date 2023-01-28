<?php
include 'connection.php';
$l_id=$_GET['id'];

$fdate=$_POST['fdate'];
$todate=$_POST['todate'];

// var_dump($lid);
// exit();

$data=mysqli_query($con,"INSERT INTO `licence_tb`(`l_id`, `from_date`, `to_date`) VALUES ('$l_id','$fdate','$todate')");
mysqli_query($con,"UPDATE `learners_llc_tb` set `status`='licence issue' WHERE l_id='$l_id'");
echo "<script>alert('Licence  Issue')</script>";
  
    header("location:home.php");

  echo "<script>alert('sucess')</script>";
?>