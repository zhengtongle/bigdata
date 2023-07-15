import request from "@/utils/request";
import type { DayPvArray, Conversion_rate, AgeCountArray, TotalPv,  WeekArray } from './type'
enum API {
    //日期信息
    dayPv = '/dayPv',
    //详细信息
    conversion_rate = '/conversion_rate',
    //各年龄用户数量
    userAgeCount = '/userAgeCount',
    //各类用户数量
    customerTypeCount = '/customerTypeCount',
    //男女比例
    maleRatio = '/maleRatio',
    //各地区用户数量
    userAddressCount = '/userAddressCount',
    //总信息
    totalPv = '/totalPv',
    //周信息
    week = '/week'
}
//日期信息
export const getDayPv = () => request.get<any, DayPvArray>(API.dayPv)
//详细信息
export const getConversion_rate = () => request.get<any, Conversion_rate>(API.conversion_rate)
//各年龄用户数量
export const getUserAgeCount = () => request.get<any, AgeCountArray>(API.userAgeCount)
//各类用户数量
export const getCustomerTypeCount = () => request.get<any, any>(API.customerTypeCount)
//男女比例
export const getMaleRatio = () => request.get<any, any>(API.maleRatio)
//各地区用户数量
export const getUserAddressCount = () => request.get<any, any>(API.userAddressCount)
//总信息
export const getTotalPv = () => request.get<any, TotalPv>(API.totalPv)
//周信息
export const getWeek = () => request.get<any, WeekArray>(API.week)