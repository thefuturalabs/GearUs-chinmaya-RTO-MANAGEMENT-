<?php
include 'connection.php';
$r_id=$_POST["r_id"];
$data=mysqli_query($con,"SELECT * FROM `learners_llc_tb` WHERE r_id='$r_id'");
 $row=mysqli_fetch_assoc(($data));

 $list=array();
 if(mysqli_num_rows($data)>0)
 {

 





    $myarray['r_id']=$row['r_id'];
    $myarray['email']=$row['email'];
    $myarray['Birth_place']=$row['Birth_place'];
    // $myarray['phone']=$row['phone'];
    $myarray['Blood_group']=$row['Blood_group'];
    $myarray['city']= $row['city'];
    $myarray['DOB']=$row['DOB'];
    $myarray['first_name']=$row['first_name'];
    $myarray['iden_mark']=$row['iden_mark'];
    $myarray['last_name']=$row['last_name'];
    $myarray['LLC_type']=$row['LLC_type'];
    $myarray['proof']=$row['proof'];
    $myarray['photo']=$row['photo'];
    $myarray['state']=$row['state'];
    $myarray['qualification']=$row['qualification'];
    $myarray['message']="sucess";
  
    // array_push($list,$myarray);

}
 else
 {
    $myarray['message']="failed";
    // array_push($list,$myarray);

 }
 echo json_encode($myarray);

