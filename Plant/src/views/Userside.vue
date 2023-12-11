<template>
    <div class="userside">
    <el-space direction="vertical" class="sidemenu">
    
  <router-link to="/" class="menuitem">HomePage<el-icon size="large"><house /></el-icon></router-link>
  <router-link v-if="userId" :to="`/UserPage/${userId}`" class="menuitem">MyPage<el-icon size="large"><Notification /></el-icon></router-link>
  <el-button v-if="userId" text @click="dialogVisible = true" class="menuitem"><el-icon>My Following<StarFilled /></el-icon>
  </el-button>
  <el-dialog v-model="dialogVisible" title="My Following" width="30%" class="concerndialog" style="background-image: url('./concernback.png'); background-repeat: no-repeat; background-size: cover;">
    <userconcern v-if="userId"></userconcern>
    <template #footer>
      <span class="dialog-footer">
        <Logintest></Logintest>
        <el-button @click="dialogVisible = false">Exit</el-button>
      </span>
    </template>
  </el-dialog>
 </el-space>
</div>
 </template>
 
 <script lang="ts" setup>
   import { ref, onMounted } from 'vue';
   import { useRouter } from 'vue-router';
   import userconcern from "../components/content/Usercontent/userconcern.vue"
  const isLoggedIn = ref(false);
   const username = ref('');
   const userAvatar = ref(''); 
   const userId = ref('');
   const dialogVisible = ref(false)
   
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
.userside {
  padding: 20px;
}

.sidemenu {
  padding-left: 20px;
}

.menuitem {
  font-size: 18px;
  color: #2c662d;
  margin-bottom: 10px;
  display: flex;
  align-items: center;
}

.menuitem el-icon {
  margin-left: 8px;
}
</style>