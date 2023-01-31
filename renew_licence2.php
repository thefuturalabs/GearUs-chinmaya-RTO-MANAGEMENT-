<?php
include 'connection.php';
$l_id=$_GET['id'];

$fdate=$_POST['fdate'];
$todate=$_POST['todate'];

// var_dump($lid);
// exit();

$data=mysqli_query($con,"UPDATE `licence_tb` SET `from_date`='$fdate',`to_date`='$todate',`status`='renew' WHERE l_id='$l_id'");
// mysqli_query($con,"UPDATE `learners_llc_tb` set `status`='licence issue' WHERE l_id='$l_id'");
echo "<script>alert('Licence  Issue')</script>";
  
    header("location:home.php");

  echo "<script>alert('sucess')</script>";
?>