<?php
  include 'header.php';
?>

  <!-- ======= About Page ======= -->
  <section class="main-content">
    <!-- ======= Banner ======= -->
    <div id="" class="pages-banner text-center">
      <div class="container-fluid">
        <div class="row">
          <div class="col-xs-12">
            <h2>تواصل معنا الأن</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12">
            <ol class="breadcrumb">
              <li><a href="index.php">الرئيسية</a></li>
              <li class="active">تواصل معنا</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <!-- ======= Contect us ======= -->
    <div id="contact" class="contact-page-content page-main-content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-3 m-b-mob-30">
            <ul class="list-unstyled info-details">
              <li class="block">
                <span class="fa fa-map-marker"></span>
                <div class="text">
                  <p><b>العنوان</b></p>
                  <p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى</p>
                </div>
              </li>
              <li class="block">
                <span class="fa fa-phone"></span>
                <div class="text">
                  <p class="p-l main-color2"><b>التليفونات</b></p>
                  <p><b>الرقم المجانى:</b>+02 123 4567 890</p>
                  <p><b>المكتب الرئيسي:</b>+02 123 4567 890</p>
                </div>
              </li>
              <li class="block no-border m-b-mob-0">
                <span class="fa fa-envelope"></span>
                <div class="text">
                  <p class="p-l main-color2"><b>البريد الالكترونى</b></p>
                  <p><b>الدعم:</b>support@domain.com</p>
                  <p><b>العملاء:</b>clients@domain.com</p>
                </div>
              </li>
            </ul>
          </div>
          <div class="col-sm-9">
            <h2>تواصل معنا في اي وقت</h2>
            <form class="white-form" id="contact-form" method="post" novalidate>
              <div id="form-validate-result"></div>
              <div class="form-group">
                <input type="text" class="form-control" id="name" name="name" pattern="[a-zA-Z ]+" title="Format: Text Only" placeholder="الأسم" required>
              </div>
              <div class="form-group">
                <input type="email" id="email" name="email" class="form-control" placeholder="البريد الالكترونى" required>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="عنوان الرسالة" name="subject" id="subject" pattern="[a-zA-Z ]+" title="Format: Text Only" required>
              </div>
              <div class="form-group">
                <textarea name="msg" class="form-control" id="msg" placeholder="رسالتك" rows="3" required></textarea>
              </div>
              <button type="submit" id="submit" name="submit" class="btn btn-primary">
                <span>ارسال</span>
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>

  </section>

<?php
  include 'footer.php';
?>
