<template>
  <div class="gardencard">
    <h1>Edit your Garden Layout!</h1>
    <!--display gardencard-->
    <el-row>
      <el-col v-for="(card, index) in gardenCards" :key="index" :span="7">
        <el-card :body-style="{ padding: '10px' }">
          <img :src="card.userplantpicture || 'test.png'" class="userplant-picture" alt="" />
          <div style="padding: 12px">
            <span>{{ card.plantname || 'Select a plant' }}</span>
            <el-button  @click="() => openChangeDialog(index)" size="large">Change</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!--change plant menu-->
    <el-dialog v-model="changeDialogVisible" title="Select Plant" width="50%" draggable>
      <div>
        <!--choose planttype-->
        <el-select v-model="selectedPlantType" placeholder="Select plant type" @change="onPlantTypeChange">
          <el-option v-for="item in plantTypes" :key="item.tagid" :label="item.title" :value="item.tagid"></el-option>
        </el-select>
        <!--after choose planttype, choose these plant type plant-->
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
  changeDialogVisible.value = true; //open dialog
  currentCardIndex.value = index; //get index
  selectedPlantType.value = null; //set plany type is null
  selectedPlant.value = null; //set plant is null
  plantOptions.value = []; // define a array to store plants
};

//get user choose plant type plant data in plantOptions 
const onPlantTypeChange = async () => {
  if (selectedPlantType.value) {
    try {
      const response = await axios.get(`http://localhost:3000/tag/getPlanttypePage/${selectedPlantType.value}`);
      plantOptions.value = response.data.plants; //get plant data and set data in plantOptions.
    } catch (error) {
      console.error('Error fetching plants:', error);
    }
  }
};

const confirmPlantSelection = async () => {
  if (currentCardIndex.value !== -1) { //check index.value !==-1, if not equal -1, means user select one gardencard to change
    const plantId = selectedPlant.value === 'empty' ? null : selectedPlant.value; //if user select a plant, plantId is plantid, if not, plantId is null
    const selectedPlantData = plantId ? plantOptions.value.find(p => p.plantid === plantId) : { plantname: 'Select a plant', plantpicture: 'test.png' };
    //According the plantId, if it equal a plantid in plantOption, will set this plant info in selectedPlantData, if plantId is null, set default info

    gardenCards.value[currentCardIndex.value] = {
      ...selectedPlantData,
      plantid: plantId
    }; //update card, plantid to ensure if plantId is null, still can set gardenCards'plantid as null.

    try {
      const response = await axios.post('http://localhost:3000/gardencard/createOrUpdateGardenCard', {
        gardenid: gardenId,
        position: currentCardIndex.value,
        plantid: plantId,
      }); //send new gardencard info to back-end and update database or create a new record in database.

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

    gardenCards.value = Array.from({ length: 9 }, (_, index) => { //divide gardenCards into 9 with null value and index as index
      
      const foundCard = fetchedCards.find(card => card.position == index);//Checks if the card's position and index match, and if so, displays the card in that position.
      return foundCard ? { //if match, create a object which is foundCard, and display, if not create a default card
        ...foundCard,
        userplantpicture: foundCard.userplantpicture,
        plantname: foundCard.plantname
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
  width: 400px;
  height: 400px;
}
</style>
