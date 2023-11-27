<template>
  <div class="Plantinfo">
      <h1>Plant</h1>
      <el-select v-model="selectedTag" class="m-2" placeholder="Select" size="large" @change="fetchPlantsByTag">
          <el-option
            v-for="item in tags"
            :key="item.tagid"
            :label="item.title"
            :value="item.tagid"
          />
          <el-option label="All" value="all"></el-option>
      </el-select>

      <h1>List: </h1><br/>
      <plantcard :cards="filteredPlants"></plantcard>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import plantcard from '../../components/content/plantcontent/plantcard.vue';

const selectedTag = ref('all');
const tags = ref([]);
const filteredPlants = ref([]);

const fetchPlantsByTag = async () => {
  if (selectedTag.value === 'all') {
    try {
      const response = await axios.get('http://localhost:3000/plant/getplant');
      filteredPlants.value = response.data;
    } catch (error) {
      console.error('Error fetching all plants:', error);
      filteredPlants.value = [];
    }
  } else {
    try {
      const response = await axios.get(`http://localhost:3000/tag/getPlanttypePage/${selectedTag.value}`);
      filteredPlants.value = response.data.plants;
    } catch (error) {
      console.error('Error fetching plants for tag:', error);
      filteredPlants.value = [];
    }
  }
};

onMounted(async () => {
  try {
    const tagResponse = await axios.get('http://localhost:3000/tag/gettag');
    tags.value = tagResponse.data;
    fetchPlantsByTag();
  } catch (error) {
    console.error('Error fetching initial data:', error);
  }
});
</script>
