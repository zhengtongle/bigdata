<script setup lang="ts">
import { ref } from 'vue'
let showTime = ref()
    let t: any  = null;
            t = setTimeout(time, 1000);//開始运行
            function time() {
                clearTimeout(t);//清除定时器
                let dt: any = new Date();
                var y = dt.getFullYear();
                var mt = dt.getMonth() + 1;
                var day = dt.getDate();
                var h = dt.getHours();//获取时
                var m = dt.getMinutes();//获取分
                var s = dt.getSeconds();//获取秒
                showTime.value.innerHTML = '当前时间：' + y + "年" + mt + "月" + day + "-" + h + "时" + m + "分" + s + "秒";
                t = setTimeout(time, 1000); //设定定时器，循环运行     
            }
</script>

<template>
    <header>
        <h1>基于龙芯平台的电商用户大数据分析</h1>
        <div class="showTime" ref="showTime"></div>
    </header>
</template>

<style lang="scss" scoped>
header {
  position: relative;
  height: 100px;
  background: url(../images/head_bg.png) no-repeat top center;
  background-size: 100% 100%;
  h1 {
    font-size: 38px;
    color: #fff;
    text-align: center;
    line-height: 80px;
  }
  .showTime {
    position: absolute;
    top: 0;
    right: 30px;
    line-height: 80px;
    font-size: 20px;
    color: rgba(255, 255, 255, 0.7);
  }
}
</style>