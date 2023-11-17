<template>
    <div class="context">
      <router-view></router-view>
    </div>
  </template>
  
  <script>
  export default {
    name: "Content",
    created() {
    
    },
  };
  </script>
 <style scoped>
 .context {
   width: 82%;
   height: 100%;
   float: left;
   overflow: auto; 
   background: white; 
   color: black; 
 }
 </style>
 