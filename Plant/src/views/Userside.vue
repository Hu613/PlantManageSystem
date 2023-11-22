<template>
    <div class="userside">
    <el-space direction="vertical">
    
  <router-link to="/">HomePage<el-icon size="large"><house /></el-icon></router-link>
  <router-link v-if="userId" :to="`/UserPage/${userId}`">MyPage<el-icon size="large"><Notification /></el-icon></router-link>
  <userconcern v-if="userId"></userconcern>
  <planttypetag></planttypetag>
 </el-space>
</div>
 </template>
 
 <script lang="ts" setup>
   import { ref, onMounted } from 'vue';
   import { useRouter } from 'vue-router';
   import userconcern from "../components/content/Usercontent/userconcern.vue"
   import planttypetag from '../components/content/plantcontent/planttypetag.vue';
  const isLoggedIn = ref(false);
   const username = ref('');
   const userAvatar = ref(''); 
   const userId = ref('');
   
   
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

