<script setup lang="ts">
//@ts-nocheck
import { ref, onMounted, reactive } from 'vue'
import * as echarts from 'echarts'
import useUserStore from '@/store/modules/user';
import { storeToRefs } from 'pinia';
//@ts-ignore
import china from '../../china.json'
    let store = useUserStore()
    let { getUserAddressCount_ } = store
    let { UserAddressCount_ } = storeToRefs(store)
    let main = ref()
    let seriesData = []
    let map = ref()
	let myChart: echarts.ECharts
    onMounted( async () => {
		
        await getUserAddressCount_()
        let name: string[] = []
        let value: number[] = []
		name.push(Object.keys(UserAddressCount_.value))
		value.push(Object.values(UserAddressCount_.value))
        for(let i = 0; i < name[0].length; i++){
			seriesData.push({name: name[0][i], value: value[0][i]})
		}
        echarts.registerMap('china', china)
        myChart = echarts.init(main.value)
        echarts.registerMap('china', china)
	    // 设置基础配置项
	    const option = {
		   
		   // 数据和类型
		   series: [
		   {
			 type: "map",
			 map: "china",
			 roam: true, //是否开启鼠标缩放和平移漫游
			 label: {
			   normal: {
				 show: true, //省份名称
				 textStyle: { color: "#000" }
			   },
			   emphasis: { show: false }
			 },
			 data: seriesData//数据
		   }
		 ],
		   visualMap:{
			 min: 0,
			 max: 50000,
			 text: ['高', '低'],
			 realtime: false,
			 calculable: true,
			 inRange: {
			   color: ['#BEDEFE', '#74B8FC', '#2690FA']
			 }
		   },
			 tooltip: {
			 trigger: 'item',
			 formatter: function(params) {
                console.log(params.value || 0);
			   return `${params.name}: ${params.value || 0}`

			 }
		   }
        }
        myChart.setOption(option)
    })
</script>

<template>
    <div ref="main" style="width: 800px; height: 800px;" class="chart"></div>
</template>

<style lang="scss" scoped>
.chart {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 5;
    height:810px;
    width: 100%;
  }
</style>
