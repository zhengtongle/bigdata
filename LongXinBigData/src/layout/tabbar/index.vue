<script setup lang="ts">

    import Breadcrumb from './breadcrumb/index.vue'
    import Setting from './setting/index.vue'
</script>
<script lang="ts">
export default {
    name: 'Tabbar'
}
</script>

<template>
    <div class="tabbar">
        <div class="tabbar_left">
            <Breadcrumb/>
        </div>

        <div class="tabbar_right">
            <Setting/>
        </div>
    </div>

</template>

<style lang="scss" scoped>
    .tabbar{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: space-between;
        color: black;
        background-image: linear-gradient(to right, white, rgb(36, 27, 27), white);
        .tabbar_left{
            display: flex;
            align-items: center;
            margin-left: 20px;
        }
        .tabbar_right{
            display: flex;
            align-items: center;
            img{
                margin: 0 10px;
            }
        }
    }
</style>