
export interface ResponseData {
    code: number,
    message: string,
    ok: boolean
}

// 已有的品牌的ts的数据类型
export interface TradeMark {
    id?: number,
    tmName: string,
    logoUrl: string
}

// 包含全部品牌数据的ts类型
export type Records = TradeMark[]

// 获取的已有全部品牌的数据ts类型
export interface TrademarkResponseData extends ResponseData {
    data:{
        records: Records,
        // 已有的全部商品的数量
        total: number,
        // 一页有几个
        size: number,
        // 第几页
        current: number,
        searchCount: boolean,
        // 总共有几页
        page: number
    }
}