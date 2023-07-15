// 书写品牌管理模块接口
import request from '@/utils/request'
import type { TrademarkResponseData, TradeMark } from './type'
//品牌管理模块接口地址
enum API {
    //获取已有品牌接口
    TRADEMARK_URL = '/admin/product/baseTrademark/',
    // 新增品牌接口
    ADDTRADEMARK_URL = '/admin/product/baseTrademark/save',
    // 修改已有的品牌
    UPDATATRADEMARK_URL = '/admin/product/baseTrademark/update',
    //删除已有品牌
    DELETETRADEMARK_URL = '/admin/product/baseTrademark/remove'
}

// 获取已有品牌接口的方法
// page: 获取第几页---默认第一页
// limit： 获取几个已有商品的数据
export const reqHasTrademark = (page: number, limit: number) => request.get<any, TrademarkResponseData>(API.TRADEMARK_URL+`${page}/${limit}`)

//添加与修改已有品牌接口的方法
export const reqAddOrUpdataTrademark = (data: TradeMark) => {
    //修改已有品牌
    if(data.id){
        return request.put<any, any>(API.UPDATATRADEMARK_URL, data)
    }else{
        //新增品牌
        return request.post<any, any>(API.ADDTRADEMARK_URL, data)
    }
}

//删除已有的品牌
export const DeleteTrademark = (id: number) => request.delete<any, any>(API.DELETETRADEMARK_URL + `/${id}`)