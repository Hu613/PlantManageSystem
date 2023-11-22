<template>
    <div class="demo-collapse">
      <el-collapse v-model="activeNames" @change="handleChange">
        <el-collapse-item title="Consistency" name="1">
          <el-divider />
          <el-table :data="concerns" style="width: 100%">
    <el-table-column prop="concernusername" label="Name" width="180" />
    <el-table-column prop="concernuseravatar" label="Avatar" width="180">
      <template #default="scope">
        <img :src="scope.row.concernuseravatar" alt="Avatar" style="width: 50px; height: 50px;" @click="() => goUserPage(scope.row.concernuserId)"/>
      </template>
    </el-table-column>
  </el-table>
        </el-collapse-item>
      </el-collapse>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import { useRouter } from 'vue-router';

  const userId = ref('');
  const concerns = ref([]);
  const activeNames = ref(['1']);
  const router = useRouter();
  
  const goUserPage = (concernuserId) => {
    router.push(`/UserPage/${concernuserId}`);
    
  };

  onMounted(async () => {
    const userStr = localStorage.getItem('user');
    if (userStr) {
      const user = JSON.parse(userStr);
      userId.value = user.userId;
      try {
        const response = await axios.get(`http://localhost:3000/user/getUserConcern/${userId.value}`);
        if (response.data) {
          concerns.value = response.data.concerns;
        }
      } catch (error) {
        console.error('Error fetching user concerns:', error);
      }
    }
  });
  
  const handleChange = (val) => {
    console.log(val);
  }
  </script>
  