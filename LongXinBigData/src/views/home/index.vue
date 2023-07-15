<script setup lang="ts">
    
</script>

<template>
    <div class="back">
        <div class="map">
            <div class="text">欢迎来到基于龙芯平台的用户大数据分析</div>
            <div class="map1"></div>
            <div class="map2"></div>
            <div class="map3"></div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
.text{
    position: absolute;
    color: white;
    top: 300px;
    left: 270px;
    font-size: 300%;
}
.back{
    position: relative;
    width: 100%;
    height: 100%;
    background-image: url('../images/bg.jpg');
}
.map {
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

</style>