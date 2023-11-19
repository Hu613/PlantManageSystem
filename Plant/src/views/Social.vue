<template>
<div class="HotSocial">
  <h1>Hot Share</h1><br/>
  <Hotsocial></Hotsocial>
</div>
<div class="NewSocial">
  <h1>New Share</h1><br/>
  <Newsocial></Newsocial>
</div>
<div class="AllSocial">
  <h1>All Share</h1><br/>
  <Allsocial></Allsocial>
</div>
</template>

<script setup>

import Allsocial from '../components/content/socialcontent/allsocial.vue';
import Hotsocial from '../components/content/socialcontent/hotsocial.vue';
import Newsocial from '../components/content/socialcontent/newsocial.vue';

</script>

<style scoped>
</style>
