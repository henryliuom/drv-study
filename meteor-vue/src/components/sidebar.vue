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

    window.onload = function () {
        $('.menu').lksMenu();
        //获取登陆弹窗div——loginPop
        //获取弹窗的头部h2——move
        var loginPop = document.getElementById("popdialogid");
        var move = loginPop;
        //var move = document.getElementsByTagName("h2")[0];
        //给move添加鼠标按下事件
        move.addEventListener("mousedown", function (e) {
            //获取事件触发时按下点距浏览器当前窗口的水平坐标(e.clientX)和垂直坐标(e.clientX)
            //以及此时登陆弹窗左边缘和上边缘距浏览器左边缘和上边缘的距离offsetLeft和offsetTop
            //计算得到鼠标按下点距登陆弹窗左边缘和上边缘的距离diffX、diffY
            var diffX = e.clientX - loginPop.offsetLeft,
                    diffY = e.clientY - loginPop.offsetTop;
            //利用IE独有的方法setCapture，鼠标按下时捕获鼠标移出浏览器的事件
            //配合下面releaseCapture，鼠标弹起时释放
            //解决IE在限制弹窗移出浏览器失效的bug
            if (typeof loginPop.setCapture != 'undefined') {
                loginPop.setCapture();
            }
            //鼠标在弹窗头部按下时，给document添加鼠标移动事件
            //从而让弹窗可以在document范围内移动
            document.addEventListener("mousemove", mousemove);
            function mousemove(e) {
                //实时获取鼠标移动事件触发时按住点距浏览器当前窗口的水平坐标(e.clientX)和垂直坐标(e.clientX)
                //根据上面计算得到的diffX、diffY
                //计算移动后登陆弹窗位置参数left、top
                var left = e.clientX - diffX;
                var top = e.clientY - diffY;
                //当登陆弹窗移出浏览器左边缘时left<0，
                //当弹窗移出浏览器右边缘时left > getInner().width - loginPop.offsetWidth
                //限制弹窗移出浏览器左右边缘
                // 上下边缘同理
                if (left < 380) {
                    left = 380;
                } else if (left > getInner().width - loginPop.offsetWidth + 380) {
                    left = getInner().width - loginPop.offsetWidth + 380;
                }
                if (top < 0) {
                    top = 0;
                } else if (top > getInner().height - loginPop.offsetHeight) {
                    top = getInner().height - loginPop.offsetHeight;
                }
                loginPop.style.left = left + 'px';
                loginPop.style.top = top + 'px';
            }

            // 给document添加鼠标弹起事件
            // 鼠标弹起时移出鼠标的移动事件和弹起事件自身
            // 鼠标弹起时弹窗停止在当前位置
            document.addEventListener("mouseup", mouseup);
            function mouseup() {
                document.removeEventListener("mousemove", mousemove);
                document.removeEventListener("mouseup", mouseup);
                //配合上面的setCapture
                if (typeof loginPop.releaseCapture != 'undefined') {
                    loginPop.releaseCapture();
                }
            }
        });
        // 浏览器的window添加窗口大小的监听事件
        // 当浏览器大小变化时，判断弹窗当前位置是否超出浏览器的右边缘或者下边缘
        // 当超出时强制赋值使其定位在浏览器边缘
        window.addEventListener("resize", fn);
        function fn() {
            if (loginPop.offsetLeft > getInner().width - loginPop.offsetWidth) {
                loginPop.style.left = getInner().width - loginPop.offsetWidth + 'px';
            }
            if (loginPop.offsetTop > getInner().height - loginPop.offsetHeight) {
                loginPop.style.top = getInner().height - loginPop.offsetHeight + 'px';
            }
        };
        //跨浏览器获取视口大小
        function getInner() {
            //非IE浏览器，支持innerWidth、innerHeight
            if (typeof window.innerWidth != 'undefined') {
                return {
                    width: window.innerWidth,
                    height: window.innerHeight
                }
            } else {
                //IE浏览器，不支持innerWidth、innerHeight
                //支持documentElement.clientWidth、documentElement.clientHeight
                return {
                    width: document.documentElement.clientWidth,
                    height: document.documentElement.clientHeight
                }
            }
        };
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