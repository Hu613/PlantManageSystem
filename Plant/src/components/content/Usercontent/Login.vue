<template>
    <div class="login-form"><!-- create login form -->
      <el-form
        :label-position="labelPosition"
        label-width="100px"
        :model="loginForm"
        style="max-width: 160px"
      >
        <el-form-item label="Email">
          <el-input v-model="loginForm.email" /><!-- email content, v-model automatically synchronises the data between the value of el-input and loginForm.email -->
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

  //Create responsive loginform data
  const loginForm = reactive({
    email: '',
    password: ''
  });
  
  
  //login function
  const submitLogin = async () => {
    try {
      const response = await axios.post('http://localhost:3000/user/login', {//send request to back-end
        email: loginForm.email,
        password: loginForm.password
      });
      localStorage.setItem('user', JSON.stringify(response.data)); //store the user's information in LocalStorage, after login, go homepage 
      router.push('/');
      location.reload();
      alert('Login successful');
      console.log(response.data);
      
    } catch (error) {
      alert('Login failed');
      console.error('Login error:', error.response.data.error);

    }
  };
  </script>
  
  