<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Early Eyes | Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="align-items-center justify-content-center row m-0 vh-100">
        <form action="{{ route('update.reseted.password', $token) }}" class="col-12 col-lg-4 col-md-6 p-4"
            method="POST">
            @csrf
            <h2 class="text-center">Reset Password</h2>
            <p class="text-center">Enter new password and then repeat it</p>
            <div class="mb-3">
                <label class="form-label" for="new_password">New Password:</label>
                <input class="form-control" type="password" id="new_password" name="new_password">
                @error('new_password')
                    <span class="text-danger" style="font-size:14px;">{{ $message }}</span>
                @enderror
            </div>
            <div class="mb-3">
                <label class="form-label" for="repeat_password">Repeat Password:</label>
                <input class="form-control" type="password" id="repeat_password" name="repeat_password">
                @error('repeat_password')
                    <span class="text-danger" style="font-size:14px;">{{ $message }}</span>
                @enderror
            </div>
            <button type="submit" class="btn btn-primary w-100">Update</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
