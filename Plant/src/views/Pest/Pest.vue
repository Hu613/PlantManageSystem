<template>
    <div class="Pest">
      <div class="Title">
        <h1>Why we hate pest?</h1><br/>
        <div class="Pesttext">
       <h2>Pests can pose significant threats to both indoor and outdoor personal plant cultivation</h2>
       <h3>Indoor Planting:</h3>
       <h4>1. Pest Infestation: Indoor planting is often more susceptible to pest infestations as the controlled indoor environment can provide ideal conditions for pests to thrive and reproduce. </h4>
       <h4>2. Types of Pests: Indoor pests can include aphids, mites, mealybugs, ants, and others. They can directly damage the plant's leaves, roots, or fruits.</h4>
       <h4>3. Reproduction Rate: Pests may reproduce more rapidly indoors due to the controlled temperature and humidity, which favor their reproduction.</h4>
       <h4>4. Disease Transmission: Some indoor pests can transmit plant pathogens, leading to plant diseases and even death.</h4>
       <h3>How to prevent pests?</h3>
       <h4>1. Monitoring: Regularly inspect your plants for signs of pest infestations. Look for discolored leaves, small holes, or unusual markings.</h4>
       <h4>2. Maintain Plant Health: Healthy plants are less susceptible to pests. Provide proper nutrition, watering, and care to keep your plants robust.</h4>
       <h4>3. Isolation: If you introduce new plants to your collection, isolate them for a period to ensure they are not carrying pests before placing them near existing plants.</h4>
       <h4>4. Cleanliness: Keep your gardening area clean by removing fallen leaves and debris, as pests can hide in these materials.</h4>
       <h4>5. Natural Predators: Encourage the presence of beneficial insects like ladybugs and predatory mites that feed on pests.</h4>
       <h4>6. Companion Planting: Planting certain herbs or flowers alongside your main crops can deter pests. For example, marigolds can deter aphids.</h4>
       <h4>7. Rotate Crops: In outdoor gardening, practice crop rotation to disrupt the life cycles of pests and reduce their populations.</h4>
       <h4>8. Physical Barriers: Use row covers, netting, or fencing to physically prevent pests from reaching your plants.</h4>
       <h4>9. Chemical Control: As a last resort, consider using chemical pesticides, but do so sparingly and follow the manufacturer's instructions. Organic and less toxic options are often available.</h4>
       <h4>10. Early Intervention: If you identify a pest problem, address it promptly to prevent it from spreading to other plants.</h4>
       <h4>Remember that prevention is often more effective and environmentally friendly than trying to control a full-blown pest infestation. Regular vigilance and a combination of these strategies can help you keep your plants healthy and pest-free.</h4>
        </div>
      </div>
      <div class="Pestpart">
        <h1>You have to be especially careful with these pests!</h1>
        <el-divider />
        <div class="pesttext">
         <pestcard></pestcard>
        </div>
        <el-divider />
        <div class="supplier">
            <h1>If you need to prevent or eliminate pests these suppliers may be able to provide you with the tools or items you need!</h1>
            <h2><a href="https://www.organiccatalogue.com/equipment/plant-protection/pest-control/?gclid=Cj0KCQiA6vaqBhCbARIsACF9M6nQBvGPI6ODRy9EQjkGFOMoqtIr3zYLyfI1YFSQxtTq2XmucaWSdfcaAtz9EALw_wcB" target="_blank" >1. The Organic Gardening Catalogue</a></h2>
            <h2><a href="https://www.greengardener.co.uk/" target="_blank" >2. Green Gardener</a></h2>
            <h2><a href="https://www.pestcontrolsupplies.co.uk/" target="_blank" >3. PestControlSupplies</a></h2>
        </div>
      </div>
  

    </div>
  
   
    </template>
  
  <script setup>
  import pestcard from '../../components/content/pestcontent/pestcard.vue';
  </script>