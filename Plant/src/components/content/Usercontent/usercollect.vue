<template>
    <el-row>
      <!-- Display cards using Element UI's grid system -->
      <el-col
        v-for="(card, index) in cards"
        :key="card.id"
        :span="4"
        :offset="index % 5 === 0 ? 0 : (index % 5 === 1 ? 1 : (index % 5 === 2 ? 2 : (index % 5 === 3 ? 3 : 0)))"
      ><!-- single user collect card-->
        <el-card :body-style="{ padding: '10px' }">
          <img :src="card.sharepicture"
            class="share-picture"
            alt=""
          />
          <div style="padding: 14px">
            <span>{{ card.title }}</span> 
            <div class="bottom">
              <el-button text class="button" @click="() => goSharepage(card.shareid)" size="large">Enter</el-button>
              <el-button  v-if="currentuser" class="button" @click="() => deletecollect(card.shareid)" type="danger" icon="Delete" size="large" circle></el-button>
            </div>
            <div class="description">Description:<br />
            <div class="description-text">{{ card.description }}</div>
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
  const currentuser = ref(false); //set current user is the page owner or not
  const props = defineProps({
  userId: String
  
}); //receive userId

  const cards = ref([]); // store card info

  //function go share page
  const goSharepage = async (shareid) => {
    try {
      await axios.post(`http://localhost:3000/user/incrementEnterTime/${shareid}/enter`); 
      router.push(`/SharePage/${shareid}`);
    } catch (error) {
      console.error('Can not enter this page', error);
    }
  }


  const deletecollect = async (shareid) => {
  try {
    const response = await axios.post('http://localhost:3000/user/deletecollect', {
      shareid: shareid,
    });
   
    alert('Delete collect successful');
    location.reload();
    console.log(response.data);
    
  } catch (error) {
    alert('Delete collect failed');
    console.error('Delete error:', error);

  }
};
  onMounted(async () => {
    const userStr = localStorage.getItem('user');
  if (userStr) {
    const user = JSON.parse(userStr);
    if(user.userId === props.userId){
      currentuser.value = true;
    }// get current userId and compare it with this userpage's userId to determine the current user is the owner or not
  }
    try {
      const response = await axios.get(`http://localhost:3000/social/getusercollect/${props.userId}`);
      cards.value = response.data.map(share => ({
        ...share,
        sharepicture: `http://localhost:3000/${share.sharepicture.split(';')[0]}`
      }));//get card information and set the first picture to display.
    } catch (error) {
      console.error('Failed to fetch experiences:', error);
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
  width: 100px;
  height: 100px;
  display: block;
}


  </style>
  