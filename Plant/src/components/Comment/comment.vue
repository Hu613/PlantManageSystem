<template>
    <div class="comment-section">
      <el-row v-for="comment in comments" :key="comment.id" class="comment-item">
        <el-avatar class="useravatar" :src="comment.useravatar" size="large" @click="() => goUserPage(comment.userId)"></el-avatar>
        <el-col :span="18" class="comment-content">
          <div class="comment-username">{{ comment.username }}</div>
          <div class="comment-text">{{ comment.content }}</div>
        </el-col>
      </el-row>
    </div>
  </template>
  
  <script setup>
import { ref, onMounted, defineProps } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';

const router = useRouter();

const goUserPage = (userId) => {
    router.push(`/UserPage/${userId}`);
    
  };

const props = defineProps({
  pageId: String
  
});
const comments = ref([]);


onMounted(async () => {
  if (props.pageId) {
    try {
      const response = await axios.get(`http://localhost:3000/comment/getCommentsByPageId/${props.pageId}`);
      comments.value = response.data.comments;
    } catch (error) {
      console.error('Error fetching comments:', error);
    }
  } else {
    console.error('Page ID is undefined in Comment.vue');
  }
});
</script>
    

  
  <style scoped>
  .useravatar{
    cursor: pointer;
  }
  .comment-section {
    margin-top: 20px;
  }
  
  .comment-item {
    align-items: center;
    margin-bottom: 10px;
  }
  
  .comment-content {
    margin-left: 10px;
  }
  
  .comment-username {
    font-weight: 600;
  }
  
  .comment-text {
    margin-top: 5px;
  }
  </style>
  