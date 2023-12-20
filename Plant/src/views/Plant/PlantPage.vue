<template>
    <div>
      <h1 class="title">{{ plantData.plantname }}</h1>

      <div class="pictures">
        <br/>
        <img :src="plantData.plantpicture" style="width: 600px; height: 600px;" class="plant-picture" />
      </div>

      <div class="plant-info">
        <h1 class="description">Description :<br /><p>{{ plantData.description }}</p></h1>
      </div>
        <h1 class="description">If you want plant {{ plantData.plantname }}, you will need these :<br /></h1><h2>{{ plantData.plantneed }}</h2>
        <h1 class="description">Where should you plant your {{ plantData.plantname }}?<br /></h1><h2>{{ plantData.wheretoplant }}</h2>
        <h1 class="description">How to plant the {{ plantData.plantname }}?<br /></h1><h2>{{ plantData.howtoplant }}</h2>
        <h1 class="description">When to plant {{ plantData.plantname }}?<br /></h1><h2>{{ plantData.timetoplant }}</h2>

    
     <div class="pest">
      <h1>These Pest careful!</h1>
      <div class="pestshow">
        <el-carousel height="300px"  :interval="4000" type="card" :autoplay="true" class="carousel">
      <el-carousel-item v-for="pest in plantData.pests" :key="pest.pestid">
        <img :src="pest.pestpicture" alt="Pest" @click="goPestPage(pest.pestid)" class="pest-image"/>
      </el-carousel-item>
    </el-carousel>
  </div>
     </div>
     <div class="advise">
      <h1>Advise :</h1>
      <br/><a :href="plantData.planthelp" target="_blank" >{{ plantData.planthelp }}</a>
      
     </div>
    </div>
  </template>
  
  
  <script setup>
  import { ref, onMounted} from 'vue';
  import axios from 'axios';
  import { useRoute, useRouter } from 'vue-router';
  
  const plantid = ref(useRoute().params.plantid);
  const plantData = ref({});
  const route = useRoute();
  const router = useRouter();
  const goPestPage = (pestid) => {
        router.push(`/PestPage/${pestid}`);
    };
  
    onMounted(async () => {
    console.log('plantId from route:', route.params.plantid); 
    console.log('plantId value:', plantid.value); 

    const plantidFromRoute = route.params.plantid;
    

    if (plantidFromRoute) {
      try {
        const response = await axios.get(`http://localhost:3000/plant/getPlantPage/${plantidFromRoute}`);
        if (response.data) {
          plantData.value = response.data;
        }
      } catch (error) {
        console.error('Error fetching share details:', error);
      }
    } else {
      console.error('Plant ID is undefined');
    }
  });
  
  </script>
  <style scoped>
  .title {
    font-size: 50px;
    margin-bottom: 10px;
    text-align: center;
  }
  .plant-info {
    display: flex;
    margin-bottom: 10px;
  }

  .pictures {
    margin-bottom: 10px;
    display: flex;
    justify-content: center;
    height: 100%;
  }
  .plant-picture {
    width: 100%;
    margin-bottom: 10px;
  }
  .description {
    margin-bottom: 10px;
  }

  .pest-image{
    max-width: 100%;
    max-height: 100%;
    width: 500px;
    height: 500px;
    margin-bottom: 10px;
    object-fit: contain;
  }




  </style>
  