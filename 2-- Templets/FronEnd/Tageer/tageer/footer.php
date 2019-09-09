  <!-- ======= Footer ======= -->
  <footer>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-4">
          <a class="navbar-brand" href="#"><img src="assets/images/logo.png" alt="logo" />تـأجـيـر</a>
          <p>
            هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ
          </p>
        </div>
        <div class="col-sm-2">
          <h3 class="footer-title">روابط معينه</h3>
          <ul class="list-unstyled">
            <li>
              <a href="#">رابط ما</a>
            </li>
            <li>
              <a href="#">رابط ما</a>
            </li>
            <li>
              <a href="#">رابط ما</a>
            </li>
            <li>
              <a href="#">رابط ما</a>
            </li>
          </ul>
        </div>
        <div class="col-sm-2">
          <h3 class="footer-title">روابط معينه</h3>
          <ul class="list-unstyled">
            <li>
              <a href="#">رابط ما</a>
            </li>
            <li>
              <a href="#">رابط ما</a>
            </li>
            <li>
              <a href="#">رابط ما</a>
            </li>
            <li>
              <a href="#">رابط ما</a>
            </li>
          </ul>
        </div>
        <div class="col-sm-4">
          <h3 class="footer-title">اشترك الان فى النشرة البريدية</h3>
          <form>
            <input type="email" class="form-control" placeholder="البريد الالكترونى" />
            <input type="password" class="form-control" placeholder="كلمة المرور" />
            <button type="submit" class="btn btn-primary">اشترك</button>
          </form>
        </div>
      </div>
    </div>
  </footer>
  <!-- ======= Copyright ======= -->
  <div class="copyright">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-8">
          <p>
            جميع الحقوق محفوظة لتأجير 2018
          </p>
        </div>
        <div class="col-sm-4 text-left">
          <ul class="list-inline list-unstyled">
            <li>
              <a href="#"><i class="icon fab fa-facebook-square"></i></a>
            </li>
            <li>
              <a href="#"><i class="icon fab fa-twitter-square"></i></a>
            </li>
            <li>
              <a href="#"><i class="icon fab fa-google-plus-square"></i></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <!-- ======= Footer Scripts ======= -->
  <script src="assets/js/jquery-2.1.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollToFixed/1.0.8/jquery-scrolltofixed-min.js"></script>

  <script src="assets/js/select/jquery.ui.core.js"></script>
  <script src="assets/js/select/jquery.ui.widget.js"></script>
  <script src="assets/js/select/jquery.ui.position.js"></script>
  <script src="assets/js/select/jquery.ui.selectmenu.js"></script>

  <script src="assets/js/functions.js"></script>
  <script>
		$(function(){
			$('select#slect-1,select#slect-2,select#slect-3,select#slect-4').selectmenu({
				menuWidth: 400,
				format: addressFormatting
			});
		});

		//a custom format option callback
		var addressFormatting = function(text, opt){
			var newText = text;
			//array of find replaces
			var findreps = [
				{find:/^([^\-]+) \- /g, rep: '<span class="ui-selectmenu-item-header">$1</span>'},
				{find:/([^\|><]+) \| /g, rep: '<span class="ui-selectmenu-item-content">$1</span>'},
				{find:/([^\|><\(\)]+) (\()/g, rep: '<span class="ui-selectmenu-item-content">$1</span>$2'},
				{find:/([^\|><\(\)]+)$/g, rep: '<span class="ui-selectmenu-item-content">$1</span>'},
				{find:/(\([^\|><]+\))$/g, rep: '<span class="ui-selectmenu-item-footer">$1</span>'}
			];

			for(var i in findreps){
				newText = newText.replace(findreps[i].find, findreps[i].rep);
			}
			return newText;
		}
	</script>
</body>

</html>
