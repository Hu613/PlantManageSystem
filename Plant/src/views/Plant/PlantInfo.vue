<template>
    <div class="Plantinfo">
        <h1>Plant</h1>
        <el-select v-model="value" class="m-2" placeholder="Select" size="large">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value"
    />
  </el-select>

  <h1>List: </h1><br/>
 <plantcard></plantcard>
    </div>
</template>
<script lang="ts" setup>
import { ref } from 'vue'
import plantcard from '../../components/content/plantcontent/plantcard.vue';

const value = ref('')

const options = [
  {
    value: 'Option1',
    label: 'Option1',
  },
  {
    value: 'Option2',
    label: 'Option2',
  },
  {
    value: 'Option3',
    label: 'Option3',
  },
  {
    value: 'Option4',
    label: 'Option4',
  },
  {
    value: 'Option5',
    label: 'Option5',
  },
]
</script>