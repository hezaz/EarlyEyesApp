@php use App\Models\Category; @endphp
@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>User Banners</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">User</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
<div class="row">
<div class="col-md-12">
<div class="card">
  <div class="card-header">

    <div class="card-tools">
      
    </div>
  </div>
  <!-- /.card-header -->
  <div class="card-body table-responsive p-0">    
    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif
    <table class="table table-striped table-valign-middle">
      <thead>
      <tr>
        <th>User Name</th>
        <th>User Email</th>
        <th>Banner</th>
        <th>Banner Description</th>
      </tr>
      </thead>
      <tbody>
      @php $i = 1; @endphp
        @if(!empty($banners) && sizeof($banners) > 0)
            @foreach ($banners as $banner)
                <tr>
                    <td>{{ $banner->user->full_name }}</td>
                    <td>{{ $banner->user->email }}</td>
                    <td>                    
						<img src="{{$banner->image}}" alt="banner" class="img-circle img-size-32 mr-2" style="width: 32px; height: 32px;">
					</td>
                    <td>{{ $banner->description }}</td>
                </tr>
            @endforeach
        @else 
            <tr>
               <td colspan="5">
                   No record found.
                </td>
              
              </tr>
        @endif
      
      </tbody>
  </table>
</div>
{{ $banners->links() }}

@endsection