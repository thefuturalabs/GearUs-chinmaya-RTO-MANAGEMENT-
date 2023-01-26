<?php
include 'connection.php';
$l_id=$_GET['id'];


    $data=mysqli_query($con,"UPDATE `learners_llc_tb` SET status='Issue' WHERE l_id='$l_id'");
  
    header("location:issue_LLC.php");

  echo "<script>alert('sucess')</script>";
?>