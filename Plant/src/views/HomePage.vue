<template>
  <div class="tagpart">
    <h1>Plant type :</h1>
    <planttypetag></planttypetag>
  </div>
  <div class="shareguide">
    <h1 class="title">Share your Experience you want to share</h1>
    <el-row :gutter="20" class="icon-row">
    <el-col :span="6"><div class="icon-col" /><el-icon color="lightgreen" size="100px"><Opportunity /></el-icon></el-col>
    <el-col :span="6"><div class="icon-col" /><el-icon color="lightgreen" size="100px"><Flag /></el-icon></el-col>
    <el-col :span="6"><div class="icon-col" /><el-icon color="lightgreen" size="100px"><Shop /></el-icon></el-col>
    
  </el-row>
  <el-row>
  <el-col :span="6">
    <div class="description">
      <p style="font-size: 16px; font-weight: bold;">Have a good idea? Wanna Share with others?</p>
    </div>
  </el-col>
  <el-col :span="6">
    <div class="description">
      <p style="font-size: 16px; font-weight: bold;">Login and Share your Experience!</p>
    </div>
  </el-col>
  <el-col :span="6">
    <div class="description">
      <p style="font-size: 16px; font-weight: bold;">Go Social Page, See Everyone's Life!</p>
    </div>
  </el-col>
</el-row>

  </div>
  <div class="HotSocial">
    <h1 class="CardTitle">Hot Share : </h1><br/>
    <Hotsocial></Hotsocial>
  </div>
  <div class="Plant">
    <h1 class="CardTitle">Find you Plant </h1><br/>
    <Planttypecard></Planttypecard>
  </div>
  <div class="Pest">
    <h1 class="CardTitle">Pest Management: </h1><br/>
    <pestcard></pestcard>
  </div>
  <div class="Supplier">
    <h1 class="CardTitle">Supplier : </h1><br/>
    <suppliercard></suppliercard>
  </div>

  </template>
  
  <script setup>
  
  import Planttypecard from '../components/content/plantcontent/planttypecard.vue';
  import Hotsocial from '../components/content/socialcontent/hotsocial.vue';
  import pestcard from '../components/content/pestcontent/pestcard.vue';
  import suppliercard from '../components/content/suppliercontent/suppliercard.vue';
  import planttypetag from '../components/content/plantcontent/planttypetag.vue';
  </script>
  
  <style scoped>
.homepage {
  color: #333;
  font-family: 'Arial', sans-serif;
}

.title, .CardTitle {
  color: #2c662d;
  text-align: center;
  margin-bottom: 20px;
}

.icon-row .icon-col {
  text-align: center;
}

.description {
  text-align: center;
  color: #555;
  font-size: 16px;
  font-weight: bold;
}

.HotSocial, .Plant, .Pest, .Supplier {
  margin-top: 40px;
}

</style>