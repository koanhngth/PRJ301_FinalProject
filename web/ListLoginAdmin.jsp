<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPTU Library</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <style>
            /* Custom styles for the library interface */
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
            }

            /* Header styles */
            .header {
                background-color: #ffffff;
                border-bottom: 2px solid #f1f1f1;
                padding: 20px 0;
            }

            .logo img {
                height: 80px;
                width: 160px;
            }

            .title {
                font-size: 36px;
                color: #e74c3c;
                font-weight: 600;
            }

            .nav-item:hover {
                background-color: #f0f0f0;
            }

            .subtitle {
                font-size: 16px;
                color: #f39c12;
            }

            .hours {
                font-weight: bold;
                font-size: 14px;
                color: #333;
            }

            .login-section a {
                color: #3498db;
                text-decoration: none;
            }

            .search-bar {
                background-color: rgba(255, 153, 0, 0.8);
                padding: 25px;
                margin-top: -50px;
                text-align: center;
                border-radius: 8px;
            }

            .search-bar input {
                width: 60%;
                padding: 10px;
                font-size: 18px;
                border: none;
                border-radius: 8px;
                margin-right: 10px;
            }

            .search-bar button {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                background-color: #f39c12;
                color: white;
                border-radius: 8px;
                cursor: pointer;
            }

            .search-bar button:hover {
                background-color: #e67e22;
            }

            /* Footer styles */
            .footer {
                background-color: #f39c12;
                color: white;
                padding: 40px 0;
                text-align: center;
            }

            .footer h6 {
                font-weight: 600;
            }

            .footer .stats {
                text-align: left;
                color: white;
            }

            .footer .logo-img {
                border-radius: 50%;
                margin: 10px;
            }
            .content-section {
                background-image: url('img/tv2.jpeg');
                background-repeat: no-repeat;
                background-position: center;
                padding: 50px;
                border-radius: 8px;
                background-size: cover;
                margin-top: 30px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            .tieude {
                color: #333;
                font-size: 40px;
                font-weight: 600;
                text-transform: uppercase;
            }

            .navbar {
                background-color: #f39c12;
            }

            .navbar-nav .nav-link {
                font-weight: bold;
                color: white;
                text-transform: uppercase;
            }

            .navbar-nav .nav-link:hover {
                background-color: #e67e22;
                color: white;
            }

            .navbar-toggler-icon {
                background-color: white;
            }

            /* Add media queries for responsiveness */
            @media (max-width: 767px) {
                .search-bar input {
                    width: 80%;
                    margin-bottom: 10px;
                }
            }
        </style>
    </head>
    <body>

        <!-- Header -->
        <header>
            <div class="container-fluid header">
                <div class="row align-items-center">
                    <!-- Logo and Title Section -->
                    <div class="col-md-4 d-flex align-items-center justify-content-center logo">
                        <a href="index.jsp">
                            <img src="img/logo1.png" alt="FPT Logo">
                        </a>
                    </div>

                    <!-- Welcome Message and Opening Hours -->
                    <div class="col-md-4 text-center">
                        <div class="title">Welcome to FPTU Library</div>
                        <div class="hours">Open: 08:15 - 21:00 Weekday | 08:00 - 12:00 & 13:00 - 17:00 Weekend</div>
                    </div>

                    <!-- Language and Login Section -->
                    <div class="col-md-4 text-center login-section">
                        <span>Vietnamese</span> | ${sessionScope.username} <a href="index.jsp">Log Out</a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Navigation Menu -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="listBook">Information Book</a></li>
                        <li class="nav-item"><a class="nav-link" href="bookInfo.jsp">Manage Book</a></li>
                        <li class="nav-item"><a class="nav-link" href="borrowReturnList.jsp">Debt Repayment List</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container my-5 content-section">
            <!-- You can add more content here -->
        </div>

        <!-- Footer -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 text-left">
                        <h6>FPT UNIVERSITY LIBRARY</h6>
                        <p>Phòng 107 tòa nhà Delta, Trường Đại học FPT, Khu CNC Hòa Lạc, Km29 Đại Lộ Thăng Long, Thạch Thất, Hà Nội</p>
                        <p>Email: thuvien_fu_hoalac@fpt.edu.vn | Phone: 02466 805 912</p>
                    </div>
                    <div class="col-md-4 text-center">
                        <a target="_blank" href="https://www.facebook.com/thuviendaihocfpt">
                            <img src="img/fb.jpg" alt="Facebook Logo" class="logo-img" width="50" height="50">
                        </a>
                    </div>
                    <div class="col-md-4 stats">
                        <h6>WEBSITE ACCESS STATISTICS</h6>
                        <p>Online: 213</p>
                        <p>Total Books: ${totalBooks}</p>
                        <p>Books in Stock: ${booksInStock}</p>
                        <p>Total Users: ${totalUsers}</p>
                        <p>Today: 9559 | Yesterday: 16215</p>
                        <p>This month: 38161 | Last month: 402460</p>
                        <p>Total visits: 6043173</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap and jQuery scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>