<template>
    <div>
      <h1 class="title">{{ plantData.plantname }}</h1>

      <div class="plant-info">
        <h1 class="description">Description :<br /><p>{{ plantData.description }}</p></h1>
      </div>
      <div class="pictures">
        <br/>
        <img :src="plantData.plantpicture" style="width: 500px; height: 500px;" class="plant-picture" />
      </div>
     <div class="pest">
      <h1>These Pest careful!</h1>
      <div class="pestshow">
    <el-carousel height="150px">
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
  <style>
  .title {
    font-size: 24px;
    margin-bottom: 10px;
  }
  .plant-info {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
  }

  .pictures {
    margin-bottom: 10px;
  }
  .plant-picture {
    width: 100%;
    margin-bottom: 10px;
  }
  .description {
    margin-bottom: 10px;
  }
  .el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
  </style>
  