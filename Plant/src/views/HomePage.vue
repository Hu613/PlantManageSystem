<template>
  <div class="shareguide">
    <h1>Share your Experience you want to share</h1>
    <el-row :gutter="20">
    <el-col :span="6"><div class="grid-content ep-bg-purple" /><el-icon color="lightgreen" size="100px"><Opportunity /></el-icon></el-col>
    <el-col :span="6"><div class="grid-content ep-bg-purple" /><el-icon color="lightgreen" size="100px"><Flag /></el-icon></el-col>
    <el-col :span="6"><div class="grid-content ep-bg-purple" /><el-icon color="lightgreen" size="100px"><Shop /></el-icon></el-col>
    
  </el-row>
  <el-row>
  <el-col :span="6">
    <div class="grid-content ep-bg-purple">
      <p style="font-size: 16px; font-weight: bold;">Have a good idea? Wanna Share with others?</p>
    </div>
  </el-col>
  <el-col :span="6">
    <div class="grid-content ep-bg-purple">
      <p style="font-size: 16px; font-weight: bold;">Login and Share your Experience!</p>
    </div>
  </el-col>
  <el-col :span="6">
    <div class="grid-content ep-bg-purple">
      <p style="font-size: 16px; font-weight: bold;">Go Social Page, See Everyone's Life!</p>
    </div>
  </el-col>
</el-row>

  </div>
  <div class="HotSocial">
    <h1>Hot Share : </h1><br/>
    <Hotsocial></Hotsocial>
  </div>
  <div class="Plant">
    <h1>Find you Plant </h1><br/>
    <Planttypecard></Planttypecard>
  </div>
  <div class="Pest">
    <h1>Pest Management: </h1><br/>
    <pestcard></pestcard>
  </div>
  <div class="Supplier">
    <h1>Supplier : </h1><br/>
    <suppliercard></suppliercard>
  </div>

  </template>
  
  <script setup>
  
  import Planttypecard from '../components/content/plantcontent/planttypecard.vue';
  import Hotsocial from '../components/content/socialcontent/hotsocial.vue';
  import pestcard from '../components/content/pestcontent/pestcard.vue';
  import suppliercard from '../components/content/suppliercontent/suppliercard.vue';
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
  