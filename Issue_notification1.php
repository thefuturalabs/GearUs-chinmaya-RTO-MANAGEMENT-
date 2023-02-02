<?php
include 'connection.php';
$rid=$_GET['id'];
if(isset($_POST['submit']))
{
    $data=mysqli_query($con,"SELECT * FROM `notification_tbl` WHERE r_id='$rid' and status='send'");
    if(mysqli_num_rows($data)>0)
    { 
        echo "<script>alert('alerdy send')</script>";

    }
    else
    {
    $date=$_POST['date'];
 
    $noti=$_POST['noti'];
    $time=$_POST['time'];
    $data=mysqli_query($con,"INSERT INTO `notification_tbl`(`notification`, `attend_date`, `status`, `r_id`,`time`) VALUES ('$noti','$date','send','$rid','$time')");
//  $data1=mysqli_query($con,"");
    
     header("location:home.php");
  
       echo "<script>alert('Invalid Username or password')</script>";
 
    }
    
}

?>


<!DOCTYPE html>
<html lang="en">

<head>
  <style>
   td{
    color: blue;
   }
   table
   {
    width: 100%;
   }
  </style>
    <meta charset="utf-8">
    <title>GearUS</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    
    <?php
   include 'sidebar.php';
   ?>
    <!-- Navbar End -->


    <div class="container-fluid page-header py-6 my-6 mt-0 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
          
<div class="col-12 my-6 mb-0 wow fadeInUp" data-wow-delay="0.1s"> 
    <form action="" method="POST">
                     <div class="bg-primary text-center p-5">
                        <h1 class="mb-4">Send notification</h1>
                        <form>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-floating">
                       <form action="issue_notification2.php?id=<?php echo $lid;?>" method="POST">
    <table >
    <tr>

 <td>Select date:</td>   <td><input type="date" name="date" required></td></tr>
 <tr><td>Notification</td>   <td> <textarea name="noti" id="" cols="40" rows="5" required> </textarea> </td></tr>
 <td>Time</td>   <td> <input type="time" name="time" required> </td></tr>
 <td></td>   <td> <button name="submit" class="btn btn-info" style="width: 15%;">Send</button> </td></tr>
</table>
                        </form>
                    </div>
                </div>  
           
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <!-- <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-primary active" aria-current="page">Contact</li> -->
                </ol>
            </nav>
        </div>
    </div>
   



    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>


  
</body>

</html>