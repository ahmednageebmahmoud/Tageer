<?php
include 'header.php';
?>

<!-- ======= Main Content ======= -->
<section class="main-content">
    <!-- ======= Banner ======= -->
    <div id="" class="pages-banner text-center">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h2>آضف اعلانك الان</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="index.php">الرئيسية</a></li>
                        <li class="active">اضف اعلان</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- ======= About us ======= -->
    <div id="add-ads" class="add-ads-page-content add-ads page-main-content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="home-tabs">
                        <div class="row">
                            <div class="col-sm-4">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#step-1">اختر القسم</a></li>
                                    <li class="disabled"><a data-toggle="tab" href="#step-2">اختر القسم الفرعي</a></li>
                                    <li class="disabled"><a data-toggle="tab" href="#step-3">تفاصيل القسم</a></li>
                                    <li class="disabled"><a data-toggle="tab" href="#step-4">تفاصيل الاعلان</a>
                                    </li>
                                    <li class="disabled"><a data-toggle="tab" href="#step-5">الخريطه والمدينه والحي</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-sm-8">
                                <div class="tab-content">
                                    <div id="step-1" class="tab-pane fade in active">
                                        <form class="search payment-2">
                                            <div class="row">
                                                <div class="col-xs-6 col-sm-3">
                                                    <div class="choose-category">
                                                        <a role="button" data-toggle="modal"
                                                           data-target=".add-ads-subcategory">
                                                            <img src="assets/images/categories/buildings.png"
                                                                 class="img-responsive img-circle"/>
                                                            <span class="center-block">عقارات</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6 col-sm-3">
                                                    <div class="choose-category">
                                                        <a role="button" data-toggle="modal"
                                                           data-target=".add-ads-subcategory">
                                                            <img src="assets/images/categories/car.png"
                                                                 class="img-responsive img-circle"/>
                                                            <span class="center-block">سيارات</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6 col-sm-3">
                                                    <div class="choose-category">
                                                        <a role="button" data-toggle="modal"
                                                           data-target=".add-ads-subcategory">
                                                            <img src="assets/images/categories/city-hall.png"
                                                                 class="img-responsive img-circle"/>
                                                            <span class="center-block">قاعات</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6 col-sm-3">
                                                    <div class="choose-category">
                                                        <a role="button" data-toggle="modal"
                                                           data-target=".add-ads-subcategory">
                                                            <img src="assets/images/categories/wedding.png"
                                                                 class="img-responsive img-circle"/>
                                                            <span class="center-block">لوازم افراح</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-sm-12">
                                                    <a href="#step-2" id="btn1" class="btn btn-primary"
                                                       data-toggle="tab">استمرار</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div id="step-2" class="tab-pane fade">

                                        <form class="search payment-2">
                                            <div class="row">
                                                <div class="col-xs-6 col-sm-3">
                                                    <div class="choose-category">
                                                        <a role="button" data-toggle="modal"
                                                           data-target=".add-ads-subcategory">
                                                            <img src="assets/images/categories/buildings.png"
                                                                 class="img-responsive img-circle"/>
                                                            <span class="center-block">عقارات</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6 col-sm-3">
                                                    <div class="choose-category">
                                                        <a role="button" data-toggle="modal"
                                                           data-target=".add-ads-subcategory">
                                                            <img src="assets/images/categories/car.png"
                                                                 class="img-responsive img-circle"/>
                                                            <span class="center-block">سيارات</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6 col-sm-3">
                                                    <div class="choose-category">
                                                        <a role="button" data-toggle="modal"
                                                           data-target=".add-ads-subcategory">
                                                            <img src="assets/images/categories/city-hall.png"
                                                                 class="img-responsive img-circle"/>
                                                            <span class="center-block">قاعات</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-6 col-sm-3">
                                                    <div class="choose-category">
                                                        <a role="button" data-toggle="modal"
                                                           data-target=".add-ads-subcategory">
                                                            <img src="assets/images/categories/wedding.png"
                                                                 class="img-responsive img-circle"/>
                                                            <span class="center-block">لوازم افراح</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-sm-12">
                                                    <a href="#step-1" id="btn3" class="btn btn-primary back"
                                                       data-toggle="tab">الرجوع</a>
                                                    <a href="#step-3" id="btn2" class="btn btn-primary"
                                                       data-toggle="tab">استمرار</a>
                                                </div>
                                            </div>
                                        </form>

                                    </div>

                                    <div id="step-3" class="tab-pane fade">
                                        <form class="search payment-2">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="info-detail">
                                                        <div class="row">
                                                            <div class="col-sm-3">
                                                                <p>
                                                                    <i class="icon fa fa-home"></i><strong>نوع
                                                                        الشقه</strong>
                                                                </p>
                                                            </div>
                                                            <div class="col-sm-9">
                                                                <nav aria-label="Page navigation">
                                                                    <ul class="pagination pagination-lg">
                                                                        <li><a href="#">عماره</a></li>
                                                                        <li><a href="#">فيلا</a></li>
                                                                        <li class="active"><a href="#">برج</a></li>
                                                                        <li><input type="text" placeholder="اكتب"
                                                                                   class="form-control"/></li>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-sm-12">
                                                    <div class="info-detail">
                                                        <div class="row">
                                                            <div class="col-sm-3">
                                                                <p>
                                                                    <i class="icon fa fa-calendar"></i><strong>مده
                                                                        التاجير</strong>
                                                                </p>
                                                            </div>
                                                            <div class="col-sm-9">
                                                                <nav aria-label="Page navigation">
                                                                    <ul class="pagination pagination-lg">
                                                                        <li class="active"><a href="#">شهري</a></li>
                                                                        <li><a href="#">سنوي</a></li>
                                                                        <li><a href="#">يومي</a></li>
                                                                        <li><input type="text" placeholder="اكتب"
                                                                                   class="form-control"/></li>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-sm-12">
                                                    <div class="info-detail">
                                                        <div class="row">
                                                            <div class="col-sm-3">
                                                                <p>
                                                                    <i class="icon fa fa-id-card"></i><strong>الفئه</strong>
                                                                </p>
                                                            </div>
                                                            <div class="col-sm-9">
                                                                <nav aria-label="Page navigation">
                                                                    <ul class="pagination pagination-lg three-item">
                                                                        <li><a href="#">عوائل</a></li>
                                                                        <li><a href="#">عزاب</a></li>
                                                                        <li class="active"><a href="#">الكل</a></li>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-sm-12">
                                                    <div class="info-detail">
                                                        <div class="row">
                                                            <div class="col-sm-3">
                                                                <p>
                                                                    <i class="icon fa fa-bed"></i><strong>عدد
                                                                        الغرف</strong>
                                                                </p>
                                                            </div>
                                                            <div class="col-sm-9">
                                                                <nav aria-label="Page navigation">
                                                                    <ul class="pagination pagination-lg six-item">
                                                                        <li class="active"><a href="#">1</a></li>
                                                                        <li><a href="#">2</a></li>
                                                                        <li><a href="#">3</a></li>
                                                                        <li><a href="#">4</a></li>
                                                                        <li><a href="#">5</a></li>
                                                                        <li><input type="number" placeholder="اكتب"
                                                                                   class="form-control"/></li>
                                                                    </ul>
                                                                </nav>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-sm-12">
                                                    <div class="info-detail">
                                                        <div class="row">
                                                            <div class="col-sm-3">
                                                                <p>
                                                                    <i class="icon fa fa-list-ol"></i><strong>رقم
                                                                        الدور</strong>
                                                                </p>
                                                            </div>
                                                            <div class="col-sm-9">
                                                                <div class="range-input-container">
                                                                    <input type="range" min="1" max="100" value="1"
                                                                           class="range-input" id="range-input">
                                                                    <p>الدور <span id="range-value"></span></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <a href="#step-2" id="btn5" class="btn btn-primary back"
                                                       data-toggle="tab">الرجوع</a>
                                                    <a href="#step-4" id="btn4" class="btn btn-primary"
                                                       data-toggle="tab">استمرار</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div id="step-4" class="tab-pane fade">
                                        <form class="search payment-2">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>عنوان الاعلان</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>سعر الاعلان</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="custom-file-upload col-sm-12">
                                                    <input type="file" id="file" name="myfiles[]" multiple/>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label>تفاصيل الاعلان</label>
                                                        <textarea name="msg" class="form-control" id="msg" rows="3"
                                                                  required=""></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <a class="btn btn-primary back" id="btn6" data-toggle="tab"
                                                       href="#step-3">الرجوع</a>
                                                    <a href="#step-5" id="btn7" class="btn btn-primary"
                                                       data-toggle="tab">استمرار</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div id="step-5" class="tab-pane fade">
                                        <form class="search payment-2">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>حدد المدينه</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>حدد موقع المكتب علي الخريطه</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div id="map_wrapper">
                                                        <div id="map_canvas" class="mapping"></div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <a class="btn btn-primary back" id="btn8" data-toggle="tab"
                                                       href="#step-4">الرجوع</a>
                                                    <a class="btn btn-primary" id="btn7" href="single-product.php">اضافة
                                                        الاعلان</a>
                                                </div>
                                            </div>
                                        </form>
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
