<template>
    <div class="usercontent">
      <!-- if user is not login, display login and register button -->
      <div v-if="!userId" class="user-actions">
        <el-button class="user-link" @click="dialogVisibleregister = true">
    Register
  </el-button>
        <el-button class="user-link" @click="dialogVisible = true">
    Login
  </el-button>

  <el-dialog
    v-model="dialogVisible"
    title="Login"
    width="30%">
    <template #footer>
      <span class="dialog-footer">
        <Login></Login>  <!-- import login component -->
        <el-button @click="dialogVisible = false">Cancel</el-button>
      </span>
    </template>
  </el-dialog>
  <el-dialog
    v-model="dialogVisibleregister"
    title="Register"
    width="30%">
    <template #footer>
      <span class="dialog-footer">
        <Register></Register> <!-- import register component -->
        <el-button @click="dialogVisibleregister = false">Cancel</el-button>
      </span>
    </template>
  </el-dialog>
      </div>
  
       <!-- if user is login, display user info and drop-down menus -->
      <div v-if="userId" class="user-info">
        <el-dropdown >
    <span class="el-dropdown-link">
      <router-link :to="`/UserPage/${userId}`"><img  :src="userAvatar" class="user-avatar"></router-link>

    </span>
    <template #dropdown>
      <el-dropdown-menu class="dropdown-menu">
        <el-dropdown-item command="a" class="dropdown-username">{{ username }}</el-dropdown-item>
        <el-dropdown-item command="b"><router-link class="dropdown-link" :to="`/UserPage/${userId}`">My Page<el-icon size="large"><User /></el-icon></router-link></el-dropdown-item>
        <el-button @click="openCreateGardenDialog" class="create-garden-button">Create Garden</el-button>
        <el-dialog v-model="createDialogVisible" title="Create Garden" width="30%">
        <el-input v-model="gardenName" placeholder="Enter garden name"></el-input>
        <span class="dialog-footer">
        <el-button @click="createDialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="createGarden">Confirm</el-button>
      </span>
    </el-dialog>
        <el-dropdown-item command="d" disabled><router-link to="/CreateExperience" class="share-content">Share Experience<el-icon size="large"><MagicStick /></el-icon></router-link></el-dropdown-item>
        <el-dropdown-item command="e" divided><el-button type="danger"  @click="logout" class="logout-button">Logout<el-icon size="large"><RemoveFilled /></el-icon></el-button></el-dropdown-item>
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
  import Login from "../Usercontent/Login.vue";
  import Register from "../Usercontent/Register.vue"
  const dialogVisible = ref(false)//manage login dialog
  const dialogVisibleregister = ref(false)//manage register dialog
  const isLoggedIn = ref(false);//set user is login or not
  const username = ref('');
  const userAvatar = ref(''); 
  const userId = ref('');
  const router = useRouter();
  const gardenName = ref('');
  const createDialogVisible = ref(false);//manage createGarden dialog

  function logout() {
    localStorage.removeItem('user'); //empty localStorage user info
    isLoggedIn.value = false; //set isLoggedIn as false
    router.push('/');
    location.reload();
    
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
    location.reload();
    createDialogVisible.value = false;
  } catch (error) {
    alert('Failed to create garden');
    console.error('Error creating garden:', error);
  }
};
  
  onMounted(() => {
    const userStr = localStorage.getItem('user'); //get user info from localStorage
    if (userStr) {
      const user = JSON.parse(userStr);
      isLoggedIn.value = true; //update 
      username.value = user.username;
      userId.value = user.userId;
      userAvatar.value = `http://localhost:3000/${user.useravatar}`;
;
    }
  });
  </script>
  
<style scoped>
  .usercontent {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;

  }
  
  .dropdown-menu{
    background-color: #f4f4f4;
  }
  .user-actions, .user-info {
    display: flex;
    align-items: center;
  }
  
  .user-link {
    margin-right: 10px;
    font-size: 16px;
    color: #4caf50;
  }
  
  .user-avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
  }
  
  .dropdown-username, .dropdown-link, .share-content{
    font-size: 16px;
    color: #4caf50;
  }
  
  .create-garden-button {
    margin-top: 10px;
    color: #4caf50;
  }


  </style>