<template>
    <div class="user-page">
      <h1 class="user">
        <img :src="userData.useravatar" class="user-avatar"></h1>
        <h2 class="user-name">{{ userData.username }}</h2>
   
      <div class="garden">
        <h1>My Garden :</h1><br/>
       <usergardencard :userId="userId"></usergardencard>
      </div>
      <div class="share">
        <h1>My Share :</h1><br/>
        <usersocial :userId="userId"></usersocial>
      </div>
      <div class="collect">
        <h1>My Collect :</h1><br/>
       <usercollect :userId="userId"></usercollect>
      </div>
    </div>
  </template>
  
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import { useRoute } from 'vue-router';
  import usersocial from '../components/content/socialcontent/usersocial.vue';
  import usercollect from '../components/content/Usercontent/usercollect.vue';
  import usergardencard from './Garden/usergardencard.vue';

  
  const route = useRoute();
  const userData = ref({});
  const userId = ref(useRoute().params.userId);

    onMounted(async () => {
      const userIdfromRoute = route.params.userId;
      if(userIdfromRoute){
      try {
    const response = await axios.get(`http://localhost:3000/user/getuserpage/${userIdfromRoute}`);
    if (response.data) {
      userData.value = response.data;
      }          
  } catch (error) {
    console.error('Error fetching user details:', error);
  }
}
});
  
  </script>
  <style scoped>
  .user-page {
  padding: 20px;
}

.user {
  display: flex;
  align-items: center;
  margin-bottom: 30px;
}

.user-avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  margin-right: 20px;
  border: 2px solid #2c662d;
}

.user-name {
  font-size: 24px;
  color: #2c662d;
}

.garden, .share, .collect {
  margin-bottom: 20px;
}

h1 {
  font-size: 22px;
  color: #2c662d;
  margin-bottom: 15px;
}
  </style>
  