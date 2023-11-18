<template>
    <div>
      <div v-if="!userId" class="user-info">
        <router-link to="/Register">Register</router-link>
        <router-link to="/Login">Login</router-link>
        
      </div>
      <div v-if="userId" class="user-info">
        <el-dropdown >
    <span class="el-dropdown-link">
        <router-link to="/UserPage"><img  :src="userAvatar" class="user-avatar"></router-link><el-icon class="el-icon--right"><span>{{ username }}</span><arrow-down /></el-icon>

    </span>
    <template #dropdown>
      <el-dropdown-menu>
        <el-dropdown-item command="a"><router-link to="/UserPage">My Page</router-link></el-dropdown-item>
        <el-dropdown-item command="b"><router-link to="/Collection">My Collection</router-link></el-dropdown-item>
        <el-dropdown-item command="c"><router-link to="/GardenPage">Create a Garden</router-link></el-dropdown-item>
        <el-dropdown-item command="d" disabled><router-link to="/CreateExperience">Share Experience</router-link></el-dropdown-item>
        <el-dropdown-item command="e" divided><el-button type="danger" :icon="Delete" circle @click="logout"></el-button></el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
      </div>
    </div>
    
  </template>
  
  <script lang="ts" setup>
  import { ref, onMounted } from 'vue';
  import { useRouter } from 'vue-router';
  import { Delete } from '@element-plus/icons-vue'
  import { ArrowDown } from '@element-plus/icons-vue'
  
  const isLoggedIn = ref(false);
  const username = ref('');
  const userAvatar = ref(''); 
  const userId = ref('');
  const router = useRouter();
  
  
  function logout() {
    localStorage.removeItem('user');
    isLoggedIn.value = false;
    router.push('/');
    location.reload();
  }
  
  onMounted(() => {
    const userStr = localStorage.getItem('user');
    if (userStr) {
      const user = JSON.parse(userStr);
      isLoggedIn.value = true;
      username.value = user.username;
      userId.value = user.userId;
      userAvatar.value = `http://localhost:3000/${user.useravatar}`;
;
    }
  });
  </script>
  
  <style scoped>
  .user-info {
    display: flex;
    align-items: center;
  }
  .user-avatar {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin-right: 10px;
  }


  </style>