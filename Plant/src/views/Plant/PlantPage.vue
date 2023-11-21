<template>
    <div>
      <h1 class="title">{{ plantData.plantname }}</h1>

      <div class="plant-info">
        <h1 class="description">Description :<br /><p>{{ plantData.description }}</p></h1>
      </div>
      <div class="pictures">
        <br/>
        <img :src="plantData.plantpicture" class="plant-picture" />
      </div>
     <div class="pest">
      <h1>These Pest careful!</h1>
      <Pestcard :pest-id="plantData.pestid"></Pestcard>
     </div>
    </div>
  </template>
  
  
  <script setup>
  import { ref, onMounted} from 'vue';
  import axios from 'axios';
  import { useRoute } from 'vue-router';
  import Pestcard from '../../components/content/pestcontent/pestcard.vue';
  const plantid = ref(useRoute().params.plantid);
  const plantData = ref({});
  const route = useRoute();

  
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

  </style>
  