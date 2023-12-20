<template>
  <el-row>
    <el-col
      v-for="(card, index) in cards"
      :key="card.plantid"
      :span="4"
      :offset="index % 4 === 0 ? 0 : (index % 5 === 1 ? 1 : (index % 5 === 2 ? 2 : (index % 5 === 3 ? 3 : 0)))"
    >
      <el-card :body-style="{ padding: '10px' }">
        <img :src="card.plantpicture" class="plant-picture" alt="" style="width: 200px; height: 200px;"/>
        <div style="padding: 14px">
          <span>{{ card.plantname }}</span> 
          <div class="button">
          <el-button text class="button" @click="() => goPlantPage(card.plantid)" size="large">Enter</el-button>
        </div>
        </div>
      </el-card>
    </el-col>
  </el-row>
</template>

<script setup>
import { defineProps } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';

const props = defineProps({
cards: Array
});
const router = useRouter();

const goPlantPage = async (plantid) => {
try {
  await axios.post(`http://localhost:3000/plant/incrementPlantEnterTime/${plantid}/enter`); 
  router.push(`/PlantPage/${plantid}`);
} catch (error) {
  console.error('Can not enter this page', error);
}
};
</script>

<style scoped>
</style>
