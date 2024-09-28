 <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{url('admin/dashboard')}}" class="brand-link">
        <img src="{{$_ENV['PUBLIC_URL']}}images/logo.png" Alt="YOoKOo Logo" class="brand-image img ArcleYOoKOoon-3" style="opacity: .8">
        <!--<span class="brand-text font-weight-light">YOoKOo</span>-->
    </a>

    <!-- Sidebar -->
    <div class="sidebar">     
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        
          <li class="nav-item menu-open">
            <a href="{{url('admin/dashboard')}}" class="nav-link @if(Request::segment(2) == 'dashboard') active @endif">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Home
              </p>
            </a>           
          </li>         
         <li class="nav-item">
            <a href="{{url('admin/users')}}" class="nav-link  @if(Request::segment(2) == 'users') active @endif">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Users
              </p>
              <i class="right fas fa-angle-left"></i>
            </a> 
            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="{{url('admin/users/all')}}" class="nav-link @if(Request::segment(3) == 'all' && Request::segment(2) == 'users') active @endif">
                        <i class="far fa-circle nav-icon"></i>
                        <p>All Users</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{url('admin/users/tutor')}}" class="nav-link @if(Request::segment(3) == 'tutor' && Request::segment(2) == 'users') active @endif">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Tutor</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{url('admin/users/student')}}" class="nav-link @if(Request::segment(3) == 'student' && Request::segment(2) == 'users') active @endif">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Student</p>
                    </a>
                </li>
                <li class="nav-item">
                     <a href="{{url('admin/users/parent')}}" class="nav-link @if(Request::segment(3) == 'parent' && Request::segment(2) == 'users') active @endif">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Parent</p>
                    </a>
                </li>
            </ul>          
          </li>  

          <li class="nav-item">
            <a href="{{url('admin/block-users')}}" class="nav-link  @if(Request::segment(2) == 'block-users') active @endif">
              <i class="nav-icon fas fa-users-slash"></i>
              <p>
                Block Users
              </p>
              <i class="right fas fa-angle-left"></i>
            </a> 
            <ul class="nav nav-treeview">
                <li class="nav-item">
                    <a href="{{url('admin/block-users/all')}}" class="nav-link @if(Request::segment(3) == 'all' && Request::segment(2) == 'block-users') active @endif">
                        <i class="far fa-circle nav-icon"></i>
                        <p>All Users</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{url('admin/block-users/tutor')}}" class="nav-link @if(Request::segment(3) == 'tutor' && Request::segment(2) == 'block-users') active @endif">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Tutor</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{url('admin/block-users/student')}}" class="nav-link @if(Request::segment(3) == 'student' && Request::segment(2) == 'block-users') active @endif">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Student</p>
                    </a>
                </li>
                <li class="nav-item">
                     <a href="{{url('admin/block-users/parent')}}" class="nav-link @if(Request::segment(3) == 'parent' && Request::segment(2) == 'block-users') active @endif">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Parent</p>
                    </a>
                </li>
            </ul>          
          </li> 
          <li class="nav-item menu-open">
            <a href="{{url('admin/courses')}}" class="nav-link  @if(Request::segment(2) == 'courses' || (Request::segment(2) == 'courses' && Request::segment(3) == 'add')) active @endif">
              <i class="nav-icon fab fa-discourse"></i>
              <p>
                 Courses
              </p>
            </a>           
          </li>
          <li class="nav-item menu-open">
            <a href="{{url('admin/quiz')}}" class="nav-link  @if(Request::segment(2) == 'quiz' || (Request::segment(2) == 'quiz'  && Request::segment(3)) == 'add') active @endif">
              <i class="nav-icon fas fa-question"></i>
              <p>
                Quiz
              </p>
            </a>     
            </li>   
          
              <li class="nav-item menu-open">
                <a href="{{url('admin/events')}}" class="nav-link @if(Request::segment(2) == 'events') active @endif">
                  <i class="nav-icon fas fa-newspaper"></i>
                  <p>
                    Event
                  </p>
                </a>           
              </li>  
              
              <li class="nav-item menu-open">
                <a href="{{url('admin/contacts')}}" class="nav-link @if(Request::segment(2) == 'contacts') active @endif">
				  <i class="nav-icon fas fa-id-badge"></i>
                  <p>
                    Help & Support
                  </p>
                </a>           
              </li>  
			  <li class="nav-item menu-open">
                <a href="{{url('admin/user-banners')}}" class="nav-link @if(Request::segment(2) == 'user-banners') active @endif">
				  <i class="nav-icon fas fa-image"></i>
                  <p>
                    User Banners
                  </p>
                </a>           
              </li>   
              <li class="nav-item menu-open">
                <a href="{{url('admin/login')}}" class="nav-link">
                  <i class="nav-icon fas fa-power-off"></i>
                  <p>
                    Logout
                  </p>
                </a>           
              </li>    
           
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>