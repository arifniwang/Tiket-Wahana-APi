@extends('crudbooster::admin_template')
@section('content')
    <style>
        .box-nominal {
            margin-bottom: 25px;
        }
        
        .btn-nominal {
            width: 100% !important;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        
        .widget-user .widget-user-image > img {
            border: 3px solid #eaeaea;
        }
    </style>
    
    <div class="row">
        <section class="col-lg-6 connectedSortable ui-sortable">
            <!-- Nominal -->
            <div class="box box-solid bg-green-active">
                <div class="box-header ui-sortable-handle" style="cursor: move;">
                    <i class="fa fa-dollar"></i>
                    
                    <h3 class="box-title">Nominal</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="row">
                        <div class="col-sm-4 box-nominal">
                            <button class="btn btn-default btn-nominal" data-nominal="10000">10.000</button>
                        </div>
                        <div class="col-sm-4 box-nominal">
                            <button class="btn btn-default btn-nominal" data-nominal="25000">25.000</button>
                        </div>
                        <div class="col-sm-4 box-nominal">
                            <button class="btn btn-default btn-nominal" data-nominal="50000">50.000</button>
                        </div>
                        <div class="col-sm-4 box-nominal">
                            <button class="btn btn-default btn-nominal" data-nominal="100000">100.000</button>
                        </div>
                        <div class="col-sm-4 box-nominal">
                            <button class="btn btn-default btn-nominal" data-nominal="150000">150.000</button>
                        </div>
                        <div class="col-sm-4 box-nominal">
                            <button class="btn btn-default btn-nominal" data-nominal="200000">200.000</button>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
            
            <!-- Customer -->
            <div class="box box-widget widget-user">
                <!-- Add the bg color to the header using any of the bg-* classes -->
                <div class="widget-user-header bg-green-active">
                    <h3 class="widget-user-username">Alexander Pierce</h3>
                    <h5 class="widget-user-desc">CS190001</h5>
                </div>
                <div class="widget-user-image">
                    <img class="img-circle" src="{{url('vendor/crudbooster/avatar.png')}}" alt="User Avatar">
                </div>
                <div class="box-footer">
                    <div class="row">
                        <div class="col-sm-4 border-right">
                            <div class="description-block">
                                <h5 class="description-header"><a id="phone" href="tel:08123456789">08123456789</a></h5>
                                <span class="description-text">Phone</span>
                            </div>
                            <!-- /.description-block -->
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-4 border-right">
                            <div class="description-block">
                                <h5 class="description-header">13,000</h5>
                                <span class="description-text">Saldo</span>
                            </div>
                            <!-- /.description-block -->
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-4">
                            <div class="description-block">
                                <h5 class="description-header"><a id="email" href="mailto:niwang@crocodic.com">niwang@crocodic.com</a></h5>
                                <span class="description-text">Email</span>
                            </div>
                            <!-- /.description-block -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
            </div>
        </section>
        
        <section class="col-lg-6 connectedSortable ui-sortable">
        
        </section>
    </div>
@endsection

@push('bottom')
    <script>
        $(document).ready(function () {
            $('.sidebar-toggle').click();
        })
    </script>
@endpush
