<?php
include 'connection.php';

$rid=$_GET['id'];

mysqli_query($con,"UPDATE `registration_tb` SET `status`='reject' WHERE  r_id='$rid'");
// echo "<script>alert('delete successfully')</script>";
 echo "<script>window.location.href='view_userreg.php';</script>";
?>
