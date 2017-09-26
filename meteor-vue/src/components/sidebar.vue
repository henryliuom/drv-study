<template>
    <aside id="sidebar">
        <div class="menu">
        <div class="jquery-accordion-menu-header" id="form" style="margin: 10px 30px 30px -15px;"> </div>
		<ul id="demo-lists">
			<!--<li><a href="#"><i class="fa fa-file-image-o"></i>Gallery </a><span class="jquery-accordion-menu-label"> 12 </span></li>-->
			<li v-for="row in secondmenus[0]"><a href="#"><i :class="row.iconclass"></i>  {{ row.name }}</a>
				<ul class="submenu active">
					<li v-for="secondmenu in row.secondmenus"><a :href="secondmenu.url">{{ secondmenu.name }}</a></li>
				</ul>
			</li>
            <!--<a>{{ secondmenus }}</a>-->
        </ul>
        </div>
    </aside>
</template>

<script>
    import config from "../assets/config"
    import axios from 'axios'
	import '../../static/js/jquery.lksMenu'
//    import app_ from '../App'
//	import '../assets/exportfun'
//    说明，勿删。To add jQuery modify build/webpack.prod.conf.js and build/webpack.dev.conf.js file and add these:
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
//jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

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
	}), input = $("<input placeholder='主菜单搜索'>").attr({
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
	filterList($("#form"), $("#demo-lists"));
});
})(jQuery);

    window.onload = function(){
        $('.menu').lksMenu();
    };

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
                    else if('login required'==response.data){alert(response.data);router.push('/login')}
                    else {list.push(response.data);}
//                    resolve(response.data);
                }
                else {alert(response.status)}
            }).catch(function(error){console.log(error);});
            });
        return list;
    };
  export default {
    mounted(){
        this.initdata();
    },
    data () {
      return {
          secondmenus: ""
      }
    },
//    props: ['secondmenus'],
    created () {

    },
    methods:{
        initdata(){
            this.secondmenus=getmenu('/menumanage/secondmenusearch/',{"fid": "menus"});
        }
    }
  }
</script>
<!--<script src="../../static/js/jquery-accordion-menu.js" type="text/javascript">-->
	<!--jQuery("#jquery-accordion-menu").jqueryAccordionMenu();-->
<!--</script>-->