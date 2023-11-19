<template>
    <div class="login-form">
      <div class="Webpicture"><img src="./webpicture.png" /></div>
      <el-form
        :label-position="labelPosition"
        label-width="100px"
        :model="loginForm"
        style="max-width: 160px"
      >
        <el-form-item label="Email">
          <el-input v-model="loginForm.email" />
        </el-form-item>
        <el-form-item label="Password">
          <el-input type="password" v-model="loginForm.password" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitLogin">Login</el-button>
        </el-form-item>
      </el-form>
    </div>
  </template>
  
  <script lang="ts" setup>
  import { reactive, ref } from 'vue';
  import axios from 'axios';
  import {useRouter} from 'vue-router'
  const router = useRouter();
  const labelPosition = ref('right');

  const loginForm = reactive({
    email: '',
    password: ''
  });
  
  

  const submitLogin = async () => {
    try {
      const response = await axios.post('http://localhost:3000/user/login', {
        email: loginForm.email,
        password: loginForm.password
      });
      localStorage.setItem('user', JSON.stringify(response.data));
      router.push('/');
      alert('Login successful');
      console.log(response.data);
      
    } catch (error) {
      alert('Login failed');
      console.error('Login error:', error);

    }
  };
  </script>
  
  <style scoped>
  .login-form {

  }
  </style>
  