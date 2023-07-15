<script setup lang="ts">
    import { ref } from 'vue'
    import useLayOutSettingStore from '@/store/modules/setting';
    import { storeToRefs } from 'pinia';
    import { useRoute } from 'vue-router';
    let $router = useRoute()
    const setting = useLayOutSettingStore()
    let { fold } = storeToRefs(setting)

    const changeIcon = () => {
        fold.value = !fold.value
    }
</script>
<script lang="ts">
export default {
    name: 'Breadcrumb'
}

</script>

<template>
    <el-icon @click="changeIcon" style="margin-right: 10px;">
    <component :is="fold ? 'Fold' : 'Expand'"></component>
    </el-icon>
    <!-- 左侧面包屑 -->
    <el-breadcrumb separator-icon="ArrowRight" class="tabbar_left">
        <!-- 面包屑动态展示路由的名字以及标题 -->
        <el-breadcrumb-item v-for="(item, index) in $router.matched" :key="index" v-show="item.meta.title" :to="item.path">
            <el-icon style="margin: 0px 5px;">
                <component :is="item.meta.icon"></component>
            </el-icon>
            <span>{{ item.meta.title }}</span>
        </el-breadcrumb-item>
    </el-breadcrumb>
</template>

<style>
    
</style>