<template>
  <el-row>
    <el-col
      v-for="(card, index) in cards"
      :key="card.id"
        :span="4"
        :offset="index % 4 === 0 ? 0 : (index % 5 === 1 ? 1 : (index % 5 === 2 ? 2 : (index % 5 === 3 ? 3 : 0)))"
    >
      <el-card :body-style="{ padding: '10px' }">
        <img :src="card.tagpicture" class="tag-picture" alt="" style="width: 200px; height: 200px;"/>
        <div style="padding: 14px">
          <span>{{ card.title }}</span> 
          <div class="bottom">
            <el-button text class="button" @click="() => goPlanttypePage(card.tagid)" size="large">Enter</el-button>
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
const cards = ref([]);

const goPlanttypePage = async (tagid) => {
    try {
      router.push(`/PlanttypePage/${tagid}`);
    } catch (error) {
      console.error('Can not enter this page', error);
    }
  }


onMounted(async () => {
  try {
    const response = await axios.get('http://localhost:3000/tag/gettag');
    cards.value = response.data.map(tag => ({
      ...tag,
    }));
  } catch (error) {
    console.error('Failed to fetch tag:', error);
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

</style>
