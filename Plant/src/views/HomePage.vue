<template>
  <div class="shareguide">
    <h1>Share your Experience you want to share</h1>
    <el-row :gutter="20">
    <el-col :span="6"><div class="grid-content ep-bg-purple" /><el-icon color="lightgreen" size="100px"><Opportunity /></el-icon></el-col>
    <el-col :span="6"><div class="grid-content ep-bg-purple" /><el-icon color="lightgreen" size="100px"><Flag /></el-icon></el-col>
    <el-col :span="6"><div class="grid-content ep-bg-purple" /><el-icon color="lightgreen" size="100px"><Shop /></el-icon></el-col>
    
  </el-row>
    <el-row :gutter="20">
    <el-col :span="6"><div class="grid-content ep-bg-purple" />Have a good idea? Wanna Share with others? </el-col>
    <el-col :span="6"><div class="grid-content ep-bg-purple" />Login and Share your Experience!</el-col>
    <el-col :span="6"><div class="grid-content ep-bg-purple" />Go Social Page, See Everyone's Life!</el-col>

  </el-row>
  </div>
  <div class="HotSocial">
    <h1>Hot Share : </h1><br/>
    <Hotsocial></Hotsocial>
  </div>
  <div class="Plant">
    <h1>Find you Plant </h1><br/>
    <plant></plant>
  </div>
  <div class="Pest">
    <h1>Pest Management: </h1><br/>
    <pest></pest>
  </div>
  <div class="Supplier">
    <h1>Supplier : </h1><br/>
    <Supplier></Supplier>
  </div>

  </template>
  
  <script setup>
  
  import Hotsocial from '../components/content/socialcontent/hotsocial.vue';
  
  </script>
  
  <style scoped>
  .shareguide{
    background-color: white;
  }
  .el-row {
  margin-bottom: 20px;
}

.el-row:last-child {
  margin-bottom: 0;
}
.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  min-height: 36px;
}

  </style>
  