//@ts-nocheck
export const constantRoute = [
    {
        path: '/',
        component: () => import('@/layout/index.vue'),
        name: 'home',
        meta: {
            title: '',
            hidden: false,
            icon: 'House'

        },
        redirect: '/home',
        children:[
            {
                path:'/home',
                component: () => import('@/views/home/index.vue'),
                meta:{
                    title:'首页',
                    hidden: false,
                    icon: 'HomeFilled'

                }
            }
        ]
    },
    //数据大屏
    {
        path: '/screen',
        component: () => import('@/views/screen/index.vue'),
        name: 'Screen',
        meta: {
            hidden: false,
            title: '数据大屏',
            icon: 'Platform'
        },
    },
    {
        path: '/product',
        component: () => import('@/layout/index.vue'),
        name: 'Product',
        meta: {
            hidden: false,
            title: '商品管理',
            icon: 'Goods'
        }, 
        redirect: '/product/sku',
        children:[
            {
                path: '/product/sku',
                component: () => import('@/views/product/sku/index.vue'),
                name: 'Sku',
                meta: {
                    hidden: false,
                    title: 'SKU管理',
                    icon: 'Calendar'
                }
            }
        ]
    },
    {
        path: '/404',
        component: () => import('@/views/404/index.vue'),
        name: '404',
        meta: {
            title: '404',
            hidden: true
        }
    },
    //当没有与其他路由进行配对时匹配此路由, 匹配任意路由
    {
        path: '/:pathMatch(.*)*',
        redirect: '/404',
        name: 'Any',
        meta: {
            title: '任意路由',
            hidden: true
        }
    },
] 