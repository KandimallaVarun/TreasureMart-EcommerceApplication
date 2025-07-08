<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%
request.setAttribute("currentPage", "about");
%>
    <jsp:include page="../admin/Header.jsp"></jsp:include>
    <title>About Us - [TreasureMart]</title>
    <style>
        :root {
            --primary: #2a2a2a;
            --secondary: #e63946;
            --light: #f8f9fa;
            --dark: #212529;
            --gray: #6c757d;
        }
        
        body {
        	padding-top: 60px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--light);
            margin: 0;
            background-color: #ffffff;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        
        .hero-section {
            text-align: center;
            padding: 60px 0;
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://images.unsplash.com/photo-1551434678-e076c223a692?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            margin-bottom: 40px;
            border-radius: 8px;
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: white;
        }
        
        .hero-section h1 {
            color: white;
        }
        
        h2 {
            font-size: 1.8rem;
            margin: 40px 0 20px;
            color: var(--light);
            position: relative;
            padding-bottom: 10px;
        }
        
        h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 60px;
            height: 3px;
            background-color: var(--secondary);
        }
        
        p {
            font-size: 1.1rem;
            margin-bottom: 20px;
            color: white;
        }
        
        .hero-section p {
            color: rgba(255,255,255,0.9);
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .usp-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin: 40px 0;
        }
        
        .usp-card {
            background-color: var(--light);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
            text-align: center;
        }
        
        .usp-card p,h3{
        	color: var(--dark);
        }
        
        .usp-card:hover {
            transform: translateY(-5px);
        }
        
        .usp-icon {
            font-size: 2.5rem;
            color: var(--secondary);
            margin-bottom: 15px;
        }
        
        .team-section {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            margin: 40px 0;
            justify-content: center;
        }
        
        .team-member {
            flex: 1;
            min-width: 250px;
            max-width: 300px;
            text-align: center;
        }
        
        .team-photo {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 3px solid var(--secondary);
        }
        
        .promise-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }
        
        .promise-item {
            padding: 20px;
            border-left: 3px solid var(--secondary);
            
        }
        
        .promise-item h3, .team-member h3{
        	color:var(--light);
        }
        
        .image-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }
        
        .gallery-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }
        
        .gallery-image:hover {
            transform: scale(1.03);
        }
        
        .cta-section {
            text-align: center;
            padding: 60px 0;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            border-radius: 8px;
            margin-top: 40px;
        }
        
        .cta-section h2, .cta-section p {
            color: white;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: var(--secondary);
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-weight: bold;
            transition: all 0.3s ease;
            margin-top: 20px;
        }
        
        .btn:hover {
            background-color: var(--dark);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }
            
            h2 {
                font-size: 1.5rem;
            }
            
            .usp-grid {
                grid-template-columns: 1fr;
            }
        }
        
        .footer{
        	padding: 1px 0 !important;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>
    <div class="container">
        <section class="hero-section">
            <h1>Our Story</h1>
            <p>Welcome to <strong>EcoStyle</strong>, where passion meets purpose. Founded in <strong>2018</strong>, we set out on a mission to <strong>make sustainable fashion accessible to everyone</strong>. What started as <strong>a small boutique in Portland</strong> has grown into a trusted name for <strong>eco-friendly apparel</strong>—thanks to you.</p>
        </section>

        <section>
            <h2>Why Choose Us?</h2>
            <div class="usp-grid">
                <div class="usp-card">
                    <div class="usp-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <h3>Quality First</h3>
                    <p>Every product is <strong>handcrafted</strong> to ensure it meets our high standards for sustainability and durability.</p>
                </div>
                <div class="usp-card">
                    <div class="usp-icon">
                        <i class="fas fa-leaf"></i>
                    </div>
                    <h3>Eco-Conscious</h3>
                    <p>Carbon-neutral shipping and 100% organic materials - fashion that loves the earth.</p>
                </div>
                <div class="usp-card">
                    <div class="usp-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>Customer Love</h3>
                    <p>Over <strong>50,000</strong> happy customers and <strong>4.9/5</strong> star reviews—we're proud but never satisfied.</p>
                </div>
            </div>
        </section>

        <section>
            <h2>Behind the Scenes</h2>
            <div class="image-gallery">
                <img src="https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" alt="Our workshop" class="gallery-image">
                <img src="https://images.unsplash.com/photo-1523381294911-8d3cead13475?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" alt="Materials we use" class="gallery-image">
                <img src="https://images.unsplash.com/photo-1551232864-3f0890e580d9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" alt="Happy customers" class="gallery-image">
            </div>
        </section>

        <section>
            <h2>Meet the Team</h2>
            <div class="team-section">
                <div class="team-member">
                    <img src="../../images/admin.svg" alt="Sarah Johnson" class="team-photo">
                    <h3>Varun Kandimalla</h3>
                    <p><em>"Founder | CEO"</em></p>
                </div>
                <div class="team-member">
                    <img src="../../images/admin.svg" alt="Michael Chen" class="team-photo">
                    <h3>Sai Teja</h3>
                    <p><em>"Our mission is to prove sustainability and style aren't mutually exclusive."</em></p>
                </div>
                <div class="team-member">
                    <img src="../../images/admin.svg" alt="Priya Patel" class="team-photo">
                    <h3>Venkat Macha</h3>
                    <p><em>"Every stitch tells a story of ethical craftsmanship."</em></p>
                </div>
            </div>
        </section>

        <section>
            <h2>Our Promise to You</h2>
            <div class="promise-grid">
                <div class="promise-item">
                    <h3>Fast & Free Shipping</h3>
                    <p>Because waiting is the worst. We deliver within 3-5 business days.</p>
                </div>
                <div class="promise-item">
                    <h3>Easy Returns</h3>
                    <p>No-questions-asked policy within 30 days of purchase.</p>
                </div>
                <div class="promise-item">
                    <h3>24/7 Support</h3>
                    <p>Reach out anytime at <strong>support@ecostyle.com</strong> for assistance.</p>
                </div>
            </div>
        </section>

        <section class="cta-section">
            <h2>Join Our Journey</h2>
            <p>We're more than a store—we're a movement. Follow us on <strong>@EcoStyleOfficial</strong> or tag <strong>#EcoStyleLife</strong> to share how you wear your values!</p>
            <a href="/EcommerceWebsite/view/home/index.jsp" class="btn">Shop Our Bestsellers</a>
        </section>
    </div>
    
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>