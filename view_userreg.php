<?php
include 'connection.php';
$data=mysqli_query($con,"select * from registration_tb where status='register'");
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Drivin - Driving School Website Template</title>
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
    
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="index.html" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
            <h2 class="m-0"><i class="fa fa-car text-primary me-2"></i>GearUS</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon">HOME</span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="home.php" class="nav-item nav-link">Home</a>
                <a href="view_userreg.php" class="nav-item nav-link">View Registration</a>
                <a href="" class="nav-item nav-link"></a>
                <a href="" class="nav-item nav-link">Logout</a>
                <a href="issue_LLC.php" class="nav-item nav-link">Issue LLC</a>
               
        </div>
    </nav>
    <!-- Navbar End -->


    <div class="container-fluid page-header py-6 my-6 mt-0 wow fadeIn" data-wow-delay="0.1s">
        <div class="container text-center">
          
<div class="col-12 my-6 mb-0 wow fadeInUp" data-wow-delay="0.1s"> 
    <form action="" method="POST">
                     <div class="bg-primary text-center p-5">
                        <h1 class="mb-4">User Registration</h1>
                        <form>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-floating">
                                    <table class="table table-bordered" class="table-warning">
                      <thead>
                        <tr>
                
                          <th>
                            name
                          </th>
                          <th>
                            DOB
                          </th>
                          <th>
                            Email
                          </th>
                          <th>
                            Phone No
                          </th>
                          <th>
                          Licence status
                          </th>
                          <th>
                            Address
                          </th>
                          <th>
                            Qualification
                          </th>
                          <th>
                            
                          </th>
                          <th>
                            
                            </th>
                        </tr>
                      </thead>
                      <tbody>
                      <?php
        while($row=mysqli_fetch_assoc($data))
        {
        ?>
     <tr>
    
    <td><?php echo $row['name'];?></td>
    <td><?php echo $row['dob'];?></td>
    <td><?php echo $row['email'];?></td>
    <td><?php echo $row['phone'];?></td>
    <td><?php echo $row['licence_status'];?></td>
    <td><?php echo $row['address'];?></td>
    <td><?php echo $row['qualification'];?></td> 
    
     <td><a style="color: blue;" href="approve_userreg.php?id=<?php echo $row['r_id']?>">APPROVE</a></td> 
    <td><a style="color: blue;" href="reject_userreg.php?id=<?php echo $row['r_id']?>">REJECT</a></td> 
 
   
   </tr>

       <?php
        }
        ?>
                                </div>
                                </div>
                            </div>
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