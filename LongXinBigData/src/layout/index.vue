
<script setup lang="ts">
    //@ts-nocheck
    import Logo from './logo/index.vue'
    import Menu from './menu/index.vue'
    import useUserStore from '@/store/modules/user.ts'
    import { useRoute } from 'vue-router';
    import Tabbar from './tabbar/index.vue'
    import Main from './main/index.vue'
    import useLayOutSettingStore from '@/store/modules/setting';
    import { storeToRefs } from 'pinia';
    let user= useUserStore()
    let { menuRoutes } = user
    let setting = useLayOutSettingStore()
    let { fold } =  storeToRefs(setting)
    let $router = useRoute()
</script>
<script lang="ts">
    export default {
        name: 'Layout'
    }
</script>


<template>
    <div class="layout_container">

        <!-- 左侧菜单栏 -->
        <div class="layout_slider" :class="{fold: fold? true: false}">
            <Logo></Logo>

            <!-- 展示菜单 -->
            <!-- 滚动组件 -->
            <el-scrollbar class="scrollbar">
                <!-- 菜单组件 -->
                <el-menu :default-active="$router.path" background-color="#001529" text-color="white" active-text-color="yellowgreen" :collapse="fold">
                    <!-- 根据路由生成菜单 -->
                    <Menu :menuList="menuRoutes"></Menu>
                </el-menu>
                
            </el-scrollbar>
        </div>
        <!-- //顶部导航栏 -->
        <div class="layout_tabbar" :class="{fold: fold? true: false}">
            <Tabbar></Tabbar>
        </div>
        <!-- 内容展示区 -->
        <div class="layout_main" :class="{fold: fold? true: false}">
            <Main></Main>
        </div>
    </div>
</template>

<style scoped lang="scss">
    .layout_container{
        width: 100%;
        height: 100vh;
        
        // 左侧菜单样式
        .layout_slider{
            width: 260px;
            height: 100vh;
            background: #001529;
            color: white;
            transition: all 0.3s;
            .scrollbar{
                width: 100%;
                height: calc(100vh - 50px);

            }
            &.fold{
                width: calc(260px - 210px);
                left: 45px;
            }
        }


        // 顶部导航
        .layout_tabbar{
            position: fixed;
            width: calc(100% - 260px);
            height: 50px;
            top: 0;
            left: 260px;
            transition: all 0.3s;
            &.fold{
                width: calc(100% - 45px);
                left: 50px;
            }
        }


        .layout_main{
            position: absolute;
            width: calc(100% - 260px);
            height: calc(100vh - 50px);
            left: 260px;
            top: 50px;
            padding:20px;
            overflow: auto;
            transition: all 0.3s;
            &.fold{
                width: calc(100% - 45px);
                left: 45px;
            }
        }
    }

    // 滚动条外观设置
    ::-webkit-scrollbar{
        width: 10px;
    }

    ::-webkit-scrollbar-track{
        background: #001529;
    }

    ::-webkit-scrollbar-thumb{
        width: 10px;
        background: yellowgreen;
        border-radius: 10px;
    }

</style>