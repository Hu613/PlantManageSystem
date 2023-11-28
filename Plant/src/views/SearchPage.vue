<template>
  <div>
    <form @submit.prevent="pageSearch" class="pagesearchbar">
      <input type="search" v-model="pageSearchContent" placeholder="Find what you want" />
      <el-button :icon="Search" circle @click="pageSearch"></el-button>
    </form>
    <div class="share">
      <h1>Experience :</h1><br/>
      <div v-for="share in searchResults.shares" style="cursor: pointer;" :key="share.shareid" @click="goToSharePage(share.shareid)">
        {{ share.title }}
      </div>
    </div>
    <div class="user">
      <h1>User :</h1><br/>
      <div v-for="user in searchResults.users" style="cursor: pointer;" :key="user.userId" @click="goToUserPage(user.id)">
        {{ user.username }}
      </div>
    </div>
    <div class="plant">
      <h1>Plant :</h1><br/>
      <div v-for="plant in searchResults.plants" style="cursor: pointer;" :key="plant.plantId" @click="goToPlantPage(plant.plantid)">
        {{ plant.plantname }}
      </div>
    </div>
  </div>
</template>


<script setup>
import { ref } from 'vue';
import axios from 'axios';
import { Search } from '@element-plus/icons-vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const pageSearchContent = ref('');
const searchResults = ref({
  users: [],
  shares: [],
  plants: []
});

const pageSearch = async () => {
  const query = pageSearchContent.value.trim();
  if (query) {
    try {
      const response = await axios.post('http://localhost:3000/search/search', { query });
      searchResults.value = response.data;
      console.log(searchResults.value);
    } catch (error) {
      console.error('Error during search:', error);
      searchResults.value = { users: [], shares: [], plants: [] };
    }
  }
};

const goToSharePage = (shareid) => {
  router.push(`/SharePage/${shareid}`);
};

const goToUserPage = (id) => {
  router.push(`/UserPage/${id}`);
};

const goToPlantPage = (plantid) => {
  router.push(`/PlantPage/${plantid}`);
};
</script>


<style scoped>
</style>
