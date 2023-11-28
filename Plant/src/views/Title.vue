<template>
  <div class="top">
    <div class="top-Firstline">
      <form @submit.prevent="googlesearch" class="searchbar">
        <input type="search" v-model="searchcontent" placeholder="Google Search" />
        <el-button circle @click="googlesearch"><el-icon><ChromeFilled /></el-icon></el-button>
      </form>
      <el-button :icon="Search" circle @click="goSearchPage"></el-button>
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
        <el-dropdown-item command="b"><router-link to="/Supplier">Supplier Info</router-link></el-dropdown-item>
        <el-dropdown-item command="c"><router-link to="/Pest">Pest Help</router-link></el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
      </div>
      <router-link to="/Social">Social</router-link>
    </div>
   
    <div class="top-right">
      <el-button text @click="dialogVisible = true">
    click to open the Dialog
  </el-button>

  <el-dialog
    v-model="dialogVisible"
    title="Tips"
    width="30%"
  >
    
    <template #footer>
      <span class="dialog-footer">
        <Logintest></Logintest>
        <el-button @click="dialogVisible = false">Cancel</el-button>
      </span>
    </template>
  </el-dialog>
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
import Logintest from "../views/Logintest.vue";
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