<template>
  <div id="app">
    <Title></Title> 
    <div class="main-content">
      <UserSide></UserSide>
      <Content></Content>
    </div>
  </div>
</template>


<script>
import Title from "@/views/Title.vue";
import Content from "@/views/Content.vue";
import UserSide from "@/views/UserSide.vue";

export default {
  name: 'App',
  components: {
    Title,
    Content,
    UserSide,
  },
};
</script>

<style>

#app {
  display: flex;
  flex-direction: column;
  min-height: 100vh; 
  width: 100%; 
}

.top {
  width: 100%;
  background-color: rgb(243, 250, 247);
}

.main-content {
  display: flex;
  flex: 1; 
  background-color: white;
  color:black;
}

.userside {
  flex: 0 0 240px; 
  background-color: white;
}

.context {
  flex-grow: 1; 
  background-color: #fff; 
}
</style>
