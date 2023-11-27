<template>
  <div class="gardencard">
    <h1>Edit your Garden Layout!</h1>
    <el-row>
      <el-col v-for="(card, index) in gardenCards" :key="index" :span="8">
        <el-card :body-style="{ padding: '10px' }">
          <img :src="card.userplantpicture || 'test.png'" class="userplant-picture" alt="" />
          <div style="padding: 14px">
            <span>{{ card.plantname || 'Select a plant' }}</span>
            <el-button  @click="() => openChangeDialog(index)" size="large">Change</el-button>
            <el-button  @click="() => openSchedule(index)" size="large">Plant Schedule</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>
  
    <el-dialog v-model="changeDialogVisible" title="Select Plant" width="50%" draggable>
      <div>
        <el-select v-model="selectedPlantType" placeholder="Select plant type" @change="onPlantTypeChange">
          <el-option v-for="item in plantTypes" :key="item.tagid" :label="item.title" :value="item.tagid"></el-option>
        </el-select>
        <el-select v-model="selectedPlant" placeholder="Select plant" v-if="plantOptions.length > 0">
          <el-option v-for="plant in plantOptions" :key="plant.plantid" :label="plant.plantname" :value="plant.plantid"></el-option>
        </el-select>
        <el-button @click="confirmPlantSelection">Confirm</el-button>
        <el-button @click="changeDialogVisible = false">Cancel</el-button>
      </div>
    </el-dialog>
  
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';

const route = useRoute();
const gardenId = route.params.gardenid;
const gardenCards = ref([]);
const changeDialogVisible = ref(false);
const selectedPlantType = ref(null);
const selectedPlant = ref(null);
const plantTypes = ref([]); 
const plantOptions = ref([]);
const currentCardIndex = ref(-1);


const openChangeDialog = (index) => {
  changeDialogVisible.value = true;
  currentCardIndex.value = index;
  selectedPlantType.value = null;
  selectedPlant.value = null;
  plantOptions.value = [];
};

const onPlantTypeChange = async () => {
  if (selectedPlantType.value) {
    try {
      const response = await axios.get(`http://localhost:3000/tag/getPlanttypePage/${selectedPlantType.value}`);
      plantOptions.value = response.data.plants;
    } catch (error) {
      console.error('Error fetching plants:', error);
    }
  }
};

const confirmPlantSelection = async () => {
  if (currentCardIndex.value !== -1) {
    const plantId = selectedPlant.value === 'empty' ? null : selectedPlant.value;
    const selectedPlantData = plantId ? plantOptions.value.find(p => p.plantid === plantId) : { plantname: 'Select a plant', plantpicture: 'test.png' };

    gardenCards.value[currentCardIndex.value] = {
      ...selectedPlantData,
      plantid: plantId
    };

    try {
      const response = await axios.post('http://localhost:3000/gardencard/createOrUpdateGardenCard', {
        gardenid: gardenId,
        position: currentCardIndex.value,
        plantid: plantId,
      });

      console.log('Garden card updated:', response.data);
    } catch (error) {
      console.error('Error updating garden card:', error);
    }
  }
  changeDialogVisible.value = false;
};


onMounted(async () => {
  
  try {
    const response = await axios.get(`http://localhost:3000/garden/getGardenPage/${gardenId}`);
    const fetchedCards = response.data.cards;

    gardenCards.value = Array.from({ length: 9 }, (_, index) => {
      
      const foundCard = fetchedCards.find(card => card.position == index);
      return foundCard ? {
        ...foundCard,
        userplantpicture: foundCard.userplantpicture || 'test.png',
        plantname: foundCard.plantname || 'Select a plant'
      } : {
        plantid: null,
        plantname: 'Select a plant',
        userplantpicture: 'test.png'
      };
    });


    const typeResponse = await axios.get('http://localhost:3000/tag/gettag');
    plantTypes.value = typeResponse.data;
  } catch (error) {
    console.error('Error fetching garden data:', error);
  }
});





</script>

<style scoped>
.userplant-picture {
  width: 100%;
  height: auto;
}
</style>
