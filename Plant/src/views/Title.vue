<template>
    <div class="top">
      <div class="top-Firstline">
       
        <form @submit.prevent="googlesearch" class="searchbar">
          <input type="search" v-model="searchcontent" placeholder="Google Search" />
          <el-button type="danger" circle icon="el-icon-search" @click="googlesearch">Search</el-button>
        </form>
        <form @submit.prevent="pagesearch" class="pagesearchbar">
          <input type="search" v-model="pagesearchcontent" placeholder="Find your want" />
          <el-button type="danger" circle icon="el-icon-search" @click="pagesearch">Search</el-button>
        </form>
        <router-link v-if="!isLoggedIn" to="/Register">Register</router-link>
      <router-link v-if="!isLoggedIn" to="/Login">Login</router-link>
      <div v-if="isLoggedIn" class="user-info">
        <img :src="userAvatar" alt="User Avatar" class="user-avatar">
        <span>{{ username }}</span>
      
    </div>
      </div>
      <div class="top-SecondLine">
        
      </div>
    <div class="top-right">
        
    </div>
    </div>
  </template>

  <script>

  import { Delete } from '@element-plus/icons-vue'
  
  export default {
    name: "Header",
    components: {
     
      Delete,
    },
    data() {
      return {
        searchcontent: "", 
      };
    },
    methods: {
        pagesearch(){
        
        },
      googlesearch() {
        const content = this.searchcontent.trim(); 
        if (content) {
          
          const googleSearchUrl = `https://www.google.com/search?q=${encodeURIComponent(content)}`;
          window.open(googleSearchUrl, "_blank");
        }
      },
    },
  };
  </script>

<style>
.top {
  width: 100%;
  height: 100px; 
  background-color: #ffffff; 
 
}
.top-Firstline {
  display: flex;
  align-items: center; 
}

.searchbar {
  margin-right: 10px;
}
</style>