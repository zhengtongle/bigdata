
import { defineStore } from 'pinia'
import { ref } from 'vue'
import { constantRoute } from '@/router/router'
import type { DayPvArray, Conversion_rate, AgeCountArray, TotalPv,  WeekArray } from '@/api/use/type'
import { getDayPv, getConversion_rate, getUserAgeCount, getCustomerTypeCount, getMaleRatio, getUserAddressCount, getTotalPv, getWeek } from '@/api/use/index'
const useUserStore = defineStore('user', () => {
    //路由信息
    let menuRoutes = constantRoute
    //日期信息
    let DayPv_ = ref<DayPvArray>()
    let getDayPv_ = async () => {
        DayPv_.value = await getDayPv()
    }
    //详细信息
    let Conversion_rate_ = ref<Conversion_rate>()
    let getConversion_rate_ = async () => {
        Conversion_rate_.value = await getConversion_rate()
        
        Conversion_rate_.value.favCart = Conversion_rate_.value.fav + Conversion_rate_.value.cart
    }
    //各年龄用户数量
    let UserAgeCount_ = ref<AgeCountArray>()
    let getUserAgeCount_ = async () => {
        UserAgeCount_.value = await getUserAgeCount()
    }
    //各类用户数量
    let CustomerTypeCount_ = ref<any>()
    let getCustomerTypeCount_ = async () => {
        CustomerTypeCount_.value = await getCustomerTypeCount()
    }
    //男女比例
    let maleRatio_ = ref<number>()
    let femaleRadio_ = ref<number>()
    let getMaleRatio_ = async () => {
        maleRatio_.value = await getMaleRatio()

        femaleRadio_.value = 1 - maleRatio_.value!
    }
    //各地区用户数量
    let UserAddressCount_ = ref<any>()
    let getUserAddressCount_ = async () => {
        UserAddressCount_.value = await getUserAddressCount()
    }
    //总信息
    let TotalPv_ = ref<TotalPv>()
    let getTotalPv_ = async () => {
        TotalPv_.value = await getTotalPv()
    }
    //周信息
    let Week_ = ref<WeekArray>()
    let getWeek_ = async () => {
        Week_.value = await getWeek()
        
    }
    return {
        menuRoutes,
        DayPv_,
        getDayPv_,
        Conversion_rate_,
        getConversion_rate_,
        UserAgeCount_,
        getUserAgeCount_,
        CustomerTypeCount_,
        getCustomerTypeCount_,
        maleRatio_,
        femaleRadio_,
        getMaleRatio_,
        UserAddressCount_,
        getUserAddressCount_,
        TotalPv_,
        getTotalPv_,
        Week_,
        getWeek_
    }
})

export default useUserStore