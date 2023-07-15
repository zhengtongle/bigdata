<script setup lang="ts">
    import { onMounted, ref, getCurrentInstance, watch, reactive } from 'vue'
    import useUserStore from '@/store/modules/user';
    import * as echarts from 'echarts'
    import { storeToRefs } from 'pinia';
    let CustomerTypeCount = ref()
    let store = useUserStore()
    let { getCustomerTypeCount_ } = store
    let { CustomerTypeCount_ } = storeToRefs(store)
    let myChart :echarts.ECharts
    let option = {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c}'
        },
        legend: {
            data: ['Show', 'Click', 'Visit', 'Inquiry', 'Order']
        },
        series: [
            {
            name: 'Funnel',
            type: 'funnel',
            left: '10%',
            top: 60,
            bottom: 60,
            width: '80%',
            min: 0,
            max: 100,
            minSize: '0%',
            maxSize: '100%',
            sort: 'descending',
            gap: 2,
            label: {
                show: true,
                position: 'inside'
            },
            labelLine: {
                length: 10,
                lineStyle: {
                width: 1,
                type: 'solid'
                }
            },
            itemStyle: {
                borderColor: '#fff',
                borderWidth: 1
            },
            emphasis: {
                label: {
                fontSize: 20
                }
            },
            data: [
                { value: 60, name: '重要价值用户' },
                { value: 40, name: '消费潜力用户' },
                { value: 20, name: '频次深耕用户' },
                { value: 80, name: '新客户' },
                { value: 100, name: '重要价值流失预警客户' },
                {value: 10, name: '高消费客户'}
            ]
            }
        ]
        };
    onMounted( async () => {
        await getCustomerTypeCount_()
        myChart = echarts.init(CustomerTypeCount.value)
        option.series[0].data[0].value = CustomerTypeCount_.value['重要价值用户']
        option.series[0].data[1].value = CustomerTypeCount_.value['消费潜力用户']
        option.series[0].data[2].value = CustomerTypeCount_.value['频次深耕用户']
        option.series[0].data[3].value = CustomerTypeCount_.value['新客户']
        option.series[0].data[4].value = CustomerTypeCount_.value['重要价值流失预警客户']
        option.series[0].data[5].value = CustomerTypeCount_.value['高消费客户']
        myChart.setOption(option)
    })
</script>

<template>
    <div class="chart" ref="CustomerTypeCount"></div>
</template>

<style lang="scss" scoped>
.chart{
    height: 240px;
}
</style>