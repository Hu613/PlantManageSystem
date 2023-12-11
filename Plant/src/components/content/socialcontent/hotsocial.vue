<template>
  <el-row>
    <el-col
      v-for="(card, index) in cards"
      :key="card.id"
        :span="4"
        :offset="index % 4 === 0 ? 0 : (index % 5 === 1 ? 1 : (index % 5 === 2 ? 2 : (index % 5 === 3 ? 3 : 0)))"
    >
      <el-card :body-style="{ padding: '10px' }">
        <img :src="card.sharepicture"
          class="share-picture"
          alt=""
        />
        <div style="padding: 14px">
          <span>{{ card.title }}</span> 
          <div class="bottom">
            <span>{{ card.createtime }}</span>
            <el-button text class="button" @click="() => goSharepage(card.shareid)" size="large">Enter</el-button>
            <el-button v-if="userId" class="button" @click="() => collect(card.shareid)" type="warning" icon="Star" size="large" circle></el-button>
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
const userId = ref('');
const cards = ref([]);
const goSharepage = async (shareid) => {
  try {
    await axios.post(`http://localhost:3000/user/incrementEnterTime/${shareid}/enter`); 
    router.push(`/SharePage/${shareid}`);
  } catch (error) {
    console.error('Can not enter this page', error);
  }
}

const collect = async (shareid) => {
  try {
    const response = await axios.post('http://localhost:3000/user/collect', {
     shareid: shareid,
     userId: userId.value,
    });
   
    alert('Collect successful');
    console.log(response.data);
    
  } catch (error) {
    alert('Collect failed');
    console.error('Collect error:', error);

  }
};
onMounted(async () => {
  const userStr = localStorage.getItem('user');
  if (userStr) {
    const user = JSON.parse(userStr);
    
    userId.value = user.userId;
    
;
  }
  try {
    const response = await axios.get('http://localhost:3000/social/gethotsocial');
    cards.value = response.data.map(share => ({
      ...share,
      sharepicture: `http://localhost:3000/${share.sharepicture.split(';')[0]}`
    }));
  } catch (error) {
    console.error('Failed to fetch experiences:', error);
  }
});
</script>

<style scoped>



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

.description {
  white-space: nowrap; 
  overflow: hidden;
  max-width: 100%; 
}

.description-text {
  margin-top: 10px; 
  text-overflow: ellipsis; 
}
.share-picture {
  width: 100px;
  height: 100px;
 
  display: block;
}

div[style] {
  padding-bottom: 10px;
}
</style>
