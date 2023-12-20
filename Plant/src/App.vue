<template>
  <div id="app">
    <Title></Title>   <!--import Title-->
    <el-divider />
    <div class="main-content">
      <div class="userside">
        <UserSide></UserSide> <!--import Userside-->
        
      </div>
      <div class="midcontent">
        <Content></Content><!--import Content-->
      </div>
    </div>
  </div>
</template>

<script setup>
import Title from "@/views/Title.vue";
import Content from "@/views/Content.vue";
import UserSide from "@/views/UserSide.vue";
</script>

<style>
#app {
  display: flex;
  flex-direction: column;
  min-height: 100vh; 
  width: 100%;
  background-image: url('./background.png'); 
  background-size: cover; 
  background-repeat: no-repeat; 
  background-attachment: fixed; 
  
}

.main-content {
  display: flex;
  flex: 1; 
  
  color: black;
}
.midcontent {
  display: flex;
  flex: 1; 
 
  color: black;
}
.userside {
  flex: 0 0 220px; 
    
}

.context {
  flex-grow: 1; 
  
}
</style>
