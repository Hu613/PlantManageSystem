<template>
    <div>
      <h1 class="title">{{ tagData.title }}</h1>

      <div class="plant-info">
        <h1 class="description">Description :<br /><p>{{ tagData.description }}</p></h1>
      </div>
      <div class="pictures">
        <br/>
        <img :src="tagData.tagpicture" style="width: 500px; height: 500px;" class="tag-picture" />
      </div>
     <div class="pest">
      <h1>This type of plant</h1>
      <div class="plantshow">
    <el-carousel height="150px">
      <el-carousel-item v-for="plant in tagData.plants" :key="plant.plantid">
        <img :src="plant.plantpicture" alt="Plant" @click="goPlantPage(plant.plantid)" class="plant-image"/>
      </el-carousel-item>
    </el-carousel>
  </div>
     </div>
     <div class="advise">
      <h1>Advise :</h1>
      <br/><a :href="tagData.adviselink" target="_blank" >{{ tagData.adviselink }}</a>
     </div>
     <div class="supplier">
      <h1>This type of plant's suppliers</h1>
      <el-table :data="suppliers" style="width: 100%">
        <el-table-column prop="suppliername" label="Supplier Name" width="180" />
        <el-table-column prop="description" label="Description" />
        <el-table-column
          prop="supplierlink"
          label="Supplier Link"
          width="1000"
          >
          <template #default="scope">
            <a :href="scope.row.supplierlink" target="_blank">{{ scope.row.suppliername }}</a>
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
  
  const tagid = ref(useRoute().params.tagid);
  const tagData = ref({});
  const suppliers = ref([]);
  const route = useRoute();
  const router = useRouter();
  const goPlantPage = (plantid) => {
        router.push(`/PlantPage/${plantid}`);
    };
  
    onMounted(async () => {
    console.log('tagId from route:', route.params.tagid); 
    console.log('tagId value:', tagid.value); 

    const tagidFromRoute = route.params.tagid;
    

    if (tagidFromRoute) {
      try {
        const response = await axios.get(`http://localhost:3000/tag/getPlanttypePage/${tagidFromRoute}`);
        if (response.data) {
          tagData.value = response.data;
          suppliers.value = response.data.suppliers;
        }
      } catch (error) {
        console.error('Error fetching tag details:', error);
      }
    } else {
      console.error('tag ID is undefined');
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
  