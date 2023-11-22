<template>
  <div class="top">
    <div class="top-Firstline">
      <form @submit.prevent="googlesearch" class="searchbar">
        <input type="search" v-model="searchcontent" placeholder="Google Search" />
        <el-button circle @click="googlesearch"><el-icon><ChromeFilled /></el-icon></el-button>
      </form>
      <form @submit.prevent="pagesearch" class="pagesearchbar">
        <input type="search" v-model="pagesearchcontent" placeholder="Find what you want" />
        <el-button :icon="Search" circle @click="pagesearch"></el-button>
      </form>
      <user></user>
    </div>
    <div class="top-SecondLine">
    <router-link to="/" class="logo-link">
      <img src="./RegisterPage/webpicture.png" class="website-logo" alt="Website Logo" />
    </router-link>
      <router-link to="/">HomePage</router-link>
      <div  class="Content">
        <el-dropdown >
    <span class="el-dropdown-link">
        <router-link to="/Plant">Plant</router-link><el-icon class="el-icon--right"><arrow-down /></el-icon>
    </span>
    <template #dropdown>
      <el-dropdown-menu>
        <el-dropdown-item command="a"><router-link to="/PlantInfo">Plant Info</router-link></el-dropdown-item>
        <el-dropdown-item command="b"><router-link to="/SuplierInfo">Suplier Info</router-link></el-dropdown-item>
        <el-dropdown-item command="c"><router-link to="/Pest">Pest Help</router-link></el-dropdown-item>
        <el-dropdown-item command="d" disabled>placeholder</el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
      </div>
      <router-link to="/Social">Social</router-link>
    </div>
   
    <div class="top-right">
      
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { Search } from '@element-plus/icons-vue';
import { ChromeFilled } from '@element-plus/icons-vue'
import User from "../components/content/Usercontent/user.vue"; 

const searchcontent = ref('');
const pagesearchcontent = ref(''); 
const router = useRouter();

function pagesearch() {
  
}

function googlesearch() {
  const content = searchcontent.value.trim();
  if (content) {
    window.open(`https://www.google.com/search?q=${encodeURIComponent(content)}`, "_blank");
  }
}
</script>

<style scoped>
.top {
  display: flex;
  flex-direction: column;
  width: 100%;
  
}

.top-Firstline {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 20px; 
}

.searchbar, .pagesearchbar {
  margin-right: 100px;
}


.top-SecondLine {
  display: flex;
  align-items: center;
  height: 58px; 
  padding: 50px 10px; 
}


.logo-link {
  display: flex;
  align-items: center;
}


.website-logo {
  height: 70px; 
  width: auto; 
}


.Content {
  display: flex;
  align-items: center;
}
</style>