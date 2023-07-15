//路由鉴权  

import router from "./router";
import { storeToRefs } from "pinia";
import setting from './setting'
// 组件外部想使用小仓库的数据， 必须先注册大仓库

// 进度样式包引入
//@ts-ignore
import nprogress from 'nprogress'
import 'nprogress/nprogress.css'
nprogress.configure({showSpinner: false})
// 全局守卫：项目当中任意路由切换都会触发的钩子

// 全局前置守卫
router.beforeEach(async(to: any, from: any, next: any) => {
    // 进度条开始
    document.title = `${setting.title} - ${to.meta.title}`
    nprogress.start();
    next()
})


// 全局后置守卫
router.afterEach((to: any, from: any) => {
    // 进度条关闭
    nprogress.done();
})