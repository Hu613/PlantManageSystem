<template>
    <el-row>
      <el-col
        v-for="(card, index) in cards"
        :key="card.id"
          :span="4"
          :offset="index % 4 === 0 ? 0 : (index % 5 === 1 ? 1 : (index % 5 === 2 ? 2 : (index % 5 === 3 ? 3 : 0)))"
      >
        <el-card :body-style="{ padding: '10px' }">
          <img :src="card.pestpicture" class="pest-picture" alt="" style="width: 200px; height: 200px;"/>
          <div style="padding: 14px">
            <span>{{ card.pestname }}</span> 
            <div class="button">
            <el-button text class="button" @click="() => goPestPage(card.pestid)" size="large">Enter</el-button>
          </div>
             
            </div> 
        </el-card>
      </el-col>
    </el-row>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import { useRouter } from 'vue-router';
  const router = useRouter();
  const cards = ref([]);
  
  
  const goPestPage = async (pestid) => {
    try {
      router.push(`/PestPage/${pestid}`);
    } catch (error) {
      console.error('Can not enter this page', error);
    }
  }
  
  
  onMounted(async () => {
    try {
      const response = await axios.get('http://localhost:3000/pest/getpest');
      cards.value = response.data.map(pest => ({
        ...pest,
      }));
    } catch (error) {
      console.error('Failed to fetch pest:', error);
    }
  });
  </script>
  
  <style scoped>
  .button {
    padding: 0;
    min-height: auto;
  }
 
  </style>
  