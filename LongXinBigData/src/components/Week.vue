<script setup lang="ts">
    import { onMounted, ref, getCurrentInstance, watch, reactive } from 'vue'
    import useUserStore from '@/store/modules/user';
    import * as echarts from 'echarts'
    import { storeToRefs } from 'pinia';
    let Week = ref()
    let myChart :echarts.ECharts
    let store = useUserStore()
    let { getWeek_ } = store
    let { Week_ } = storeToRefs(store)
    let option = {
        legend: {},
        tooltip: {},
        dataset: {
            source: [
                ['product', '星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
                ['pv',],
                ['follow',],
                ['cart',],
                ['buy']
            ]
        },
        xAxis: { type: 'category' },
        yAxis: {
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
        series: [{ 
            type: 'bar',
            itemStyle: {
                    // 修改柱子圆角
                    barBorderRadius: 5
                    }
        },{
            type: 'bar',
            itemStyle: {
                    // 修改柱子圆角
                    barBorderRadius: 5
                    }
        },{
            type: 'bar',
            itemStyle: {
                    // 修改柱子圆角
                    barBorderRadius: 5
                    }
        }
    ]
        };
    onMounted( async () => {
        
        myChart = echarts.init(Week.value)
        await getWeek_()
        
        let pv: number[] = []
        let follow: number[] = []
        let cart: number[] = []
        let buy: number[] = []
        Week_.value?.forEach(item => {
            //@ts-ignore
            option.dataset.source[1].push(item.pv)
            //@ts-ignore
            option.dataset.source[2].push(item.follow)
            //@ts-ignore
            option.dataset.source[3].push(item.cart)
            //@ts-ignore
            option.dataset.source[4].push(item.buy)
        })
        myChart.setOption(option)
    })
</script>

<template>

<div class="chart" ref="Week"></div>
</template>

<style lang="scss" scoped>
.chart{
    height: 300px;
}
</style>