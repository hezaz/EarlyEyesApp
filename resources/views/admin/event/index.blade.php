@php use App\Models\Category; @endphp
@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Events</h1>
      </div>
      <div class="col-sm-6">
       
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
<div class="row">
<div class="col-md-12">
<div class="card">
  <div class="card-header">
    
      <a href="{{route('addEvent')}}"><button class="btn btn-primary add-course" data-toggle="tooltip" data-placement="top" title="Add Event"><i class="fas fa-plus"></i></button></a>

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
        <th>Event Image</th>
        <th>Event Name</th>
        <th>Url</th>        
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
        @php $i = 1; @endphp
        @if(!empty($events))
          @foreach($events as $event)
            <tr>
              <td>
                  @if($event->image != '')
                    <img src="{{$event->image}}" alt="event" class="img-circle img-size-32 mr-2" style="width: 32px; height: 32px;">
                  @endif
              </td>
              <td>{{ucwords($event->event_name)}}</td>
              <td><a href="{{$event->event_url}}">{{$event->event_url}}</a></td>              
      			  <td>
      			      <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ...
                  </button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                    <a class="dropdown-item text-info" href="{{url('admin/event/edit/'.$event->id)}}">Edit</a>
                    <form action="{{ route('delete.event') }}" method="POST" onsubmit="return confirmDelete()">
                      @csrf
                      <input type="hidden" name="id" value="{{ $event['id'] }}" />
                      <button type="submit" class="btn dlt" title="Delete Event">
                        Delete
                      </button>
                    </form>
                  </div>
                </div>
      			  </td>
            </tr>
             <tr><td colspan="4"></td></tr>
         @endforeach
         @endif
      </tbody>
  </table>
</div>


<script>
function confirmDelete() {
  return confirm('Are you sure you want to delete this event?');
}
</script>

@endsection