@extends('crudbooster::admin_template')
@section('content')
    
    <h1 style="text-align: center;padding-top: 10%;">Selamat Datang di Panel Admin</h1>
    
@endsection

@push('bottom')
    <script>
        $(document).ready(function(){
           $('.content-header > h1').html("<i class='fa fa-dashboard'></i> Halaman Awal");
        })
    </script>
@endpush
