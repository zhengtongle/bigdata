import { defineStore } from 'pinia'
import { reqC1, reqC2, reqC3 } from '@/api/product/attr'
import { ref } from 'vue'
import type { CategoryObj, CategoryResponseData } from '@/api/product/attr/type'
const useCategoryStore = defineStore('category', () => {
    // 收集一级分类的ID
    let c1ArrId = ref<number | string>()
    // 一节分类存储数据
    let c1Data = ref<CategoryObj[]>()
    // 获取一级分类的方法
    const getC1Data = async () => {
        let result: CategoryResponseData = await reqC1()
        if(result.code == 200){
            c1Data.value = result.data
        }
    }
    
    // 收集二级分类的ID
    let c2ArrId = ref<number | string>()
    //二级分类存储数据
    let c2Data = ref<CategoryObj[]>()
    const getC2Data = async () => {
        await c2ArrId.value
        let result: CategoryResponseData = await reqC2(c1ArrId.value as number)
        if(result.code == 200){
            c2Data.value = result.data
        }
    }

    // 收集三级分类的ID
    let c3ArrId = ref<number | string>()
    //三级分类存储数据
    let c3Data = ref<CategoryObj[]>()
    const getC3Data = async (category2Id: number) => {
        let result: CategoryResponseData = await reqC3(c2ArrId.value as number)
        if(result.code == 200){
            c3Data.value = result.data
        }
    }
    return {
        c1ArrId,
        c2ArrId,
        c3ArrId,
        getC1Data,
        getC2Data,
        getC3Data,
        c1Data,
        c2Data,
        c3Data
    }
})

export default useCategoryStore