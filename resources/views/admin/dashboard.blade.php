@extends('admin.layouts.admin')
@section('main-container')
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Dashboard </h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">Dashboard </li>
          </ol>
        </div>
      </div>
    </div>
  </div>
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-5"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Users</span>
                <span class="info-box-number">
                  500
                </span>
              </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-warning elevation-6"><i class="fas fa-user-graduate"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Students</span>
                <span class="info-box-number">
                  300
                </span>
              </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-success elevation-7"><i class="fas fa-chalkboard-teacher"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Tutors</span>
                <span class="info-box-number">
                  200
                </span>
              </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-danger elevation-8"><i class="fas fa-question-circle"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Quiz</span>
                <span class="info-box-number">
                  700
                </span>
              </div>
            </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-4"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Active Users</span>
                <span class="info-box-number">
                  200
                </span>
              </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users-slash"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Deactive Users</span>
                <span class="info-box-number">
                  300
                </span>
              </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-success elevation-2"><i class="fas fa-graduation-cap"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Courses</span>
                <span class="info-box-number">
                  10
                </span>
              </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-danger elevation-3"><i class="fas fa-sliders-h"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Banners</span>
                <span class="info-box-number">
                  6
                </span>
              </div>
            </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">User Registaration</h3>
                  <a href="javascript:void(0);">View All</a>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                  <p class="d-flex flex-column">
                    <span class="text-bold text-lg">300</span>
                    <span>Active Registations</span>
                  </p>
                  <p class="ml-auto d-flex flex-column text-right">
                    <span class="text-success">
                      <i class="fas fa-arrow-up"></i> 12.5%
                    </span>
                    <span class="text-muted">Since last week</span>
                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4">
                  <canvas id="visitors-chart" height="200"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                  <span class="mr-2">
                    <i class="fas fa-square text-primary"></i> This Week
                  </span>

                  <span>
                    <i class="fas fa-square text-gray"></i> Last Week
                  </span>
                </div>
              </div>
            </div>
            <!-- /.card -->

            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">Courses</h3>
                <div class="card-tools">
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-download"></i>
                  </a>
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>
                  </a>
                </div>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-striped table-valign-middle">
                  <thead>
                  <tr>
                    <th>Course Id</th>
                    <th>Course Name</th>
                    <th>Subject</th>
                    <th>Course Code</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>                      
                      C12
                    </td>
                    <td>Course 1</td>
                    <td>
                     Math
                    </td>
                    <td>
                      CC
                    </td>
                  </tr>
                  <tr>
                    <td>                      
                      C12
                    </td>
                    <td>Course 1</td>
                    <td>
                     Math
                    </td>
                    <td>
                      CC
                    </td>
                  </tr>
                  <tr>
                    <td>                      
                      C12
                    </td>
                    <td>Course 1</td>
                    <td>
                     Math
                    </td>
                    <td>
                      CC
                    </td>
                  </tr>
                  <tr>
                    <td>                      
                      C12
                    </td>
                    <td>Course 1</td>
                    <td>
                     Math
                    </td>
                    <td>
                      CC
                    </td>
                  </tr>
                  <tr>
                    <td>                      
                      C12
                    </td>
                    <td>Course 1</td>
                    <td>
                     Math
                    </td>
                    <td>
                      CC
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">Users Type & Status</h3>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                  <div class="col-md-8">
                    <div class="chart-responsive">
                      <canvas id="pieChart" height="150"></canvas>
                    </div>
                    <!-- ./chart-responsive -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-4">
                    <ul class="chart-legend clearfix">
                      <li><i class="far fa-circle text-success"></i> Active Users</li>
                      <li><i class="far fa-circle text-danger"></i> Inactive Users</li>
                      <li><i class="far fa-circle text-info"></i> Tutor</li>
                      <li><i class="far fa-circle text-primary"></i> Student</li>
                      <li><i class="far fa-circle text-secondary"></i> Parent</li>
                    </ul>
                  </div>
                </div>
                <!-- /.d-flex -->

               
              </div>
            </div>
            <!-- /.card -->

            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">User Registration Overview</h3>
                <div class="card-tools">
                  <a href="#" class="btn btn-sm btn-tool">
                    <i class="fas fa-download"></i>
                  </a>
                  <a href="#" class="btn btn-sm btn-tool">
                    <i class="fas fa-bars"></i>
                  </a>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-success text-xl">
                    <i class="ion ion-ios-refresh-empty"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                      <i class="ion ion-android-arrow-up text-success"></i> 5
                    </span>
                    <span class="text-muted">Today</span>
                  </p>
                </div>
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-success text-xl">
                    <i class="ion ion-ios-refresh-empty"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                      <i class="ion ion-android-arrow-up text-success"></i> 5
                    </span>
                    <span class="text-muted">This Week</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-warning text-xl">
                    <i class="ion ion-ios-refresh-empty"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                      <i class="ion ion-android-arrow-up text-warning"></i> 20
                    </span>
                    <span class="text-muted">This Month</span>
                  </p>
                </div>               
              </div>
            </div>
          </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>

  <section class="content">
    <div class="container-fluid">
      <div class="row">
          <!-- Left col -->
          <div class="col-md-8">           
            <div class="row">  
              <div class="col-md-12">
                <!-- USERS LIST -->
                <div class="card">
                  <div class="card-header">
                    <h3 class="card-title">Latest Users</h3>

                    <div class="card-tools">
                      <span class="badge badge-danger">8 New Users</span>
                      <button type="button" class="btn btn-tool" data-card-widget="collapse">
                        <i class="fas fa-minus"></i>
                      </button>
                      <button type="button" class="btn btn-tool" data-card-widget="remove">
                        <i class="fas fa-times"></i>
                      </button>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body p-0">
                    <ul class="users-list clearfix">
                      <li>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">John Doe</a>
                        <span class="users-list-date">Student</span>
                      </li>
                      <li>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">John Doe</a>
                        <span class="users-list-date">Student</span>
                      </li>
                      <li>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">John Doe</a>
                        <span class="users-list-date">Tutor</span>
                      </li>
                      <li>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">John Doe</a>
                        <span class="users-list-date">Parent</span>
                      </li>
                      <li>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">John Doe</a>
                        <span class="users-list-date">Tutor</span>
                      </li>
                      <li>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">John Doe</a>
                        <span class="users-list-date">Student</span>
                      </li>
                      <li>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">John Doe</a>
                        <span class="users-list-date">Student</span>
                      </li>
                      <li>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image">
                        <a class="users-list-name" href="#">John Doe</a>
                        <span class="users-list-date">Student</span>
                      </li>
                    </ul>
                    <!-- /.users-list -->
                  </div>
                  <!-- /.card-body -->
                  <div class="card-footer text-center">
                    <a href="javascript:">View All Users</a>
                  </div>
                  <!-- /.card-footer -->
                </div>
                <!--/.card -->
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->

            <!-- TABLE: LATEST ORDERS -->
            <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Latest Student Registration</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <div class="table-responsive">
                  <table class="table m-0">
                    <thead>
                    <tr>
                      <th>Student ID</th>
                      <th>Student Name</th>
                      <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image" class="img-circle" width="50px">S1</td>
                      <td>John Doe</td>
                      <td><span class="badge badge-success">Active</span></td>                     
                    </tr>  <tr>
                      <td>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image" class="img-circle" width="50px">S1</td>
                      <td>John Doe</td>
                      <td><span class="badge badge-success">Active</span></td>                     
                    </tr>  <tr>
                      <td>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image" class="img-circle" width="50px">S1</td>
                      <td>John Doe</td>
                      <td><span class="badge badge-success">Active</span></td>                     
                    </tr>  <tr>
                      <td>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image" class="img-circle" width="50px">S1</td>
                      <td>John Doe</td>
                      <td><span class="badge badge-success">Active</span></td>                     
                    </tr>  <tr>
                      <td>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image" class="img-circle" width="50px">S1</td>
                      <td>John Doe</td>
                      <td><span class="badge badge-success">Active</span></td>                     
                    </tr>  <tr>
                      <td>
                        <img src="{{$_ENV['PUBLIC_URL']}}images/user7-128x128.jpg" alt="User Image" class="img-circle" width="50px">S1</td>
                      <td>John Doe</td>
                      <td><span class="badge badge-danger">Inactive</span></td>                     
                    </tr> 
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">View All Students</a>
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->

          <div class="col-md-4">  
           
            <!-- Course LIST -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Recently Added Courses</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <ul class="products-list product-list-in-card pl-2 pr-2">
                  <li class="item">                    
                    <div class="product-info">
                      <a href="javascript:void(0)" class="product-title">Course 1
                        <span class="badge badge-warning float-right">C124</span></a>
                      <span class="product-description">
                        CC
                      </span>
                    </div>
                  </li>    <li class="item">                    
                    <div class="product-info">
                      <a href="javascript:void(0)" class="product-title">Course 1
                        <span class="badge badge-warning float-right">C124</span></a>
                      <span class="product-description">
                        CC
                      </span>
                    </div>
                  </li>    <li class="item">                    
                    <div class="product-info">
                      <a href="javascript:void(0)" class="product-title">Course 1
                        <span class="badge badge-warning float-right">C124</span></a>
                      <span class="product-description">
                        CC
                      </span>
                    </div>
                  </li>    <li class="item">                    
                    <div class="product-info">
                      <a href="javascript:void(0)" class="product-title">Course 1
                        <span class="badge badge-warning float-right">C124</span></a>
                      <span class="product-description">
                        CC
                      </span>
                    </div>
                  </li>    <li class="item">                    
                    <div class="product-info">
                      <a href="javascript:void(0)" class="product-title">Course 1
                        <span class="badge badge-warning float-right">C124</span></a>
                      <span class="product-description">
                        CC
                      </span>
                    </div>
                  </li>    
                         
                </ul>
              </div>
              <!-- /.card-body -->
              <div class="card-footer text-center">
                <a href="javascript:void(0)" class="uppercase">View All Courses</a>
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
    </div>
  </section>
</div> 
   
@endsection