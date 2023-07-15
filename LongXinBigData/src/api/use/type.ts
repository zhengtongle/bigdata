export interface DayPv {
    date: string,
    pv: number,
    uv: number
}

export type DayPvArray = DayPv[]

export interface Conversion_rate {
    pv: number,
    fav: number,
    cart: number,
    favCart: number | null,
    buy: number,
    pv2favcart: number,
    favcart2buy: number,
    pv2buy: number
}

export interface AgeCount {
    age: number,
    count: number
}

export type AgeCountArray = AgeCount[]

export interface TotalPv {
    pv: number,
    uv: number
}

export interface Week {
    week: number,
    pv: number,
    follow: number,
    cart: number,
    buy: number
}


export type WeekArray = Week[]