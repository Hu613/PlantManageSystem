<template>
  <div class="supplier-card">
    <el-row gutter={20}>
      <el-col :span="6" v-for="(card,index) in cards" :key="index">
    <el-card class="box-card">
      <template #header>
        <div class="card-header">
          <span>{{ card.suppliername }}</span>
          <div class="icon" style="cursor: pointer;">
          <el-icon @click="golink(card.supplierlink)"><Share /></el-icon>
        </div>
        </div>
      </template>
      <div class="description">{{card.description }}</div>
    </el-card>
    </el-col>
  </el-row>
  </div>
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
  
  <style scoped>
.supplier-card {
  padding: 20px;
}

.box-card {
  border: 1px solid #ebebeb;
  box-shadow: 0 2px 4px rgba(152, 48, 48, 0.1);
  border-radius: 10px;
  overflow: hidden;
  transition: transform 0.3s ease;
}

.box-card:hover {
  transform: translateY(-50px);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 10px;
}

.card-header h3 {
  margin: 0;
  color: #333;
}

.description {
  padding: 15px;
  font-size: 14px;
  color: #666;
}
  </style>
  