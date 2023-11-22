<template>
    <div>
      <h1 class="user"><img :src="userData.useravatar" class="user-avatar"></h1>
<h2>{{ userData.username }}</h2>
   
      <div class="garden">
        <h1>My Garden :</h1><br/>
       <MyGarden></MyGarden>
      </div>
      <div class="share">
        <h1>My Share :</h1><br/>
        <usersocial :userId="userId"></usersocial>
      </div>
      <div class="Collect">
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
  <style>
  .title {
    font-size: 24px;
    margin-bottom: 10px;
  }
  .user-info {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
  }
  .user-avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-right: 10px;
  }
  .pictures {
    margin-bottom: 10px;
  }
  .share-picture {
    width: 100%;
    margin-bottom: 10px;
  }
  .description {
    margin-bottom: 10px;
  }
  .button {
    margin-bottom: 10px;
  }
  </style>
  