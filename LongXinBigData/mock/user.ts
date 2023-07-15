function createUserList(){
    return [
        {
            userId: 1,
            avatar: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
            username:'admin',
            password: '111111',
            desc: '平台管理员',
            roles: ['平台管理员'],
            buttons:['cuser.detail'],
            routes: ['home'],
            token: 'Admin Token'
        },
        {
            userId: 2,
            avatar: 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
            username:'system',
            password: '111111',
            desc: '系统管理员',
            roles: ['系统管理员'],
            buttons:['cuser.detail', 'cuser.user'],
            routes: ['home'],
            token: 'System Token'
        }
    ]
}

export default [
    {
        url: '/api/user/login',
        method: 'post',
        response: ({ body })=>{
            const {username, password} = body
            const checkUser = createUserList().find((item) => item.username === username && item.password === password)
            if(!checkUser){
                return { code: 201, data: {message: '账户或密码不对'} }
            }

            const token = checkUser.token
            return { code: 200, data: { token } }
        }
    },
    {
        url: '/api/user/info',
        method: 'get',
        response: (request) => {
            const toekn = request.headers.token

            const checkUser = createUserList().find((item) => item.token === toekn)

            if(!checkUser){
                return { code: 201, data: {message: '获取用户信息失败'} }
            }

            return { code: 200, data: {checkUser} }
        }
    }
]