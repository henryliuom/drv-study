/**
 * Created by henry on 2017/9/8.
 */

let CONFIG;
if (process.env.NODE_ENV === 'production') {
  CONFIG = {
    apiUrl: "",
    EMAIL: 'henryliuom@gmail.com'
  };
} else {
  CONFIG = {
    apiUrl: "http://172.16.33.140",
    EMAIL: 'henryliuom@gmail.com'
  };
}
//接口API根地址
const baseurl = CONFIG.apiUrl;
const EMAIL = CONFIG.EMAIL;
module.exports = {
    baseurl: baseurl,
};

