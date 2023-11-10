import{ createRouter, createWebHashHistory} from "vue-router"
import HomePage from "../views/HomePage.vue"
import RegisterPage from "../views/RegisterPage/RegisterPage.vue"
import Login from "../views/Login/Login.vue"

const routes = [
  {
    path:"/",component: HomePage
  },
  {
    path:"/Register",component: RegisterPage
  },
  {
    path:"/Login",component: Login
  }
]  
  
  const router = createRouter({
history:createWebHashHistory(),
routes
  })





export default router
