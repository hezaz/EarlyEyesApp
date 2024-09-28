<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{$title}}</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{$_ENV['PUBLIC_URL']}}plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{{$_ENV['PUBLIC_URL']}}plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{$_ENV['PUBLIC_URL']}}dist/css/adminlte.css">
  <style>
    button.btn.btn-primary {
      margin-top: 35px;
      padding: 11px;
      border-radius: 21px;
  }
    span.input-group-text.password-toggle {
      color: #1976D2;
  }
    .input-group-text {     
      height: 45px !important;
  }
    .form-control {
        border: 1px solid #1976D2;
        padding: 22px !important;
        margin-bottom: 30px !important;
    }
    .login-page {
        background-color: #fff !important;
    }
    body.login-page {
        overflow: hidden;
    }
    .left-bar{background: #1976D2;}
    .left-img-box {
        text-align: center;
    }
    .left-img-box img {
        width: 67%;
    }
    .login-content {
        color: #fff;
        text-align: center;
        font-size: 25px;
    }
    .password-toggle {
      cursor: pointer;
    }
    .card {
        background: #1976D2 !important;
        border: none !important;
        box-shadow: none !important;
    }
    .card-header {
        border: none !important;
    }
    label {
        color: #fff !important;
    }
    .input-group-text {
        background-color: #fff !important;
        border: 1px solid #fff !important;
        color: #8F8F8F;
    }
   
    .btn-primary, .btn-primary:hover {
        color: #1976D2;
        background-color: #fff;
        border-color: #fff;
        font-weight: 600;
        width: 100%;
        border-radius: 121px;
    }
    .col-md-8.right-bar {
        background: #fff;
        height: 920px;
    }
    
    body {
        overflow: hidden !important;
        background: #1976D2;
    }
    .img-box img.img-fluid {
        position: absolute;
        top: 110px;
        left: 276px;
    }
    .img-box {
        position: relative;
    }
    .login-bx {
      position: relative;
      top: -63px;
  }

  </style>
</head>
<body class="hold-transition">
      <div class="row login-container">
      <div class="col-md-4 left-bar">
          <div class="left-img-box">
              <img src="{{$_ENV['PUBLIC_URL']}}images/login-logo.png" />
          </div>
          <div class="container login-bx">
              <div class="row justify-content-center">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header login-content">
                      Log in
                    </div>
                    <div class="card-body">
                        @if(\Session::get('success'))
                          <div class="alert alert-success alert-dismissible fade show" role="alert">
                              <div class="alert-body">
                                  {{ \Session::get('success') }}
                              </div>
                          </div>
                          @endif
                          {{ \Session::forget('success') }}
                          @if(\Session::get('error'))
                          <div class="alert alert-danger alert-dismissible fade show" role="alert">
                              <div class="alert-body">
                                  {{ \Session::get('error') }}
                              </div>
                          </div>
                          @endif
                      <form action="{{route('adminLoginPost')}}" method="post">
                        @csrf
                        <div class="form-group">
                          <input type="email" class="form-control" id="username" name="email" placeholder="Email" autocomplete="false" required>
                        </div>
                        @if($errors->has('email'))
                          <span class="help-block font-red-mint">
                              <strong>{{ $errors->first('email') }}</strong>
                          </span>
                        @endif
                        <div class="form-group">
                          <div class="input-group">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" autocomplete="false" required>
                            <div class="input-group-append">
                              <span class="input-group-text password-toggle"><i class="fas fa-eye"></i></span>
                            </div>
                          </div>
                          @if ($errors->has('password'))
                              <span class="help-block font-red-mint">
                                  <strong>{{ $errors->first('password') }}</strong>
                              </span>
                          @endif
                        </div>
                        <button type="submit" class="btn btn-primary">Log In</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>

      </div>
      <div class="col-md-8 right-bar">
          <div class="img-box">
              <img src="{{$_ENV['PUBLIC_URL']}}images/Illustration.png" class="img-fluid" />
          </div>
      </div>
  </div>

<!-- jQuery -->
<script src="{{$_ENV['PUBLIC_URL']}}plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="{{$_ENV['PUBLIC_URL']}}plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="{{$_ENV['PUBLIC_URL']}}dist/js/adminlte.min.js"></script>
<script>
  $(document).ready(function() {
    $('.password-toggle').click(function() {
      const passwordInput = $('#password');
      const icon = $(this).find('i');

      if (passwordInput.attr('type') === 'password') {
        passwordInput.attr('type', 'text');
        icon.removeClass('fa-eye').addClass('fa-eye-slash');
      } else {
        passwordInput.attr('type', 'password');
        icon.removeClass('fa-eye-slash').addClass('fa-eye');
      }
    });
  });
</script>
</body>
</html>
