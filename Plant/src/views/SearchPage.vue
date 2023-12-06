<template>
  <div class="search-page">
    <form @submit.prevent="pageSearch" class="search-bar">
      <input type="search" v-model="pageSearchContent" placeholder="Find what you want" />
      <el-button :icon="Search" circle @click="pageSearch"></el-button>
    </form>
    <div class="result">
      <h1>Experience :</h1><br/>
      <div class="resultcard">
      <div v-for="share in searchResults.shares" class="textcard" style="cursor: pointer;" :key="share.shareid" @click="goToSharePage(share.shareid)">
        {{ share.title }}
      </div>
      </div>
    </div>
    <div class="result">
      <h1>User :</h1><br/>
      <div class="resultcard">
      <div v-for="user in searchResults.users" class="card" style="cursor: pointer;" :key="user.userId" @click="goToUserPage(user.id)">
        <img :src="`http://localhost:3000/${user.useravatar}`" alt="User Avatar" class="avatar" /><div class="name"> {{ user.username }} </div>
      </div>
      </div>
    </div>
    <div class="result">
      <h1>Plant :</h1><br/>
      <div class="resultcard">
      <div v-for="plant in searchResults.plants" class="card" style="cursor: pointer;" :key="plant.plantId" @click="goToPlantPage(plant.plantid)">
        <img :src="plant.plantpicture" alt="Plant Avatar" class="avatar" /><div class="name">{{ plant.plantname }} </div>
      </div>
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
.search-page {
  padding: 20px;
}

.search-bar {
  margin-bottom: 30px;
  text-align: center;
}

.result {
  margin-bottom: 20px;
}

.result h2 {
  color: #2c662d;
  margin-bottom: 10px;
}

.resultcard {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.card {
  padding: 10px;
  border-radius: 5px;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.card:hover {
  transform: translateY(-10px);
}

.textcard {
  background-color: #e7f4e4;
  padding: 10px;
  border-radius: 5px;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.textcard:hover {
  background-color: #d0e8d3;
  transform: translateY(-10px);
}
.name{
  font-size: 25px;
  text-align: center;
}

.avatar {
  width: 150px; 
  height: 150px; 
  border-radius: 50%;
}

</style>
