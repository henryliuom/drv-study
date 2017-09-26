/**
 * Created by henry on 2017/9/8.
 */
import axios from 'axios'
import config from "../assets/config"

//    function getmenu(path, parameters) {
//        let list = [];
//        let url = config.baseurl+path;
//        new Promise(function (resolve, reject) {
//            axios.get(url,{
//            headers: {'X-Requested-With':'XMLHttpRequest',"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},
//            responseType:'json',
//            params:parameters,
//            withCredentials : true
//            }).then(function(response){
//                if (response.status==200) {
//                    if ('permission required'==response.data){alert(response.data)}
//                    else if('login required'==response.data){alert(response.data);}
//                    else {list.push(response.data);}
////                    resolve(response.data);
//                }
//                else {alert(response.status)}
//            }).catch(function(error){console.log(error);});
//            });
//        return list;
//    };