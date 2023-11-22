<template>
 <div class="tag">
    <el-tag v-for="tag in tags" :key="tag.tagid" class="ml-2" style="cursor: pointer" type="success" @click="() => goPlanttypePage(tag.tagid)">
      {{ tag.title }}
    </el-tag>
  </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import { useRouter } from 'vue-router';
  const router = useRouter();
  const tags = ref([]);

  const goPlanttypePage = async (tagid) => {
      try {
        router.push(`/PlanttypePage/${tagid}`);
      } catch (error) {
        console.error('Can not enter this page', error);
      }
    }
  
  
  onMounted(async () => {
    try {
      const response = await axios.get('http://localhost:3000/tag/gettag');
      tags.value = response.data.map(tag => ({
        ...tag,
      }));
    } catch (error) {
      console.error('Failed to fetch tag:', error);
    }
  });
  </script>
  
  <style scoped>
  

  
  </style>
  