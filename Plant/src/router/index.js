import{ createRouter, createWebHashHistory} from "vue-router"
import HomePage from "../views/HomePage.vue"
import RegisterPage from "../views/RegisterPage/RegisterPage.vue"
import Login from "../views/Login/Login.vue"
import CreateExperience from "../views/Experience/CreateExperience.vue"
import Social from "../views/Social.vue"
import SharePage from "../views/Experience/SharePage.vue"
const routes = [
  {
    path:"/",component: HomePage
  },
  {
    path:"/Register",component: RegisterPage
  },
  {
    path:"/Login",component: Login
  },
  {
    path:"/CreateExperience",component: CreateExperience
  },
  {
    path:"/Social",component: Social
  },
  {
    path:"/SharePage/:shareid",component: SharePage, Comment
  }
]  
  
  const router = createRouter({
history:createWebHashHistory(),
routes
  })





export default router
