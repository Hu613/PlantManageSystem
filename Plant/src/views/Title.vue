<template>
  <div class="top">
    <div class="top-Firstline">
      <form @submit.prevent="googlesearch" class="searchbar">
        <input type="search" v-model="searchcontent" placeholder="Google Search" />
        <el-button circle @click="googlesearch"><el-icon><ChromeFilled /></el-icon></el-button>
      </form>
      <el-button class="searchbar" :icon="Search" circle @click="goSearchPage"></el-button>
      <user></user>
    </div>
    <div class="top-SecondLine">
    <router-link to="/" class="logo-link">
      <img src="./RegisterPage/webpicture.png" class="website-logo" alt="Website Logo" />
    </router-link>
      <router-link to="/" class="titlecontent">HomePage</router-link>
      <div  class="Content">
        <el-dropdown >
    <span class="el-dropdown-link">
        <router-link to="/Plant" class="titlecontent">Plant</router-link><el-icon class="el-icon--right"><arrow-down /></el-icon>
    </span>
    <template #dropdown>
      <el-dropdown-menu class="el-dropdown-menu">
        <el-dropdown-item command="a"><router-link to="/PlantInfo">Plant Info</router-link></el-dropdown-item>
        <el-dropdown-item command="b"><router-link to="/Supplier">Supplier Info</router-link></el-dropdown-item>
        <el-dropdown-item command="c"><router-link to="/Pest">Pest Help</router-link></el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
      </div>
      <router-link to="/Social" class="titlecontent">Social</router-link>
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
import { ElMessageBox } from 'element-plus';
const router=useRouter();
const searchcontent = ref('');
const dialogVisible = ref(false)


const goSearchPage = async () => {
    try {
      router.push(`/SearchPage`);
    } catch (error) {
      console.error('Can not enter this page', error);
    }
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
  background-color: #f5f5f5;
}

.top-Firstline, .top-SecondLine {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 20px; 
  background-color: #d5e8d4;
}

.searchbar {
  margin-right: 100px;
}

.logo-link {
  display: flex;
  align-items: center;
  cursor: pointer;
}

.website-logo {
  height: 70px; 
  width: auto; 
}

.Content {
  display: flex;
  align-items: center;
}

.titlecontent{
  color: #4caf50;
}

.el-dropdown-link, .el-dropdown-menu {
  color: #2c662d;
}
</style>