// layout组件相关配置的仓库
import { defineStore } from 'pinia'
import { ref } from 'vue'
const useLayOutSettingStore = defineStore('settingStore', () => {
    let fold = ref(false)   //控制菜单的收起和展开
    let refsh = ref(false)  //控制刷新
    return{
        fold,
        refsh
    }
})

export default useLayOutSettingStore