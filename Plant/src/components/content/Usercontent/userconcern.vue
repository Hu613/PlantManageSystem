<template>
    <div class="demo-collapse">
         <div v-for="concerns in concerns">
        <img :src="concerns.concernuseravatar" alt="Avatar" style="width: 50px; height: 50px; cursor: pointer; border-radius: 50%; box-shadow: 0 2px 4px rgba(0,0,0.2);" @click="() => goUserPage(concerns.concernuserId)"/>
        <span style="font-size: 25px; color: black;">{{ concerns.concernusername }}</span>
      </div>
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
  