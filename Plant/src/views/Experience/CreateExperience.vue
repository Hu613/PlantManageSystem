<template>
    <div class="register-form">
      
      <el-form :label-position="labelPosition" label-width="300px" :model="formLabelAlign" style="max-width: 800px">
        <el-form-item label="Title">
          <el-input v-model="formLabelAlign.title" />
        </el-form-item>
        <el-form-item label="Description">
      <el-input  v-model="formLabelAlign.description" type="textarea" />
    </el-form-item>
        <el-form-item label="Sharepicture">
          <input type="file" multiple @change="handleFileUpload" />
        </el-form-item>
        <el-form>
            <span>Upload files: {{ formLabelAlign.sharepictures.length }}</span>
        </el-form>
        <el-form-item>
          <el-button type="primary" @click="submitForm">Create!</el-button>
        </el-form-item>
      </el-form>
    </div>
  </template>
  
  <script lang="ts" setup>
  import { reactive, ref ,onMounted } from 'vue';
  import axios from 'axios';
  import type { FormProps } from 'element-plus';
  import { useRouter } from 'vue-router';
  const router = useRouter();
  const userId = ref('');
  const labelPosition = ref<FormProps['labelPosition']>('right');
  const formLabelAlign = reactive({
    title: '',
    description: '',
    sharepictures: [], 

  });
  

  const handleFileUpload = (event) => {
    formLabelAlign.sharepictures = Array.from(event.target.files);
    
  };
  onMounted(() => {
    const userStr = localStorage.getItem('user');
    if (userStr) {
      const user = JSON.parse(userStr);
     
      userId.value = user.userId;
      
;
    }
  });

  const submitForm = async () => {
    const formData = new FormData();
    formData.append('title', formLabelAlign.title);
    formData.append('description', formLabelAlign.description);
    formData.append('userId', userId.value);
    for(let i=0;i < formLabelAlign.sharepictures.length; i++){
        formData.append('sharepictures', formLabelAlign.sharepictures[i]);
    }
 
    try {
      const response = await axios.post('http://localhost:3000/user/createExperience', formData, {
        headers: { 'Content-Type': 'multipart/form-data' },
      });
      alert('Create successful');
      console.log(response.data);
      router.push('/');
      
    } catch (error) {
      alert('Create failed: ' + error.response.data.error);
      console.error('Create error:', error);
    }
  };
  </script>
  