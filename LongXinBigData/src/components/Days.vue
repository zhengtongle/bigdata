<script setup lang="ts">
    import { onMounted, ref, getCurrentInstance, watch, reactive } from 'vue'
    import useUserStore from '@/store/modules/user';
    import { storeToRefs } from 'pinia';
    import type { DayPv, DayPvArray } from '@/api/use/type'
    import * as echarts from 'echarts'
    let Day = ref<string>('2018-02-01')
    let Day_ = ref<DayPv>()
    let day = ref()
    let myChart: echarts.ECharts
    let option = reactive({
            title: {
                text: Day.value
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                type: 'shadow'
                }
            },
            legend: {},
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: [0, 0.01],
                axisTick: {
                        alignWithLabel: true
                    },
                    axisLabel: {
                        color: "rgba(255,255,255,.6)",
                        fontSize: "12"
                    },
            },
            yAxis: {
                type: 'category',
                data: ['pv', 'uv'],
                axisLabel: {
                        color: "rgba(255,255,255,.6)",
                        fontSize: "12"
                    },
                    // y轴线条样式
                    axisLine: {
                        lineStyle: {
                            color: "rgba(255,255,255,.1)",
                            // width: 1,
                            // type: "solid"
                        }
                    },
                    // y 轴分隔线样式
                    splitLine: {
                        lineStyle: {
                        color: "rgba(255,255,255,.1)"
                        }
                    }
            },
            series: [
                {
                name: 'pv',
                type: 'bar',
                data: [0],
                itemStyle: {
                    // 修改柱子圆角
                    barBorderRadius: 5
                    }
                },
                {
                name: 'uv',
                type: 'bar',
                data: [0],
                itemStyle: {
                    // 修改柱子圆角
                    barBorderRadius: 5
                    }
                }
            ]
        });
    onMounted(async () => {
        await getDayPv_()
        myChart = echarts.init(day.value)
        Day_.value = filterDay(Day.value!)![0]
        console.log(Day_.value.pv);
        
        option.series[0].data.push(Day_.value?.pv! || 0)
        option.series[1].data.push(Day_.value?.uv! || 0)
        
        myChart.setOption(option)        
    })
    let store = useUserStore()
    let { getDayPv_ } = store
    let { DayPv_ } = storeToRefs(store)
    
    function filterDay(Day: string){
        return DayPv_.value?.filter(item => item.date == Day)
    }
    let speak = () => {
        Day_.value = filterDay(Day.value!)![0]
        myChart.setOption({
            series: [
                {
                    name: 'pv',
                    data: [Day_.value?.pv!],
                },
                {
                    name: 'uv',
                    data: [Day_.value?.pv!],
                }
            ]
        })
    }
</script>

<template>
    <div class="demo-datetime-picker">
         <div class="block">
      <div class="demonstration">查询时间{{ Day }}</div>
      <el-date-picker
        v-model="Day"
        type="datetime"
        placeholder="您要查询的时间"
        format="YYYY/MM/DD"
        value-format="YYYY-MM-DD"
        @change="speak"
      />
    </div>
    </div>
    <div class="chart" ref="day"></div>
</template>

<style lang="scss" scoped>
.chart {
      height: 160px;
    }
    .demo-datetime-picker {
  display: flex;
  width: 100%;
  padding: 0;
  flex-wrap: wrap;
}
.demo-datetime-picker .block {
  text-align: center;
  border-right: solid 1px var(--el-border-color);
  flex: 1;
}
.demo-datetime-picker .block:last-child {
  border-right: none;
}
.demo-datetime-picker .demonstration {
  display: block;
  color: var(--el-text-color-secondary);
  font-size: 14px;
  margin-bottom: 20px;
}
</style>