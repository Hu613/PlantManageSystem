<template>
    <el-row>
      <el-col
        v-for="(card, index) in cards"
        :key="card.id"
        :span="4"
        :offset="index % 5 === 0 ? 0 : (index % 5 === 1 ? 1 : (index % 5 === 2 ? 2 : (index % 5 === 3 ? 3 : 0)))"
      >
        <el-card :body-style="{ padding: '10px' }">
         
          <div style="padding: 14px">
            <span>{{ card.gardenname }}</span> 
            <div class="bottom">
              <el-button text class="button" v-if="currentuser" @click="() => goGardenPage(card.gardenid)" size="large">Enter</el-button>
              <el-button  v-if="currentuser" class="button" @click="() => deletegarden(card.gardenid)" type="warning" icon="Delete" size="large" circle></el-button>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import { useRouter } from 'vue-router';
  const router = useRouter();
  const currentuser = ref(false);
  const props = defineProps({
  userId: String
  
});
  const cards = ref([]);
  const goGardenPage = async (gardenid) => {
    try { 
      router.push(`/GardenPage/${gardenid}`);
    } catch (error) {
      console.error('Can not enter this page', error);
    }
  }
  const deletegarden = async (gardenid) => {
  try {
    const response = await axios.post('http://localhost:3000/garden/deletegarden', {
        gardenid: gardenid,
    });
   
    alert('Delete successful');
    location.reload();
    console.log(response.data);
    
  } catch (error) {
    alert('Delete failed');
    console.error('Delete error:', error);

  }
};
  onMounted(async () => {
    const userStr = localStorage.getItem('user');
  if (userStr) {
    const user = JSON.parse(userStr);
    if(user.userId === props.userId){
      currentuser.value = true;
    }
  }

    try {
      const response = await axios.get(`http://localhost:3000/garden/getgarden/${props.userId}`);
      cards.value = response.data.map(garden => ({
        ...garden,
        
      }));
      console.log(cards.value);
    } catch (error) {
      console.error('Failed to fetch gardens:', error);
    }
  });
  </script>
  
  <style scoped>
  
  .description {
  white-space: nowrap; 
  overflow: hidden;
  max-width: 100%; 
}

.description-text {
  margin-top: 10px; 
  text-overflow: ellipsis; 
}
  
  .bottom {
    margin-top: 13px;
    line-height: 12px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  .button {
    padding: 0;
    min-height: auto;
  }
  
  .share-picture {
    width: 100%;
    display: block;
  }
  
  div[style] {
    padding-bottom: 10px;
  }
  </style>
  