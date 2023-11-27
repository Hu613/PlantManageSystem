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
        <el-button type="primary" @click="openCreateGardenDialog">Create Garden</el-button>
        <el-dialog v-model="createDialogVisible" title="Create Garden" width="30%">
        <el-input v-model="gardenName" placeholder="Enter garden name"></el-input>
        <span class="dialog-footer">
        <el-button @click="createDialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="createGarden">Confirm</el-button>
      </span>
    </el-dialog>
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
  import axios from 'axios';
  const dialogVisible = ref(false)
  const isLoggedIn = ref(false);
  const username = ref('');
  const userAvatar = ref(''); 
  const userId = ref('');
  const router = useRouter();
  const gardenName = ref('');
  const createDialogVisible = ref(false);

  function logout() {
    localStorage.removeItem('user');
    isLoggedIn.value = false;
    router.push('/');
    
  }

  const openCreateGardenDialog = () => {
  createDialogVisible.value = true;
};

const createGarden = async () => {
  try {
    const response = await axios.post('http://localhost:3000/garden/createGarden', {
      gardenname: gardenName.value,
      userId: userId.value
    });
    alert('Garden created successfully');
    createDialogVisible.value = false;
  } catch (error) {
    alert('Failed to create garden');
    console.error('Error creating garden:', error);
  }
};
  
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