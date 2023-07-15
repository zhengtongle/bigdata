export const getLoginTime = (): string => {
    let hours = new Date().getHours()
    let Time: string = ''
    if(hours <= 9){
        Time = '早上好'
    }else if(hours <= 12){
        Time = '中午好'
    }else if(hours <= 18){
        Time = '下午好'
    }else{
        Time = '晚上好'
    }
    return Time
}