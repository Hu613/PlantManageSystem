<template>
  <div>
    <h1 class="title">{{ shareData.title }}</h1>
    <div class="user-info">
      <h1>Authour:</h1><br/>
      <img :src="shareData.useravatar" alt="User avatar" class="user-avatar"/>
      <span>{{ shareData.username }}</span>
    </div>
    <div class="pictures">
      <h1>Exhibition :</h1><br/>
      <img v-for="(picture, index) in shareData.images" :src="picture" :key="index" class="share-picture" />
    </div>
    <p class="description">Description<br />{{ shareData.description }}</p>
    <div class="button">
      <el-button @click="Collect" type="warning" icon="Star" size="large" circle></el-button>
      <el-button type="primary" v-if="userId" @click="dialogVisible = true"><el-icon><ChatDotRound /></el-icon></el-button>
  <el-dialog v-model="dialogVisible" title="Comments" width="30%" draggable>
    <div class="contentForm">
        <el-form-item label="Comment">
          <el-input type="textarea" v-model="contentForm.commentcontent" />
        </el-form-item>
        </div>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="addcomment">
          Add your Comment
        </el-button>
      </span>
    </template>
  </el-dialog>

    </div>
    <div class="Comment">
      <div>Comment:</div>
      <comment :page-id="shareid"></comment>
    </div>
  </div>
</template>


<script setup>
import { ref, onMounted, reactive } from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';
import comment from '../../components/Comment/comment.vue';
const shareid = ref(useRoute().params.shareid);
const dialogVisible = ref(false)
const userId = ref('');

const shareData = ref({});
const route = useRoute();
const contentForm = reactive({
  commentcontent: '',
});



  const addcomment = async () => {
    console.log('Sending comment data:', {
    content: contentForm.commentcontent,
    userId: userId.value,
    shareid: shareid.value,
  });
  console.log(route.params.shareid);
  try {
      const response = await axios.post('http://localhost:3000/comment/addcomment', {
        content: contentForm.commentcontent,
        userId: userId.value,
        pageId: route.params.shareid,
      });
      alert('Add Comment successful');
      location.reload();
      console.log(response.data);
      
    } catch (error) {
      alert('Add comment failed');
      console.error('Add comment error:', error);

    }
  };

  onMounted(async () => {
    console.log('ShareID from route:', route.params.shareid); 
  console.log('ShareID value:', shareid.value); 
  const userStr = localStorage.getItem('user');
  if (userStr) {
    const user = JSON.parse(userStr); 
    userId.value = user.userId;
  }
  
  const shareidFromRoute = route.params.shareid;
  
  if (shareidFromRoute) {
    try {
      const response = await axios.get(`http://localhost:3000/social/getsocialpage/${shareidFromRoute}`);
      if (response.data) {
        shareData.value = response.data;
      }
    } catch (error) {
      console.error('Error fetching share details:', error);
    }
  } else {
    console.error('Share ID is undefined');
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
