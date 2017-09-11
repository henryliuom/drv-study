<template>
    <aside id="sidebar">
        <div class="content">
        <div id="jquery-accordion-menu" class="jquery-accordion-menu red" style="left: -45px;filter:alpha(Opacity=90);-moz-opacity:0.9;opacity: 0.9">
        <div class="jquery-accordion-menu-header" id="form"></div>
		<ul  id="demo-list">
			<!--<li><a href="#"><i class="fa fa-file-image-o"></i>Gallery </a><span class="jquery-accordion-menu-label"> 12 </span></li>-->
			<li v-for="(row,index) in menus[0]"><a href="#"><i class="fa fa-cog"></i>{{ row.name }} </a>
				<ul class="submenu active" v-for="(row1,index1) in secondmenus[0]">
					<li v-if="row1.firstmenu.id==row.id"><a :href=" row1.url ">{{ row1.name }}</a></li>
                    <li><a href="#">Fonts </a></li>
				</ul>
			</li>
        </ul>
        </div>
            </div>
    </aside>
</template>
<script src="js/jquery-accordion-menu.js" type="text/javascript">jQuery("#jquery-accordion-menu").jqueryAccordionMenu();</script>
<script>
    import config from "../assets/config"
    import axios from 'axios'
//    To add jQuery modify build/webpack.prod.conf.js and build/webpack.dev.conf.js file and add these:
//            plugins: [
//
//              // ...
//
//              new webpack.ProvidePlugin({
//                $: 'jquery',
//                jquery: 'jquery',
//                'window.jQuery': 'jquery',
//                jQuery: 'jquery'
//              })
//            ]

(function($) {
$.expr[":"].Contains = function(a, i, m) {
	return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};
function filterList(header, list) {
	//@header 头部元素
	//@list 无需列表
	//创建一个搜素表单
	var form = $("<form>").attr({
		"class":"filterform",
		action:"#"
	}), input = $("<input>").attr({
		"class":"filterinput",
		type:"text"
	});
	$(form).append(input).appendTo(header);
	$(input).change(function() {
		var filter = $(this).val();
		if (filter) {
			var matches = $(list).find("a:Contains(" + filter + ")").parent();
			$("li", list).not(matches).slideUp();
			matches.slideDown();
		} else {
			$(list).find("li").slideDown();
		}
		return false;
	}).keyup(function() {
		$(this).change();
	});
}
$(function() {
	filterList($("#form"), $("#demo-list"));
});
})(jQuery);


    function getmenu(path, parameters) {
        let list = [];
        let url = config.baseurl+path;
        new Promise(function (resolve, reject) {
            axios.get(url,{
            headers: {'X-Requested-With':'XMLHttpRequest',"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},
            responseType:'json',
            params:parameters,
            withCredentials : true
            }).then(function(response){
                if (response.status==200) {
                    if ('permission required'==response.data){alert(response.data)}
                    else if('login required'==response.data){alert(response.data);}
                    else {list.push(response.data);}
//                    resolve(response.data);
                }
                else {alert(response.status)}
            }).catch(function(error){console.log(error);});
            });
        return list;
    };
  export default {
    data () {
      return {
          menus: '',
          secondmenus: ''
      }
    },
    created () {
        this.menus = getmenu('/menumanage/menus/','');
        this.secondmenus = getmenu('/menumanage/menusecondmenu/',{"menuid": "all"});
//        console.log(this.menus);
//        console.log(this.secondmenus);
    }
  }
</script>
