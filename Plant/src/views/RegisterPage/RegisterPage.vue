<template>
    <div class="register-form">
      <div class="Webpicture"><img src="./webpicture.png" /></div>
      <el-form :label-position="labelPosition" label-width="100px" :model="formLabelAlign" style="max-width: 460px">
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
          <input type="file" @change="handleFileUpload" />
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

    } catch (error) {
      alert('Registration failed: ' + error.response.data.error);
      console.error('Registration error:', error);
    }
  };
  </script>
  