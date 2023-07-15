<script setup lang="ts">
    import * as echarts from 'echarts'
    import useUserStore from '@/store/modules/user';
    import { ref, onMounted, reactive } from 'vue'
    import { storeToRefs } from 'pinia';
    import type { Conversion_rate } from '@/api/use/type'
    let myChart: echarts.ECharts
    let conversion_rate = ref()
    let store = useUserStore()
    let { Conversion_rate_ } = storeToRefs(store)
    let { getConversion_rate_ } = store
    getConversion_rate_()
    let option = reactive({
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow'
    }
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: [
    {
      type: 'category',
      data: ['pv', 'fav', 'cart', 'favcart', 'buy'],
      axisTick: {
        alignWithLabel: true
      },
      axisLabel: {
          color: "rgba(255,255,255,.6)",
          fontSize: "12"
      },
    }
  ],
  yAxis: [
    {
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
    }
  ],
  series: [
    {
      name: 'Direct',
      type: 'bar',
      barWidth: '60%',
      data: [0, 0, 0, 0, 0],
      itemStyle: {
        // 修改柱子圆角
        barBorderRadius: 5
        }
    }
  ]
});
    onMounted( async() => {
      await getConversion_rate_()
      option.series[0].data =  [Conversion_rate_.value?.pv!, Conversion_rate_.value?.fav!, Conversion_rate_.value?.cart!, Conversion_rate_.value?.favCart!, Conversion_rate_.value?.buy!]
      myChart = echarts.init(conversion_rate.value)
        myChart.setOption(option)
    })
</script>

<template>
    <div class="chart" ref="conversion_rate"></div>
</template>

<style lang="scss" scoped>

.chart {
      height: 240px;
    }
</style>