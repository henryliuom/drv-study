/**
 * Created by henry on 2017/9/8.
 */
import axios from 'axios'
import config from "../assets/config"

//function getfun(path, parameters) {
//        let list = [];
//        let url = config.baseurl+path;
//        new Promise(function (resolve, reject) {
//            axios.get(url,{
//            headers: {
//                  "Content-Type":"application/json;charset=utf-8"
//                },
//            responseType:'json',
//            withCredentials : true
//        }).then(function(response){
//                if (response.status==200) {
//                    if ('permission required'==response.data){alert(response.data)}
//                    else if('login required'==response.data){alert(response.data);router.push('/login')}
//                    else {list.push(response.data);}
////                    resolve(response.data);
//                }
//                else {alert(response.status)}
//        }).catch(function(error){console.log(error);router.push('/login')});
//        });
//       console.log(list);
//        return list;
//};