<template>
    <div class="userside">
    <el-space direction="vertical">
    
  <router-link to="/">HomePage<el-icon size="large"><house /></el-icon></router-link>
  <router-link v-if="userId" :to="`/UserPage/${userId}`">MyPage<el-icon size="large"><Notification /></el-icon></router-link>
 </el-space>
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

