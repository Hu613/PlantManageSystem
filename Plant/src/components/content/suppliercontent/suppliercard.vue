<template>
    <el-card class="box-card" v-for="(card, index) in cards" :key="index">
      <template #header>
        <div class="card-header">
          <span>{{ card.suppliername }}</span>
          <el-icon @click="golink(card.supplierlink)"><Share /></el-icon>
        </div>
      </template>
      <div class="text item">{{card.description }}</div>
    </el-card>
  </template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';



const cards = ref([]);

const golink = (supplierlink) =>{
    window.open(supplierlink,'_blank');
}

onMounted(async () => {
  try {
    const response = await axios.get('http://localhost:3000/supplier/getsupplier');
    cards.value = response.data.map(supplier => ({
      ...supplier,
      
    }));
    console.log('supplierdata', response.data);
  } catch (error) {
    console.error('Failed to fetch supplier:', error);
  }
});
</script>
  
  <style>
  .card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  .text {
    font-size: 14px;
  }
  
  .item {
    margin-bottom: 18px;
  }
  
  .box-card {
    width: 200px;
  }
  </style>
  