import{ createRouter, createWebHashHistory} from "vue-router"
import HomePage from "../views/HomePage.vue" //import Page
import Guide from "../views/Guide.vue"
import CreateExperience from "../views/Experience/CreateExperience.vue"
import Social from "../views/Social.vue"
import SharePage from "../views/Experience/SharePage.vue"
import UserPage from "../views/UserPage.vue"
import Plant from "../views/Plant/Plant.vue"
import PlantInfo from "../views/Plant/PlantInfo.vue"
import PlantPage from "../views/Plant/PlantPage.vue"
import PlanttypePage from "../views/Plant/PlanttypePage.vue"
import Pest from "../views/Pest/Pest.vue"
import PestPage from "../views/Pest/PestPage.vue"
import GardenPage from "../views/Garden/GardenPage.vue"
import SearchPage from "../views/SearchPage.vue"
import Supplier from "../views/Supplier/Supplier.vue"

const routes = [
  {
    path:"/",component: HomePage
  }, //create route for page
  {
    path:"/Guide",component: Guide
  },
  {
    path:"/CreateExperience",component: CreateExperience
  },
  {
    path:"/Social",component: Social
  },
  {
    path:"/SharePage/:shareid",component: SharePage
  },
  {
    path:"/UserPage/:userId",component: UserPage
  },
  {
    path:"/Plant",component: Plant
  },
  {
    path:"/PlantInfo",component: PlantInfo
  },
  {
    path:"/PlantPage/:plantid",component: PlantPage
  },
  {
    path:"/PlanttypePage/:tagid",component: PlanttypePage
  },
  {
    path:"/Pest",component: Pest
  },
  {
    path:"/PestPage/:pestid",component: PestPage
  },
  {
    path:"/GardenPage/:gardenid",component: GardenPage
  },
  {
    path:"/SearchPage",component: SearchPage
  },
  {
    path:"/Supplier",component: Supplier
  },
]  
  
const router = createRouter({
history:createWebHashHistory(),
routes
  })//create router to use





export default router
