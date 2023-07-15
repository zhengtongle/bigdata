<script setup lang="ts">
    import useUserStore from '@/store/modules/user';
    import { storeToRefs } from 'pinia';
    import { onMounted } from 'vue'
    let store = useUserStore()
    let { getMaleRatio_ } = store
    let { maleRatio_, femaleRadio_ } = storeToRefs(store)
    onMounted( async() => {
        await getMaleRatio_()
    })
</script>

<template>
    <div class="no">
            <div class="no-hd">
              <ul>
                <li>{{ maleRatio_ }}</li>
                <li>{{ femaleRadio_ }}</li>
              </ul>
            </div>
            <div class="no-bd">
              <ul>
                <li>男士访问用户占比</li>
                <li>女士访问用户占比</li>
              </ul>
            </div>
        </div>
</template>

<style lang="scss" scoped>
    ul{
    list-style: none;
}
.no {
  background: rgba(101, 132, 226, 0.1);
  padding: 15px;
  .no-hd {
    position: relative;
    border: 1px solid rgba(25, 186, 139, 0.17);
    &::before {
      content: "";
      position: absolute;
      width: 30px;
      height: 10px;
      border-top: 2px solid #02a6b5;
      border-left: 2px solid #02a6b5;
      top: 0;
      left: 0;
    }
    &::after {
      content: "";
      position: absolute;
      width: 30px;
      height: 10px;
      border-bottom: 2px solid #02a6b5;
      border-right: 2px solid #02a6b5;
      right: 0;
      bottom: 0;
    }
    ul {
      display: flex;
      li {
        position: relative;
        flex: 1;
        text-align: center;
        height: 80px;
        line-height: 80px;
        font-size: 50px;
        color: #ffeb7b;
        padding: 4 0;
        font-family: electronicFont;
        font-weight: bold;
        &:first-child::after {
          content: "";
          position: absolute;
          height: 50%;
          width: 1px;
          background: rgba(255, 255, 255, 0.2);
          right: 0;
          top: 25%;
        }
      }
    }
  }
  .no-bd ul {
    display: flex;
    li {
      flex: 1;
      height: 40px;
      line-height: 40px;
      text-align: center;
      font-size: 18px;
      color: rgba(255, 255, 255, 0.7);
      padding-top: 10px;
    }
  }
}
</style>