<template>
    <div class="Supplier">
      <div class="Title">
        <h1>Supplier</h1><br/>
        <div class="Planttext">
       <h2>Why we afford Supplier Info?</h2>
       <h3>In order to make it easier for users to grow plants, we not only provide information on the types of plants and their corresponding information and pests, but we also provide suppliers of the corresponding plants to be purchased, suppliers of the tools needed for the plants, and suppliers of the corresponding pests to be purchased.</h3>
        </div>
      </div>
      <el-divider />
      <div class="Planttype">
        <h1>Plant Type Supplier :</h1>
        <planttypesupplier></planttypesupplier>
      </div>
      <div class="Pest">
        <h1>Pest Suppllier</h1>
       <pestsupplier></pestsupplier>
      </div>
      <div class="getplantkit">
        <h1>Plant Kit</h1>
        <getplantkitsupplier></getplantkitsupplier>
      </div>
    </div>
  
   
    </template>
  
  <script setup>
import getplantkitsupplier from './getplantkitsupplier.vue';
import pestsupplier from './pestsupplier.vue';
import planttypesupplier from './planttypesupplier.vue';
  
  
  </script>