<template>
    <div>
      <h1 class="title">{{ pestData.pestname }}</h1>

      <div class="pictures">
        <br/>
        <img :src="pestData.pestpicture" style="width: 600px; height: 600px;" class="pest-picture" />
      </div>

      <div class="pest-info">
        <h1 class="description">Description :<br /><p>{{ pestData.description }}</p></h1>
      </div>
    
     <div class="pest">
      <h1>It may appear on these plants!!!!</h1>
      <div class="pestshow">
    <el-carousel height="600px" :interval="4000" type="card" :autoplay="true" class="carousel">
      <el-carousel-item v-for="plant in pestData.plants" :key="plant.plantid">
        <img :src="plant.plantpicture" alt="Plant" @click="goPlantPage(plant.plantid)" class="plant-picture"/>
      </el-carousel-item>
    </el-carousel>
  </div>
     </div>
     <div class="advise">
      <h1>These might help you :</h1>
      <h1 class="pestcontrol">PestControl :<br /><p>{{ pestData.pestcontrol }}</p></h1>
      <h1 class="prevention">Prevention :<br /><p>{{ pestData.prevention }}</p></h1>
     </div>

     <div class="supplier">
        <h1>These places sell things that specialize in this pest!</h1>
        <el-table :data="suppliers" style="width: 100%">
        <el-table-column prop="suppliername" label="Supplier Name" width="180" />
        <el-table-column prop="description" label="Description" />
        <el-table-column
          prop="supplierlink"
          label="Supplier Link"
          width="1000"
          >
          <template #default="scope">
            <a :href="scope.row.supplierlink" target="_blank">{{ scope.row.supplierlink }}</a>
          </template>
        </el-table-column>
      </el-table>
     </div>
    </div>
  </template>
  
  
  <script setup>
  import { ref, onMounted} from 'vue';
  import axios from 'axios';
  import { useRoute, useRouter } from 'vue-router';
  
  const pestid = ref(useRoute().params.pestid);
  const pestData = ref({});
  const suppliers = ref([]);
  const route = useRoute();
  const router = useRouter();
  const goPlantPage = (plantid) => {
        router.push(`/PlantPage/${plantid}`);
    };
  
    onMounted(async () => {
    console.log('pestId from route:', route.params.pestid); 
    console.log('pestId value:', pestid.value); 

    const pestidFromRoute = route.params.pestid;
    

    if (pestidFromRoute) {
      try {
        const response = await axios.get(`http://localhost:3000/pest/getPestPage/${pestidFromRoute}`);
        if (response.data) {
          pestData.value = response.data;
          suppliers.value = response.data.suppliers;
        }
      } catch (error) {
        console.error('Error fetching pest details:', error);
      }
    } else {
      console.error('pest ID is undefined');
    }
  });
  
  </script>
  <style scoped>
  .title {
    font-size: 50px;
    margin-bottom: 10px;
    text-align: center;
  }
  .pest-info {
    display: flex;
    margin-bottom: 10px;
  }

  .pictures {
    margin-bottom: 10px;
    display: flex;
    height: 100%;
    justify-content: center;
  }
  .plant-picture {
    max-width: 100%;
    max-height: 100%;
    margin-bottom: 10px;
    object-fit: contain;
  }

  .description {
    margin-bottom: 10px;
  }
  </style>
  