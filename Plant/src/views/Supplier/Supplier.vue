<template>
    <div class="Supplier">
      <div class="Title">
       <h1>Supplier</h1><br/>
       <h2><el-icon style="font-size: 80px;"><InfoFilled /></el-icon>Why we afford Supplier Info?</h2>
       <h3>In order to make it easier for users to grow plants, we not only provide information on the types of plants and their corresponding information and pests, but we also provide suppliers of the corresponding plants to be purchased, suppliers of the tools needed for the plants, and suppliers of the corresponding pests to be purchased.</h3>
        </div>
        <h2><el-icon style="font-size: 80px;"><StarFilled /></el-icon>What can these suppliers do for us?</h2>
        <h3>We have carefully selected suppliers for each category, offering specialized services and assistance tailored to your needs. Whether you are looking for plants, seeds, various tools, pest control, and more, our suppliers are equipped to provide you with professional support. You can conveniently make purchases online or visit our offline locations for in-person shopping.</h3>
      </div>
      <el-divider />
      <div class="suppliercontent">
        <h1>Plant Type Supplier :</h1>
        <planttypesupplier></planttypesupplier>
      </div>
      <div class="suppliercontent">
        <h1>Pest Suppllier</h1>
       <pestsupplier></pestsupplier>
      </div>
      <div class="suppliercontent">
        <h1>Plant Kit</h1>
        <getplantkitsupplier></getplantkitsupplier>
      </div>
  
   
    </template>
  
  <script setup>
import getplantkitsupplier from './getplantkitsupplier.vue';
import pestsupplier from './pestsupplier.vue';
import planttypesupplier from './planttypesupplier.vue';
  
  
  </script>

<style scoped>
.Supplier {
  padding: 20px;
}

.Title {
  margin-bottom: 30px;
}

.Title h1 {
  font-size: 28px;
  color: #333;
  margin-bottom: 10px;
}

.Title p {
  font-size: 16px;
  color: #666;
  line-height: 1.5;
}

.suppliercontent {
  margin-bottom: 20px;
}

.suppliercontent h1 {
  font-size: 24px;
  color: #333;
  margin-bottom: 10px;
}
</style>