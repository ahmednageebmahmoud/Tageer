<?php
include 'header.php';
?>

<!-- ======= Main Search ======= -->
<div class="main-search">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6">
                <form class="">
                    <div class="form-group">
                        <input type="search" class="form-control" id="main-search" placeholder="ابحث هنا فى تأجير">
                        <button class="btn btn-primary"><i class="icon fa fa-search"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="clearfix"></div>

<!-- ======= Main Content ======= -->
<section class="main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 sidebar">
                <div class="filter-sidebar">
                    <form>
                        <fieldset>
                            <select name="slect-1" id="slect-1">
                                <option>حدد القسم</option>
                                <option>اسم القسم ما</option>
                                <option>اسم القسم ما</option>
                                <option>اسم القسم ما</option>
                                <option>اسم القسم ما</option>
                                <option>اسم القسم ما</option>
                            </select>
                        </fieldset>
                        <hr>
                        <fieldset>
                            <select name="slect-2" id="slect-2">
                                <option selected="selected">للشخص - شامل الضرائب والرسوم</option>
                                <option>اجمالى السعر - شامل الضرائب والرسوم</option>
                            </select>
                        </fieldset>
                        <hr>
                        <fieldset>
                            <select name="slect-3" id="slect-3">
                                <option>المنطقة / المدينة</option>
                                <option>منطقة</option>
                                <option>منطقة</option>
                                <option>منطقة</option>
                                <option>منطقة</option>
                            </select>
                        </fieldset>
                        <hr>
                        <fieldset>
                            <select name="slect-4" id="slect-4">
                                <option>الحى</option>
                                <option>حى</option>
                                <option>حى</option>
                                <option>حى</option>
                                <option>حى</option>
                            </select>
                        </fieldset>
                        <!-- <div data-role="rangeslider overflow-hidden">
                          Price Range
                        </div> -->
                        <div class="rate-sidebar">
                            <div class="checkbox pull-right">
                                <label>
                                    <input type="checkbox"> التقييم
                                </label>
                            </div>
                            <div class="rate-stars pull-left">
                                <ul class="list-inline list-unstyled rate-stars">
                                    <li><i class="icon fa fa-star"></i></li>
                                    <li><i class="icon fa fa-star"></i></li>
                                    <li><i class="icon far fa-star"></i></li>
                                    <li><i class="icon far fa-star"></i></li>
                                    <li><i class="icon far fa-star"></i></li>
                                </ul>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">بحث</button>
                    </form>
                </div>
                <a href="#" class="sidebar-ads-photo"><img src="http://via.placeholder.com/250x300" alt="ads"/></a>
                <a href="#" class="sidebar-ads-photo"><img src="http://via.placeholder.com/250x300" alt="ads"/></a>
            </div>
            <div class="col-sm-9 all-posts">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="sort-posts overflow-hidden">
                            <ul class="list-inline list-unstyled pull-right">
                                <li><a role="button" class="active"><i class="icon fa fa-sort-amount-desc ml-10"></i>الاعلى
                                        سعرا</a></li>
                                <li><a role="button"><i class="icon fa fa-sort-amount-asc ml-10"></i>الاقل سعرا</a></li>
                                <li><a role="button"><i class="icon fa fa-flash ml-10"></i>الأحدث</a></li>
                            </ul>
                            <ul class="list-inline list-unstyled pull-left post-view-types">
                                <li class=""><a role="button" class="active list-view"><i class="fa fa-list-ul"></i></a></li>
                                <li class="hidden-xs hidden-sm"><a role="button" class="th-view"><i class="fa fa-th"></i></a></li>
                                <li><a role="button" class="map-view"><i class="fa fa-map-marker"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-sm-12 post post-width post-main-tab post-show">
                        <div class="row">
                            <div class="post-img col-sm-3 relative">
                                <a role="button" class="post-like" data-like="true"><i
                                            class="icon fa active fa-heart ml-10"></i><span>888</span></a>
                                <div id="post-1" class="carousel slide" data-ride="carousel">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner" role="listbox">
                                        <div class="item">
                                            <img src="assets/images/post/photos/p-2-1.jpg" alt="img-1"
                                                 class="img-responsive"/>
                                        </div>
                                        <div class="item active">
                                            <img src="assets/images/post/photos/p-2-2.jpg" alt="img-2"
                                                 class="img-responsive"/>
                                        </div>
                                        <div class="item">
                                            <img src="assets/images/post/photos/p-2-3.jpg" alt="img-1"
                                                 class="img-responsive"/>
                                        </div>
                                    </div>
                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#post-1" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#post-1" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-9  post-body">
                                <div class="post-head">
                                    <ul class="list-instyled list-inline pull-right">
                                        <li>
                                            <i class="icon fa fa-clock"></i>قبل ساعتين
                                        </li>
                                        <li>
                                            <i class="icon fa fa-clock"></i>رقم الاعلان: ١٢٣٤٥
                                        </li>
                                    </ul>
                                    <ul class="list-instyled list-inline pull-left">
                                        <li>
                                            <i class="icon fa fa-map-marker"></i>جدة
                                        </li>
                                        <li>
                                            <i class="icon fa fa-comments"></i>12
                                        </li>
                                        <li>
                                            <a href="profile.php"><i class="icon fa fa-user"></i>فلان الفلاني</a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                    <a class="" href="single-product.php">سيارة مرسيدس للبيع</a>
                                </div>
                                <div class="post-price-head">
                                    <h1 class="main-color"><b>34,566 ريال</b></h1>
                                    <a href="#" class="btn btn-primary more-info">اظهر التفاصيل</a>
                                </div>
                                <div class="clearfix"></div>
                                <div class="post-footer text-center">
                                    <div class="row">
                                        <div class="col-xs-2">
                                            <img src="assets/images/post/icons/car-seat.png" alt="car seat"
                                                 class="post-footer-icon"/> 4
                                        </div>
                                        <div class="col-xs-2">
                                            <img src="assets/images/post/icons/car-door.png" alt="car seat"
                                                 class="post-footer-icon"/> 4
                                        </div>
                                        <div class="col-xs-4">
                                            <img src="assets/images/post/icons/automatic-brightness.png" alt="car seat"
                                                 class="post-footer-icon"/>اتوماتيك
                                        </div>
                                        <div class="col-xs-4">
                                            <img src="assets/images/post/icons/minisplit.png" alt="car seat"
                                                 class="post-footer-icon"/>مكيف
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-sm-12 text-center more-posts-display">
                        <button type="button" class="btn btn-primary more-posts">المزيد</button>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-sm-6 col-md-8 map-display">
                        <div id="map_wrapper">
                            <div id="map_canvas" class="mapping"></div>
                        </div>
                    </div>
                    <div class="ads-left-map map-display col-sm-6 col-md-4">
                        <div class="post post-width post-main-tab">
                            <div class="row">
                                <div class="post-img col-sm-3 relative">
                                    <a role="button" class="post-like" data-like="true"><i
                                                class="icon fa active fa-heart ml-10"></i><span>888</span></a>
                                    <div id="post-1" class="carousel slide" data-ride="carousel">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-1.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item active">
                                                <img src="assets/images/post/photos/p-2-2.jpg" alt="img-2"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-3.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#post-1" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#post-1" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-9  post-body">
                                    <div class="post-head">
                                        <ul class="list-instyled list-inline">
                                            <li>
                                                <i class="icon fa fa-map-marker"></i>جدة
                                            </li>
                                            <li>
                                                <i class="icon fa fa-comments"></i>12
                                            </li>
                                            <li>
                                                <a href="profile.php"><i class="icon fa fa-user"></i>فلان الفلاني</a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                        <a class="" href="single-product.php">سيارة مرسيدس للبيع</a>
                                    </div>
                                    <div class="post-price-head">
                                        <h1 class="main-color"><b>34,566 ريال</b></h1>
                                        <a href="#" class="btn btn-primary more-info">اظهر التفاصيل</a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="post-footer text-center">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-seat.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-door.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/automatic-brightness.png" alt="car seat"
                                                     class="post-footer-icon"/>اتوماتيك
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/minisplit.png" alt="car seat"
                                                     class="post-footer-icon"/>مكيف
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="post post-width post-main-tab">
                            <div class="row">
                                <div class="post-img col-sm-3 relative">
                                    <a role="button" class="post-like" data-like="true"><i
                                                class="icon fa active fa-heart ml-10"></i><span>888</span></a>
                                    <div id="post-1" class="carousel slide" data-ride="carousel">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-1.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item active">
                                                <img src="assets/images/post/photos/p-2-2.jpg" alt="img-2"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-3.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#post-1" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#post-1" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-9  post-body">
                                    <div class="post-head">
                                        <ul class="list-instyled list-inline">
                                            <li>
                                                <i class="icon fa fa-map-marker"></i>جدة
                                            </li>
                                            <li>
                                                <i class="icon fa fa-comments"></i>12
                                            </li>
                                            <li>
                                                <a href="profile.php"><i class="icon fa fa-user"></i>فلان الفلاني</a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                        <a class="" href="single-product.php">سيارة مرسيدس للبيع</a>
                                    </div>
                                    <div class="post-price-head">
                                        <h1 class="main-color"><b>34,566 ريال</b></h1>
                                        <a href="#" class="btn btn-primary more-info">اظهر التفاصيل</a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="post-footer text-center">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-seat.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-door.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/automatic-brightness.png" alt="car seat"
                                                     class="post-footer-icon"/>اتوماتيك
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/minisplit.png" alt="car seat"
                                                     class="post-footer-icon"/>مكيف
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="post post-width post-main-tab">
                            <div class="row">
                                <div class="post-img col-sm-3 relative">
                                    <a role="button" class="post-like" data-like="true"><i
                                                class="icon fa active fa-heart ml-10"></i><span>888</span></a>
                                    <div id="post-1" class="carousel slide" data-ride="carousel">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-1.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item active">
                                                <img src="assets/images/post/photos/p-2-2.jpg" alt="img-2"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-3.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#post-1" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#post-1" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-9  post-body">
                                    <div class="post-head">
                                        <ul class="list-instyled list-inline">
                                            <li>
                                                <i class="icon fa fa-map-marker"></i>جدة
                                            </li>
                                            <li>
                                                <i class="icon fa fa-comments"></i>12
                                            </li>
                                            <li>
                                                <a href="profile.php"><i class="icon fa fa-user"></i>فلان الفلاني</a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                        <a class="" href="single-product.php">سيارة مرسيدس للبيع</a>
                                    </div>
                                    <div class="post-price-head">
                                        <h1 class="main-color"><b>34,566 ريال</b></h1>
                                        <a href="#" class="btn btn-primary more-info">اظهر التفاصيل</a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="post-footer text-center">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-seat.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-door.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/automatic-brightness.png" alt="car seat"
                                                     class="post-footer-icon"/>اتوماتيك
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/minisplit.png" alt="car seat"
                                                     class="post-footer-icon"/>مكيف
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="post post-width post-main-tab">
                            <div class="row">
                                <div class="post-img col-sm-3 relative">
                                    <a role="button" class="post-like" data-like="true"><i
                                                class="icon fa active fa-heart ml-10"></i><span>888</span></a>
                                    <div id="post-1" class="carousel slide" data-ride="carousel">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-1.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item active">
                                                <img src="assets/images/post/photos/p-2-2.jpg" alt="img-2"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-3.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#post-1" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#post-1" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-9  post-body">
                                    <div class="post-head">
                                        <ul class="list-instyled list-inline">
                                            <li>
                                                <i class="icon fa fa-map-marker"></i>جدة
                                            </li>
                                            <li>
                                                <i class="icon fa fa-comments"></i>12
                                            </li>
                                            <li>
                                                <a href="profile.php"><i class="icon fa fa-user"></i>فلان الفلاني</a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                        <a class="" href="single-product.php">سيارة مرسيدس للبيع</a>
                                    </div>
                                    <div class="post-price-head">
                                        <h1 class="main-color"><b>34,566 ريال</b></h1>
                                        <a href="#" class="btn btn-primary more-info">اظهر التفاصيل</a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="post-footer text-center">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-seat.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-door.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/automatic-brightness.png" alt="car seat"
                                                     class="post-footer-icon"/>اتوماتيك
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/minisplit.png" alt="car seat"
                                                     class="post-footer-icon"/>مكيف
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="post post-width post-main-tab">
                            <div class="row">
                                <div class="post-img col-sm-3 relative">
                                    <a role="button" class="post-like" data-like="true"><i
                                                class="icon fa active fa-heart ml-10"></i><span>888</span></a>
                                    <div id="post-1" class="carousel slide" data-ride="carousel">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-1.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item active">
                                                <img src="assets/images/post/photos/p-2-2.jpg" alt="img-2"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-3.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#post-1" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#post-1" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-9  post-body">
                                    <div class="post-head">
                                        <ul class="list-instyled list-inline">
                                            <li>
                                                <i class="icon fa fa-map-marker"></i>جدة
                                            </li>
                                            <li>
                                                <i class="icon fa fa-comments"></i>12
                                            </li>
                                            <li>
                                                <a href="profile.php"><i class="icon fa fa-user"></i>فلان الفلاني</a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                        <a class="" href="single-product.php">سيارة مرسيدس للبيع</a>
                                    </div>
                                    <div class="post-price-head">
                                        <h1 class="main-color"><b>34,566 ريال</b></h1>
                                        <a href="#" class="btn btn-primary more-info">اظهر التفاصيل</a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="post-footer text-center">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-seat.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-door.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/automatic-brightness.png" alt="car seat"
                                                     class="post-footer-icon"/>اتوماتيك
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/minisplit.png" alt="car seat"
                                                     class="post-footer-icon"/>مكيف
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="post post-width post-main-tab">
                            <div class="row">
                                <div class="post-img col-sm-3 relative">
                                    <a role="button" class="post-like" data-like="true"><i
                                                class="icon fa active fa-heart ml-10"></i><span>888</span></a>
                                    <div id="post-1" class="carousel slide" data-ride="carousel">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-1.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item active">
                                                <img src="assets/images/post/photos/p-2-2.jpg" alt="img-2"
                                                     class="img-responsive"/>
                                            </div>
                                            <div class="item">
                                                <img src="assets/images/post/photos/p-2-3.jpg" alt="img-1"
                                                     class="img-responsive"/>
                                            </div>
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#post-1" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="right carousel-control" href="#post-1" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-9  post-body">
                                    <div class="post-head">
                                        <ul class="list-instyled list-inline">
                                            <li>
                                                <i class="icon fa fa-map-marker"></i>جدة
                                            </li>
                                            <li>
                                                <i class="icon fa fa-comments"></i>12
                                            </li>
                                            <li>
                                                <a href="profile.php"><i class="icon fa fa-user"></i>فلان الفلاني</a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                        <a class="" href="single-product.php">سيارة مرسيدس للبيع</a>
                                    </div>
                                    <div class="post-price-head">
                                        <h1 class="main-color"><b>34,566 ريال</b></h1>
                                        <a href="#" class="btn btn-primary more-info">اظهر التفاصيل</a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="post-footer text-center">
                                        <div class="row">
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-seat.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-2">
                                                <img src="assets/images/post/icons/car-door.png" alt="car seat"
                                                     class="post-footer-icon"/> 4
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/automatic-brightness.png" alt="car seat"
                                                     class="post-footer-icon"/>اتوماتيك
                                            </div>
                                            <div class="col-xs-4">
                                                <img src="assets/images/post/icons/minisplit.png" alt="car seat"
                                                     class="post-footer-icon"/>مكيف
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ======= Second Main Content ======= -->
<section class="second-main-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12 second-main-content-title">
                <h3>الشوارع المحيطة</h3>
            </div>
            <div class="clearfix"></div>
            <div class="col-sm-2">
                <a href="#" class=""><img src="assets/images/pepsiphoto.png" alt="bigads"/></a>
            </div>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-12 col-md-4 post post-second post-main-tab">
                        <div class="row">
                            <div class="post-img col-sm-12 relative">
                                <a role="button" class="post-like" data-like="true"><i
                                            class="icon fa active fa-heart ml-10"></i><span>888</span></a>
                                <div id="post-1" class="carousel slide" data-ride="carousel">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner" role="listbox">
                                        <div class="item">
                                            <img src="assets/images/post/photos/p-2-1.jpg" alt="img-1"
                                                 class="img-responsive"/>
                                        </div>
                                        <div class="item active">
                                            <img src="assets/images/post/photos/p-2-2.jpg" alt="img-2"
                                                 class="img-responsive"/>
                                        </div>
                                        <div class="item">
                                            <img src="assets/images/post/photos/p-2-3.jpg" alt="img-1"
                                                 class="img-responsive"/>
                                        </div>
                                    </div>
                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#post-1" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#post-1" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-12  post-body">
                                <div class="post-head">
                                    <ul class="list-instyled list-inline pull-right">
                                        <li>
                                            <i class="icon fa fa-clock"></i>قبل ساعتين
                                        </li>
                                        <li>
                                            <i class="icon fa fa-clock"></i>رقم الاعلان: ١٢٣٤٥
                                        </li>
                                    </ul>
                                    <ul class="list-instyled list-inline pull-left">
                                        <li>
                                            <i class="icon fa fa-map-marker"></i>جدة
                                        </li>
                                        <li>
                                            <i class="icon fa fa-comments"></i>12
                                        </li>
                                        <li>
                                            <a href="profile.php"><i class="icon fa fa-user"></i>فلان الفلاني</a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                    <a class="" href="single-product.php">سيارة مرسيدس للبيع</a>
                                </div>
                                <div class="post-price-head">
                                    <h1 class="main-color"><b>34,566 ريال</b></h1>
                                    <a href="#" class="btn btn-primary more-info">اظهر التفاصيل</a>
                                </div>
                                <div class="clearfix"></div>
                                <div class="post-footer text-center">
                                    <div class="row">
                                        <div class="col-xs-2">
                                            <img src="assets/images/post/icons/car-seat.png" alt="car seat"
                                                 class="post-footer-icon"/> 4
                                        </div>
                                        <div class="col-xs-2">
                                            <img src="assets/images/post/icons/car-door.png" alt="car seat"
                                                 class="post-footer-icon"/> 4
                                        </div>
                                        <div class="col-xs-4">
                                            <img src="assets/images/post/icons/automatic-brightness.png" alt="car seat"
                                                 class="post-footer-icon"/>اتوماتيك
                                        </div>
                                        <div class="col-xs-4">
                                            <img src="assets/images/post/icons/minisplit.png" alt="car seat"
                                                 class="post-footer-icon"/>مكيف
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4 post post-second post-main-tab">
                        <div class="row">
                            <div class="post-img col-sm-12 relative">
                                <a role="button" class="post-like" data-like="true"><i
                                            class="icon fa active fa-heart ml-10"></i><span>888</span></a>
                                <div id="post-1" class="carousel slide" data-ride="carousel">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner" role="listbox">
                                        <div class="item">
                                            <img src="assets/images/post/photos/p-2-1.jpg" alt="img-1"
                                                 class="img-responsive"/>
                                        </div>
                                        <div class="item active">
                                            <img src="assets/images/post/photos/p-2-2.jpg" alt="img-2"
                                                 class="img-responsive"/>
                                        </div>
                                        <div class="item">
                                            <img src="assets/images/post/photos/p-2-3.jpg" alt="img-1"
                                                 class="img-responsive"/>
                                        </div>
                                    </div>
                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#post-1" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#post-1" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-12  post-body">
                                <div class="post-head">
                                    <ul class="list-instyled list-inline pull-right">
                                        <li>
                                            <i class="icon fa fa-clock"></i>قبل ساعتين
                                        </li>
                                        <li>
                                            <i class="icon fa fa-clock"></i>رقم الاعلان: ١٢٣٤٥
                                        </li>
                                    </ul>
                                    <ul class="list-instyled list-inline pull-left">
                                        <li>
                                            <i class="icon fa fa-map-marker"></i>جدة
                                        </li>
                                        <li>
                                            <i class="icon fa fa-comments"></i>12
                                        </li>
                                        <li>
                                            <a href="profile.php"><i class="icon fa fa-user"></i>فلان الفلاني</a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                    <a class="" href="single-product.php">سيارة مرسيدس للبيع</a>
                                </div>
                                <div class="post-price-head">
                                    <h1 class="main-color"><b>34,566 ريال</b></h1>
                                    <a href="#" class="btn btn-primary more-info">اظهر التفاصيل</a>
                                </div>
                                <div class="clearfix"></div>
                                <div class="post-footer text-center">
                                    <div class="row">
                                        <div class="col-xs-2">
                                            <img src="assets/images/post/icons/car-seat.png" alt="car seat"
                                                 class="post-footer-icon"/> 4
                                        </div>
                                        <div class="col-xs-2">
                                            <img src="assets/images/post/icons/car-door.png" alt="car seat"
                                                 class="post-footer-icon"/> 4
                                        </div>
                                        <div class="col-xs-4">
                                            <img src="assets/images/post/icons/automatic-brightness.png" alt="car seat"
                                                 class="post-footer-icon"/>اتوماتيك
                                        </div>
                                        <div class="col-xs-4">
                                            <img src="assets/images/post/icons/minisplit.png" alt="car seat"
                                                 class="post-footer-icon"/>مكيف
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<?php
include 'footer.php';
?>
