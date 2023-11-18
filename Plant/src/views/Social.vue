<template>
  <el-row>
    <el-col
      v-for="(card, index) in cards"
      :key="card.id"
      :span="8"
      :offset="index % 3 === 0 ? 0 : 2"
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
            <el-button class="button" @click="Collect" type="warning" icon="Star" size="large" circle></el-button>
          </div>
          <div>Description:<br />{{ card.description }}</div> 
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

const cards = ref([]);
const goSharepage = async (shareid) => {
  try {
    await axios.post(`http://localhost:3000/user/incrementEnterTime/${shareid}/enter`); 
    router.push(`/SharePage/${shareid}`);
  } catch (error) {
    console.error('Can not enter this page', error);
  }
}

onMounted(async () => {
  try {
    const response = await axios.get('http://localhost:3000/social/getsocial');
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

.time {
  font-size: 12px;
  color: #999;
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
