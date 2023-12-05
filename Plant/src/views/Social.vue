<template>
<div class="Social">
  <section class="socialcard">
  <h1>Hot Share</h1><br/>
  <Hotsocial></Hotsocial>
</section>
</div>
<div class="Social">
  <section class="socialcard">
  <h1>New Share</h1><br/>
  <Newsocial></Newsocial>
</section>
</div>
<div class="Social">
  <section class="socialcard">
  <h1>All Share</h1><br/>
  <Allsocial></Allsocial>
</section>
</div>
</template>

<script setup>

import Allsocial from '../components/content/socialcontent/allsocial.vue';
import Hotsocial from '../components/content/socialcontent/hotsocial.vue';
import Newsocial from '../components/content/socialcontent/newsocial.vue';

</script>

<style scoped>
.Social {
  padding: 20px;
}

.socialcard {
  margin-bottom: 30px;
}

.socialcard h2 {
  color: #2c662d;
  margin-bottom: 15px;
}

</style>
