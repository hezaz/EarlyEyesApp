@include('admin.layouts.header')
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed inner-b">
	<div class="wrapper">
		@include('admin.layouts.sidebar')
		<div class="content-wrapper">
			@yield('main-container')
		</div>
	</div>
</body>
@include('admin.layouts.footer')
