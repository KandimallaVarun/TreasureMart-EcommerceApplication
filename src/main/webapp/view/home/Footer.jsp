<head>
  <!-- Optional: Add this CSS for hover effects -->
  <style>
    .hover-text-white:hover { color: white !important; }
    .transition { transition: color 0.2s ease; }
    .social-icon {
      width: 36px;
      height: 36px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      background-color: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      transition: all 0.3s ease;
    }
    .social-icon:hover {
      background-color: rgba(255, 255, 255, 0.2);
      transform: translateY(-3px);
    }
    
    .footer {
  margin-top: auto;
  position: relative !important;
  bottom: 0;
  left: 0;
  width: 100%;
}
    
    @media (max-width: 768px) {
  .footer {
    text-align: center;
  }
  .icons{
  	display: flex;
  	align-items: center;
  	justify-content: center;
  }
}
  </style>
</head>
<body>
<footer class="bg-dark text-white py-5 mt-5 footer">
  <div class="container">
    <div class="row g-4">

      <!-- Policy Links -->
      <div class="col-lg-3 col-md-6">
        <div class="ps-lg-5">
          <h5 class="mb-4 fw-normal">Policy</h5>
          <ul class="list-unstyled">
            <li class="mb-2">
              <a href="#" class="text-white-50 text-decoration-none hover-text-white transition">Privacy Policy</a>
            </li>
            <li class="mb-2">
              <a href="#" class="text-white-50 text-decoration-none hover-text-white transition">Terms of Service</a>
            </li>
            <li>
              <a href="#" class="text-white-50 text-decoration-none hover-text-white transition">Refund Policy</a>
            </li>
          </ul>
        </div>
      </div>

      <!-- Contact Information -->
      <div class="col-lg-3 col-md-6">
        <div class="ps-lg-5">
          <h5 class="mb-4 fw-normal">Contact</h5>
          <ul class="list-unstyled text-white-50">
            <li class="mb-2">
              <i class="fas fa-envelope me-2 text-primary"></i> support@treasuremart.com
            </li>
            <li class="mb-2">
              <i class="fas fa-phone me-2 text-primary"></i> +91 12345 67890
            </li>
            <li>
              <i class="fas fa-clock me-2 text-primary"></i> Mon-Fri: 9:00 AM - 6:00 PM
            </li>
          </ul>
        </div>
      </div>

      <!-- Location -->
      <div class="col-lg-3 col-md-6">
        <div class="ps-lg-5">
          <h5 class="mb-4 fw-normal">Location</h5>
          <address class="text-white-50">
            <i class="fas fa-building me-2 text-primary"></i> TreasureMart Pvt Ltd<br>
            <i class="fas fa-map-marker-alt me-2 text-primary"></i> 123 Business Street<br>
            <i class="fas fa-city me-2 text-primary"></i> Warangal, India 54321
          </address>
        </div>
      </div>

      <!-- Social Media Links -->
      <div class="col-lg-3 col-md-6">
        <div class="ps-lg-5">
          <h5 class="mb-4 fw-normal">Follow Us</h5>
          <div class="d-flex gap-3 icons">
            <a href="#" class="social-icon text-white text-decoration-none">
              <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#" class="social-icon text-white text-decoration-none">
              <i class="fab fa-twitter"></i>
            </a>
            <a href="#" class="social-icon text-white text-decoration-none">
              <i class="fab fa-instagram"></i>
            </a>
            <a href="#" class="social-icon text-white text-decoration-none">
              <i class="fab fa-linkedin-in"></i>
            </a>
            <a href="#" class="social-icon text-white text-decoration-none">
              <i class="fab fa-youtube"></i>
            </a>
          </div>
          <div class="mt-3">
            <small class="text-white-50">Stay updated with our latest offers!</small>
          </div>
        </div>
      </div>

    </div>

    <!-- Divider -->
    <hr class="my-4 border-secondary">

    <!-- Copyright + Social Media (Mobile) -->
    <div class="row align-items-center">
      <div class="col-md-6 col-lg-12 text-lg-center text-md-start text-white-50 pt-2">
        <small>&copy; 2025 TreasureMart. All rights reserved.</small>
      </div>
      <div class="col-md-6 text-center text-md-end pt-2">
        <div class="d-inline-block d-md-none">  <!-- Only visible on mobile -->
          <a href="#" class="text-white me-3"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
          <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
          <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
        </div>
      </div>
    </div>
  </div>
</footer>

<!-- Font Awesome for icons (include in your head tag) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</body>