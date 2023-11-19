<template>
    <div>
      <div v-if="!userId" class="user-info">
        <router-link to="/Register">Register</router-link>
        <router-link to="/Login">Login</router-link>
        
      </div>
      <div v-if="userId" class="user-info">
        <el-dropdown >
    <span class="el-dropdown-link">
      <router-link :to="`/UserPage/${userId}`"><img  :src="userAvatar" class="user-avatar"></router-link>

    </span>
    <template #dropdown>
      <el-dropdown-menu>
        <el-dropdown-item command="a" style="text-align: center; font-size: 30px;">{{ username }}</el-dropdown-item>
        <el-dropdown-item command="b"><router-link :to="`/UserPage/${userId}`">My Page<el-icon size="large"><User /></el-icon></router-link></el-dropdown-item>
        <el-dropdown-item command="c"><router-link to="/GardenPage">Create a Garden<el-icon size="large"><Apple /></el-icon ></router-link></el-dropdown-item>
        <el-dropdown-item command="d" disabled><router-link to="/CreateExperience">Share Experience<el-icon size="large"><MagicStick /></el-icon></router-link></el-dropdown-item>
        <el-dropdown-item command="e" divided><el-button type="danger"  @click="logout">Logout<el-icon size="large"><RemoveFilled /></el-icon></el-button></el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
      </div>
    </div>
    
  </template>
  
  <script lang="ts" setup>
  import { ref, onMounted } from 'vue';
  import { useRouter } from 'vue-router';
  
  const isLoggedIn = ref(false);
  const username = ref('');
  const userAvatar = ref(''); 
  const userId = ref('');
  const router = useRouter();
  
  
  function logout() {
    localStorage.removeItem('user');
    isLoggedIn.value = false;
    router.push('/');
    
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
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-right: 10px;
  }


  </style>