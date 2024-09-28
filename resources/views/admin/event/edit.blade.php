@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Edit Event</h1>
      </div>
      <div class="col-sm-6">
      </div>
    </div>
  </div>
</section>
<section class="content form-placeholder">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-8">
        <div class="card card-primary">
          @if ($errors->any())
            <div class="alert alert-danger">
                There were some problems with your input.<br><br>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
          @endif
          <form id="event-form" action="{{ route('update.events', $event->id) }}" method="post" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="event_name">Event Name <span style="color: red;">*</span></label>
                    <input type="text" name="event_name" class="form-control" id="event_name" placeholder="Event Title" value="{{ old('event_name', $event->event_name) }}" >
                  </div> 
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="event_url">Event URL <span style="color: red;">*</span></label>
                    <input type="text" name="event_url" class="form-control" id="event_url" placeholder="Event URL" value="{{ old('event_url', $event->event_url) }}" >
                  </div> 
                </div> 
              </div>                 
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label>Event Thumbnail <span style="color: red;">*</span></label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="event_thumbnail" name="image">
                        <label class="custom-file-label" for="event_thumbnail">Choose file</label>
                      </div>
                    </div>
                    @if($event->image)
                      <img src="{{ $event->image }}" alt="Event Image" class="img-thumbnail mt-2" width="150">
                    @endif
                  </div> 
                </div>
              </div>    
              <div class="button-group">
                <button type="submit" class="btn btn-primary">Update Event</button>
                <a href="{{ url('admin/events') }}">
                  <button type="button" class="btn btn-default">Cancel</button>
                </a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
@endsection
