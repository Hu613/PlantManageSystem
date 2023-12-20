<template>
  <div class="sharepage">
    <h1 class="title">{{ shareData.title }}</h1>
    <div class="user-info">
      <h1>Authour:</h1><br/>
      <img :src="shareData.useravatar" alt="User avatar" class="user-avatar"  @click="() => goUserPage(shareData.userId)"/>
      <span>{{ shareData.username }}</span>
      <!--Follow user and unfollow user buttons-->
      <div v-if="userId" class="concern">
      <el-button v-if="!value1" circle ><el-icon size="30px" style="color: aquamarine;" v-if="!value1" @click="concern(shareData.userId)"><Plus /></el-icon></el-button>
      <el-button v-if="value1" circle ><el-icon size="30px" style="color: red;" v-if="value1" @click="deleteconcern(shareData.userId)"><Close /></el-icon></el-button>
    </div>
    </div>
    <!--Page content-->
    <div class="content">
    <div class="pictures">
      <h1>Exhibition :</h1><br/>
      <el-carousel :interval="4000" type="card" style="width: 1200px;" height="400px" >
        <el-carousel-item v-for="(picture, index) in shareData.images" :key="index">
    <img :src="picture" style="width: 600px; height: 450px;" class="share-picture" />
  </el-carousel-item>
  </el-carousel>
    </div>
    <h1 class="description">Description :<br /><p>{{ shareData.description }}</p></h1>
     <span style="font-size: 25px;">Create at {{ shareData.createtime }}<el-icon><Timer /></el-icon> {{ shareData.entertime }} Views<el-icon><View /></el-icon></span>
    <!--Collect button-->
    <div class="button">
      <el-button v-if="userId" @click="() => collect(shareData.shareid)" type="warning" icon="Star" size="large" circle></el-button>
      <!--add comment button-->
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
    <!--Display this page's comment-->
    <div class="Comment">
      <div><h1>Comment :</h1></div>
      <comment :page-id="shareid"></comment>
    </div>
  </div>
</div>
</template>


<script setup>
import { ref, onMounted, reactive } from 'vue';
import axios from 'axios';
import { useRoute,useRouter } from 'vue-router';
import comment from '../../components/Comment/comment.vue';
const shareid = ref(useRoute().params.shareid);
const dialogVisible = ref(false)
const userId = ref('');
const value1 = ref();
const shareData = ref({});
const route = useRoute();
const router = useRouter();
const contentForm = reactive({
  commentcontent: '',
});

const goUserPage = (userId) => {
    router.push(`/UserPage/${userId}`);
    
  };

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

  //add comment function
  const addcomment = async () => {
    console.log('Sending comment data:', {
    content: contentForm.commentcontent,
    userId: userId.value,
    shareid: shareid.value,
  });
  console.log('Pageid',route.params.shareid);
  try {
      const response = await axios.post('http://localhost:3000/comment/addcomment', {
        content: contentForm.commentcontent,
        userId: userId.value,
        pageId: route.params.shareid,
      });
      alert('Add Comment successful');
      location.reload();
      
    } catch (error) {
      alert('Add comment failed');
      console.error('Add comment error:', error);

    }
  };
  
  //follow the share's author
  const concern = async (concernedUserId) => {
  try {
    const response = await axios.post('http://localhost:3000/user/concern', {
      userId: userId.value,
      concernuserId: concernedUserId,
      concernusername: shareData.value.username,
      concernuseravatar: shareData.value.useravatar,
    });
    console.log('Concern successful:', response.data);
    value1.value = true; //set value1 is true to hide the follow button and display unfollow button
  } catch (error) {
    console.error('Error handling concern:', error);
  }
};


//unfollow user function
const deleteconcern = async (concernedUserId) => {
  try {
    const response = await axios.post('http://localhost:3000/user/deleteconcern', {
      userId: userId.value,
      concernuserId: concernedUserId,
    });
    console.log('Unconcern successful:', response.data);
    value1.value = false; //set value1 is false, to display follow button and hide unfollow button
  } catch (error) {
    console.error('Error handling unconcern:', error);
  }
};


  onMounted(async () => {

    
  console.log('ShareID from route:', route.params.shareid); 
  console.log('ShareID value:', shareid.value); 
  const userStr = localStorage.getItem('user');
  if (userStr) {
    const user = JSON.parse(userStr); 
    userId.value = user.userId;
  } //get userId who enter the sharepage
  
  const shareidFromRoute = route.params.shareid;
  //get shareid from route
  
  if (shareidFromRoute) {
    try {
      const response = await axios.get(`http://localhost:3000/social/getsocialpage/${shareidFromRoute}`);
      if (response.data) {
        shareData.value = response.data; //get this sharePage data

        //Check if the user is following the author
        try {
          const checkResponse = await axios.get(`http://localhost:3000/user/checkconcern/${userId.value}/${shareData.value.userId}`);
          value1.value = checkResponse.data.isConcerned; // set result in value1, true or false
          console.log('check concern', checkResponse)
        } catch (error) {
          console.error('Error checking concern status:', error);
        }
      }
    } catch (error) {
      console.error('Error fetching share details:', error);
    }
  } else {
    console.error('Share ID is undefined');
  }
});

</script>
<style scoped>
.sharepage {
  padding: 20px;
  border-radius: 10px;
}

.title {
  font-size: 24px;
  color: #2c662d;
  margin-bottom: 20px;
}

.user-info {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.user-avatar {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  margin-right: 10px;
  cursor: pointer;
}

.content{
  margin-bottom: 20px;
}

.share-picture {
  width: 100%;
  border-radius: 10px;
  margin-bottom: 10px;
}

.button {
  margin-bottom: 10px;
}

.el-button {
  background-color: #2c662d;
  color: white;
}

.el-button:hover {
  background-color: #3a8039;
}
</style>
