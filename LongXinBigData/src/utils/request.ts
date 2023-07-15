//进行axios二次封装

import axios from 'axios'
//@ts-ignore
import { ElMessage } from 'element-plus'

import { GET_TOKEN } from './token'
 
//第一步：利用axios对象的create方法, 去创建axios实例（）

let request = axios.create({
    baseURL: '/api',//基础路径会携带/api
    timeout: 5000,//超时的时间设置
})
//第二布：request实例添加请求与响应拦截器实例

request.interceptors.request.use((config) => {
    if(GET_TOKEN()){
        config.headers.token = GET_TOKEN()
    }
    // console.log(config);
    
    return config
})


//第三步：添加相应拦截器
request.interceptors.response.use((response) => {
    //成功回调
    //简化数据  
    return response.data
}, (error) => {
    
    //失败回调： 处理http网络错误
    //定义一个变量：存储网络信息错误
    let message = ''
    let status = error.response.status
    switch(status){
        case 401:
            message = 'TOKEN过期'
            break
        case 403:
            message = '无权访问'
            break
        case 404:
            message = '请求地址错误'
            break
        case 500:
            message = '服务器出现问题'
            break
        default: 
            message = '网络出现问题'
            break
    }

    ElMessage({
        type: 'error',
        message
    })
    
    return Promise.reject(error)
})

export default request