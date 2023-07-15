export interface ResponseData {
    code: number,
    message: string,
    ok: boolean
}
//一级ts

//一级分类ts数据类型
export interface CategoryObj{
    id: number,
    name: string,
    category2Id?: number,
    category1Id?: number
}

// 相应的分类接口返回的数据类型
export interface CategoryResponseData extends ResponseData{
    data: CategoryObj[]
}


// 获取分类下已有的属性值对象的数据类型
export interface AttrValue{
    id?: number,
    valueName: string,
    attrId?: number,
    flag?: boolean
}

// 存储每一个属性值的数组类型
export type attrValueList = AttrValue[]

// 属性对象
export interface Attr{
    id?: number,
    attrName: string,
    categoryId: number | string,
    categoryLevel: number,
    attrValueList: attrValueList,
}
//存储每一个属性对象的ts类型
export type AttrList = Attr[]

//属性接口返回的数据类型
export interface AttrResponseData extends ResponseData{
    data: AttrList
}