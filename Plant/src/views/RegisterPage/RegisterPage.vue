<template>
    <div class="register-form">
      <el-form :label-position="labelPosition" label-width="100px" :model="formLabelAlign" style="max-width: 460px" class="form-container">
        <el-form-item label="Name">
          <el-input v-model="formLabelAlign.name" />
        </el-form-item>
        <el-form-item label="Password">
          <el-input v-model="formLabelAlign.password" />
        </el-form-item>
        <el-form-item label="Email">
          <el-input v-model="formLabelAlign.email" />
        </el-form-item>
        <el-form-item label="Lat">
          <el-input v-model="formLabelAlign.lat" />
        </el-form-item>
        <el-form-item label="Lon">
          <el-input v-model="formLabelAlign.lon" />
        </el-form-item>
        <el-form-item label="Avatar">

          <input type="file" @change="handleFileUpload" class="file-input"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm">Register</el-button>
        </el-form-item>
      </el-form>
    </div>
  </template>
  
  <script lang="ts" setup>
  import { reactive, ref } from 'vue';
  import axios from 'axios';
  import type { FormProps } from 'element-plus';
  import {useRouter} from 'vue-router'

  const router = useRouter();
  const labelPosition = ref<FormProps['labelPosition']>('right');
  const formLabelAlign = reactive({
    name: '',
    password: '',
    email: '',
    lat: '',
    lon: '',
    avatar: null, 
  });
  

  const handleFileUpload = (event) => {
    const files = event.target.files;
    if (files.length > 0) {
      formLabelAlign.avatar = files[0];
    }
  };
  

  const submitForm = async () => {
    const formData = new FormData();
    formData.append('username', formLabelAlign.name);
    formData.append('password', formLabelAlign.password);
    formData.append('email', formLabelAlign.email);
    formData.append('lat', formLabelAlign.lat);
    formData.append('lon', formLabelAlign.lon);
    if (formLabelAlign.avatar) {
      formData.append('avatar', formLabelAlign.avatar);
    }
 
    try {
      const response = await axios.post('http://localhost:3000/user/register', formData, {
        headers: { 'Content-Type': 'multipart/form-data' },
      });
      alert('Registration successful');
      console.log(response.data);
      router.push('/');
    } catch (error) {
      alert('Registration failed: ' + error.response.data.error);
      console.error('Registration error:', error);
    }
  };
  </script>

  <style scoped>
  .register-form {
    padding: 20px;
    background-image: url('./webpicture.png');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    max-width: 800px;
    margin: auto;
  }
  
  .form-container {
    margin-top: 20px;
  }
  
  .file-input {
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 4px;
  }
  
  .el-button {
    background-color: #2c662d;
    color: white;
  }
  
  .el-button:hover {
    background-color: #3a8039;
  }
  </style>
  