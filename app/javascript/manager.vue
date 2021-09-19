<template>
  <div id="app">
    <button id="btnPublisherSearchModal" v-on:click="publisherSearchShow" class="hidden-btn"></button>
    <modal name="modal-publisher-search" :height="480" :draggable="true" :resizeable="true">
      <div class="modal-inner-area">
        <h2 class="search-modal-h2">出版社検索</h2>
        <section class="search-data-area">
          <ul class="search-item-ul">
            <li v-for="publisher in publishers" class="search-item-li">
              <label v-bind:for="publisher.id" class="search-item-label">
                <input type="radio" v-bind:id="publisher.id" name="publishers" v-bind:value="publisher.id" @change="selectPublisher($event)" :data-name="publisher.name" />
                {{ publisher.name }}
              </label>
            </li>
          </ul>
        </section>
        <section class="search-btn-area">
          <button @click="publisherSelected()" class="search-ok-btn">OK</button>
          <button @click="publisherSearchModalClose()" class="search-close-btn">Close</button>
        </section>
      </div>
    </modal>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function() {
    return {
      publishers: [],
      publisher: null,
    }
  },
  methods: {
    publisherSearchShow() {
      this.$modal.show('modal-publisher-search')
      axios
        .get('/manager/publishers.json')
        .then(res => ( this.publishers = res.data ))
    },
    selectPublisher(e) {
      if(e.target.checked) {
        this.publisher = {
          id: e.target.value,
          name: e.target.dataset.name,
        };
      }
    },
    publisherSearchModalClose() {
      this.$modal.hide('modal-publisher-search');
    },
    publisherSelected() {
      if(!this.publisher) { return; }

      const publisherId = document.getElementById('publisherId');
      if(publisherId) { publisherId.value = this.publisher.id; }
      const publisherName = document.getElementById('publisherName');
      if(publisherName) { publisherName.innerHTML = this.publisher.name; }
      this.publisherSearchModalClose();
    }
  }
}
</script>

<style scoped>
.hidden-btn {
  display: none;
}
.modal-inner-area {
  padding: 16px;
}
.search-modal-h2 {
  border-bottom: 2px solid #0ee4ff;
  font-style: italic;
}
.search-data-area {
  overflow-y: scroll;
  min-height: 320px;
}
.search-item-ul {
  padding: 0;
}
.search-item-li {
  list-style: none;
  font-size: 20px;
  padding: 8px 2px;
  display: block;
  border-top: 1px solid #c4c4c4;
}
.search-item-li:hover {
  background-color: #c4efff;
}
.search-item-label {
  display:block;
  width: 100%;
}
.search-item-li:nth-child(even) {
  background-color: #f3f3f3;
}
.search-btn-area {
  padding: 16px;
  text-align: right;
}
.search-ok-btn {
  width: 80px;
  background-color: #b3b3ff;
  border: 2px solid #8787ff;
  border-radius: 3px;
}
.search-ok-btn:hover {
  background-color: #c6c6ff;
}
.search-close-btn {
  width: 80px;
  background-color: #ffb3b3;
  border: 2px solid #ff8787;
  border-radius: 3px;
}
.search-close-btn:hover {
  background-color: #ffc6c6;
}
</style>
