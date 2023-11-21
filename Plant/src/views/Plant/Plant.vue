<template>
  <div class="Plant">
    <div class="Title">
      <h1>Plant</h1><br/>
      <div class="Planttext">
     <h2>Enjoy the planted life</h2>
     <h3>Why do we plant especially in our lives?</h3>
     <h4>Nothing adds more beauty and comfort to our life than the lush flowers and foliage of indoor plants. Bedrooms, bathrooms, kitchens, cubicles... There really isn't a space  can't enliven. Just add light and water, and you've got a growing indoor oasis. Bringing plants into your home is aesthetically pleasing and - amazingly - plants can offer strong health benefits as well!</h4>
     <h4>Multiple studies have proven that  plants keep you healthier and happier, offering both psychological and physical health benefits that include:</h4>
     <h4>1. Improving your modd</h4>
     <h4>2. Reducing fatigue</h4>
     <h4>3. Lowering stress and anxiety</h4>
     <h4>4. Improving office performance and focus</h4>
     <h4>5. Boosting healing and pain tolerance</h4>
     <h4>6. Minimizing the occurrence of headaches by improving air quality</h4>
     <h4>7. Easing dry skin and respiratory ailments due to dry air</h4>
      </div>
    </div>
    <div class="Pestpart">
      <h1>Disgusting pests!</h1>
      <div class="pesttext">
        <h2>When you have a problem with your plants being in poor condition, consider if it has anything to do with the damn pests!</h2>
        <h3>When a houseplant looks less than healthy, most often, it is the result of improper care. Factors such as too much or too little water, light, heat, or fertilizer can cause many plant problems. However, in some cases, the problem results from a pest infestation. Several insects and other pests feed on houseplants. These pests most often come into the home on newly purchased plants or on those that have been outside for the summer.</h3>
        <h3>Prevention</h3>
        <h4>The best way to control insects and related pests on houseplants is through prevention, as it is almost always easier to prevent a pest infestation than to eliminate one. Several precautions can be taken, which will decrease the chances of dealing with a pest infestation of most houseplants.</h4>
        <h3>Non-Chemical Control</h3>
        <h4>The first step in control is to isolate any plant suspected of being infested with a pest. Then, keep the plant separate from other houseplants until the pest is completely controlled. This process may take several weeks or more.</h4>
        <h3>Chemical Control</h3>
        <h4>If non-chemical control methods have failed and the plant is valuable, a stronger pesticide may be necessary. Before choosing a pesticide, it is important to identify the pest accurately. In general, a single pesticide will not kill all kinds of pests. Some pesticides are only effective against certain pests or certain life stages of particular pests. In addition, it is important to understand that more than one application of a pesticide is often necessary for control. When possible, alternate the pesticide used from one application to the next as some pests develop resistance quickly.</h4>
        <h3>Major Pests: </h3>
        <h4>Aphids, Mealybugs, Spider Mites, Fungus Gnats, Root Ball Pests, Scales, Whiteflies</h4>
        <h3>Less Common Pests</h3>
        <h4>Thrips, Springtails, Leafminers, Beetles, Caterpillars</h4>
      </div>
    </div>
    <el-divider />
    <div class="Plantcard">
      <h1>Plant Type :</h1>
      <planttypecard></planttypecard>
    </div>
  </div>

 
  </template>

<script setup>
import planttypecard from '../../components/content/plantcontent/planttypecard.vue';


</script>