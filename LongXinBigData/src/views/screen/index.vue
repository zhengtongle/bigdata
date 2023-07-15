<script setup lang="ts">
  import Days from '@/components/Days.vue'
  import Conversion_rate from '@/components/Conversion_rate.vue'
  import Week from '@/components/Week.vue'
  import CustomerTypeCount from '@/components/CustomerTypeCount.vue'
  import CMap from '@/components/CMap.vue'
  import TotalPv from '@/components/TotalPv.vue'
  import Headers from '@/components/Headers.vue'
  import Radio from '@/components/Radio.vue'
  import { onMounted, watch, ref, watchEffect } from 'vue'
  import { storeToRefs } from 'pinia'
  import UserAgeCount from '@/components/UserAgeCount.vue'
</script>

<template>
  
  <div class="back">
    <Headers/>
    <div class="mainbox">
      <div class="scroll">
        <el-scrollbar>
        <div class="column">
          <div class="panel bar">
            <h2>日期查询</h2>
            <Days/>
            <div class="panel-footer"></div>
          </div>
          <div class="panel line">
            <h2>销售详情</h2>
            <Conversion_rate/>
            <div class="panel-footer"></div>
          </div>
          <div class="panel pie">
            <h2>各年龄用户人数</h2>
            <UserAgeCount/>
            <div class="panel-footer"></div>
          </div>
        </div>
        </el-scrollbar>
      </div>
      <div class="scroll">
        <div class="column">
          <TotalPv/>
          <div class="map">
            <h2>各地用户人数热力图</h2>
            <CMap/>
            <div class="map1"></div>
            <div class="map2"></div>
            <div class="map3"></div>
          </div>
        </div>
      </div>
      <div class="scroll">
        <div class="panel pie">
          <h2>本周详情</h2>
            <Week/>
            <div class="panel-footer"></div>
          </div>
          <div class="panel pie">
            <h2>各类用户人数</h2>
            <CustomerTypeCount/>
            <div class="panel-footer"></div>
          </div>
          <div class="panel pie">
            <h2>男女用户占比</h2>
            <Radio/>
            <div class="panel-footer"></div>
          </div>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.back{
  width: 100%;
  height: 100%;
  background-image: url('../images/bg.jpg');
}
.mainbox {
  padding: 0.125rem 0.125rem 0;
  display: flex;
  .scroll {
    flex: 3;
  }
  .scroll:nth-child(2) {
    flex: 5;
  }
  
  .panel {
    position: relative;
    height: 310px;
    border: 1px solid rgba(25, 186, 139, 0.17);
    background: url('../images/line\(1\).png');
    padding: 0 15px 40px;
    margin-bottom: 15px;
    &::before {
      position: absolute;
      top: 0;
      left: 0;
      content: "";
      width: 10px;
      height: 10px;
      border-top: 2px solid #02a6b5;
      border-left: 2px solid #02a6b5;
    }
    &::after {
      position: absolute;
      top: 0;
      right: 0;
      content: "";
      width: 10px;
      height: 10px;
      border-top: 2px solid #02a6b5;
      border-right: 2px solid #02a6b5;
    }
    .panel-footer {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      &::before {
        position: absolute;
        bottom: 0;
        left: 0;
        content: "";
        width: 10px;
        height: 10px;
        border-bottom: 2px solid #02a6b5;
        border-left: 2px solid #02a6b5;
      }
      &::after {
        position: absolute;
        bottom: 0;
        right: 0;
        content: "";
        width: 10px;
        height: 10px;
        border-bottom: 2px solid #02a6b5;
        border-right: 2px solid #02a6b5;
      }
    }
    h2 {
      height: 48px;
      line-height: 20px;
      text-align: center;
      color: #fff;
      font-size: 20px;
      font-weight: 400;
    }
  }
  /* 声明字体*/
@font-face {
  font-family: electronicFont;
  src: url('../font/DS-DIGIT.TTF');
}
li{
  list-style: none;
}
.map {
  h2 {
      height: 48px;
      line-height: 20px;
      text-align: center;
      color: #fff;
      font-size: 20px;
      font-weight: 400;
    }
  position: relative;
  height: 810px;

  .map1,
  .map2,
  .map3 {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 518px;
    height: 518px;
    background: url('../images/map.png') no-repeat;
    background-size: 100% 100%;
    opacity: 0.3;
  }
  .map2 {
    width: 643px;
    height: 643px;
    background-image: url('../images/lbx.png');
    opacity: 0.6;
    animation: rotate 15s linear infinite;
    z-index: 2;
  }
  .map3 {
    width: 566px;
    height: 566px;
    background-image: url('../images/jt.png');
    animation: rotate1 10s linear infinite;
  }

  @keyframes rotate {
    from {
      transform: translate(-50%, -50%) rotate(0deg);
    }
    to {
      transform: translate(-50%, -50%) rotate(360deg);
    }
  }
  @keyframes rotate1 {
    from {
      transform: translate(-50%, -50%) rotate(0deg);
    }
    to {
      transform: translate(-50%, -50%) rotate(-360deg);
    }
  }
}
}
</style>