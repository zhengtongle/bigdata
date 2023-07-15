<script setup lang="ts">
    import { onMounted, ref, getCurrentInstance, watch, reactive } from 'vue'
    import useUserStore from '@/store/modules/user';
    import * as echarts from 'echarts'
    import { storeToRefs } from 'pinia';
    let myChart: echarts.ECharts
    let UserAgeCount = ref()
    let store = useUserStore()
    let { getUserAgeCount_ } = store
    let { UserAgeCount_ } = storeToRefs(store)
   let option = {
        title: {
            text: '各年龄用户人数'
        },
        tooltip: {
            trigger: 'axis'
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: [0]
        },
        yAxis: {
            type: 'value',
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
            name: 'Lowest',
            type: 'line',
            data: [0],
            itemStyle: {
                    // 修改柱子圆角
                    barBorderRadius: 5
                    }
            }
        ]
        };
    onMounted(async() => {
        await getUserAgeCount_()
        let ageArray: number[] = []
        let Count: number[] = []
         UserAgeCount_.value?.forEach(item => {ageArray.push(item.age), Count.push(item.count)})
         option.xAxis.data =ageArray
         option.series[0].data = Count
        myChart = echarts.init(UserAgeCount.value)
        myChart.setOption(option)        
    })
</script>

<template>
    <div class="chart" ref="UserAgeCount"></div>
</template>

<style lang="scss" scoped>
.chart {
      height: 240px;
    }
</style>