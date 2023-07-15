// SPU管理模块的接口
import request from '@/utils/request'
import type { HasSpuResponseData, AllTradeMark, SpuHasImg, SaleAttrResponseData, HasSaleAttrResponseData } from './type'
enum API{
    // 获取已有SPU的数据
    HASSPU_URL = '/admin/product/',
    //获取全部品牌数据
    ALLTRADEMARK_URL= '/admin/product/baseTrademark/getTrademarkList',
    //获取某一个SPU下的全部照片
    IMAGE_URL = '/admin/product/spuImageList/',
    //获取某一个SPU下全部的已有的销售属性接口地址
    SPUHASSLEATTR_URL = '/admin/product/spuSaleAttrList/',
    //获取整个项目全部的销售属性
    ALLSALEATTR_URL = '/admin/product/baseSaleAttrList',
    //添加一个新的SPU接口
    ADDSPU_URL= '/admin/product/saveSpuInfo',
    //更新已有的SPU
    UPDATASPU_URL = 'admin/product/updateSpuInfo'
}

//获得某一个三级分类下已有的SPU数据

export const reqHasSpu = (pageNO: number, limit: number, c3ArrId: number | string) => request.get<any, HasSpuResponseData>(API.HASSPU_URL + `${pageNO}/${limit}?category3Id=${c3ArrId}`)

//获取全部的SPU的品牌数据
export const reqAllTradeMark = () => request.get<any, AllTradeMark>(API.ALLTRADEMARK_URL)

//获取某一个已有的SPU下全部商品的图片地址
export const reqSpuImageList = (spuId: number) => request.get<any, SpuHasImg>(API.IMAGE_URL + spuId) 

//获取某一个已有的SPU拥有多少个销售属性
export const reqHasSaleAttr = (spuId: number) => request.get<any, SaleAttrResponseData>(API.SPUHASSLEATTR_URL + spuId)

//获取全部销售属性
export const reqAllSaleAttr = () => request.get<any, HasSaleAttrResponseData>(API.ALLSALEATTR_URL)

//添加一个新的SPU
//更新一个SPU接口
export const reqAddOrUpdataSpu = (data: any) => {
    //如果SPU对象拥有ID, 更新已有的SPU
    if(data.id){
        return request.post<any, any>(API.UPDATASPU_URL, data)
    }else{
        return request.post<any, any>(API.ADDSPU_URL, data)
    }
}