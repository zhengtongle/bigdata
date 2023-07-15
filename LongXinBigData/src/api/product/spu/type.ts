
//服务器全部接口返回的数据类型
export interface ResponseData {
    code: number, 
    message: string,
    ok: boolean
}

//SPU数据类型
export interface SpuData {
    id?: number,
    spuName: string,
    description: string,
    category3Id: number | string,
    tmId: number | string  //品牌ID
    spuSaleAttrList: null | SaleAttr[], //SPU销售属性
    spuImageList: null | SpuImg[] //SPU图片
}

//数组: 元素都是SPU数据
export type Records = SpuData[]

//定义获取已有的SPU接口返回的数据ts类型
export interface HasSpuResponseData extends ResponseData{
    data: {
        records: Records,
        total: number,
        size: number,
        current: number,
        searchCount: boolean,
        pages: number
    }
}

//品牌数据的ts类型
export interface Trademark {
    id: number,
    tmName: string,
    logoUrl: string
}

//品牌接口返回的数据ts类型
export interface AllTradeMark extends ResponseData {
    data: Trademark[]
}


//商品图片的ts类型
export interface SpuImg {
    id?: number,
    createTime?: string,
    updataTime?: string,
    spuId?: number,
    imgName?: string,
    imgUrl?: string,
    name?: string,
    url?: string
}

//已有的SPU的照片墙数据的类型
export interface SpuHasImg extends ResponseData {
    data: SpuImg[]
}

//已有的销售属性值对象的ts类型
export interface SaleAttrValue {
    id?: number,
    createTime?: null,
    updataTime?: null,
    spuId?: number,
    baseSaleAttrId: number,
    saleAttrValueName: string,
    saleAttrName?: string,
    isChecked?: null
}

//存储已有的销售属性数组类型
export type spuSaleAttrValueList = SaleAttrValue[]

//销售属性对象ts类型
export interface SaleAttr {
    id?: number,
    createTime?: null,
    updataTime?: null,
    spuId?: number,
    baseSaleAttrId: number,
    saleAttrName: string,
    spuSaleAttrValueList: spuSaleAttrValueList
}

//SPU已有的销售属性接口返回数据ts类型
export interface SaleAttrResponseData extends ResponseData {
    data: SaleAttr
}

//已有全部的SPU返回数据ts类型
export interface HasSaleAttr {
    id: number,
    name: string
}

//SPU全部销售属性ts类型
export interface HasSaleAttrResponseData extends ResponseData {
    data: HasSaleAttr[]
}