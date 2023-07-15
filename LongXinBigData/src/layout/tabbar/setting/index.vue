<script setup lang="ts">
    import useLayOutSettingStore from '@/store/modules/setting';
    import { storeToRefs } from 'pinia';
    import { useRouter, useRoute } from 'vue-router';
    const setting  = useLayOutSettingStore()
    const { refsh } = storeToRefs(setting)

    let $router = useRouter()
    let $route = useRoute()
    //刷新功能
    const updata = () => {
        refsh.value = !refsh.value
    }

    // 全屏功能设置
    const fullScreen = () => {

        // DOM对象的一个属性， 可以用来判断当前是不是全屏
        let full = document.fullscreenElement    
        if( !full ){
            document.documentElement.requestFullscreen()
        }else{
            document.exitFullscreen()
        }
    }
</script>
<script lang="ts">
export default {
    name: 'Setting'
}

</script>


<template>
    <el-button icon="RefreshRight" circle @click="updata"></el-button>
    <el-button icon="FullScreen" circle @click="fullScreen"></el-button>
    <el-button icon="Setting" circle></el-button>
    <el-dropdown>
            <span class="el-dropdown-link">
                <el-icon class="el-icon--right"><arrow-down /></el-icon>
            </span>
            <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item @click="">退出登录</el-dropdown-item>
                </el-dropdown-menu>
            </template>
     </el-dropdown>
</template>

<style>

</style>