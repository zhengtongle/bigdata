<script setup lang="ts">
//@ts-ignore
    import setting from '@/setting.ts'
    import useLayOutSettingStore from '@/store/modules/setting';
    import { storeToRefs } from 'pinia';
    // 第三方集成动画
    import 'animate.css';
    const set = useLayOutSettingStore()
    let { fold } = storeToRefs(set)
</script>
<script lang="ts">
    export default {
        name: 'Logo'
    }
</script>


<template>
    <div class="logo">
        <!-- <img :src="setting.logo" alt=""> -->
        <transition 
            name="animate__animated animate__bounce"
            appear
            enter-active-class="animate__zoomIn"
            leave-active-class="animate__zoomOut"
        >
            <p v-show="!fold">{{setting.title}}</p>
        </transition>
        
    </div>
</template>

<style scoped lang="scss">
    .logo {
        width: 100%;
        height: 44px;
        color: white;
        display: flex;
        align-items: center;
        img {
            width: 50px;
            height: 50px;
        }
        p{
            font-size: 20px;
        }
    }

</style>