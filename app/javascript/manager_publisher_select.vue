<template>
  <div>
    <a href='javascript:void(0);' class="search-btn" @click="publisherSearchShow">Publisher Search</a>
    {{ checkedPublisher.name }}
    <input type="hidden" name="publisher[id]" v-bind:value="checkedPublisher.id" />
    <input type="hidden" name="publisher[name]" v-bind:value="checkedPublisher.name" />
    <modal name="modal-publisher-search" :height="480" :draggable="true" :resizeable="true">
      <div class="modal-inner-area">
        <h2 class="search-modal-h2">出版社検索</h2>
        <section class="search-data-area">
          <ul class="search-item-ul">
            <li v-for="publisher in publishers" class="search-item-li">
              <label v-bind:for="publisher.id" class="search-item-label">
                <input type="radio" v-bind:id="publisher.id" name="publisher" v-bind:value="publisher.id" @click="selectPublisher($event)" v-bind:checked="defSelected(publisher.id)" :data-name="publisher.name" />
                {{ publisher.name }}
              </label>
            </li>
          </ul>
        </section>
        <section class="search-btn-area">
          <a @click="publisherSelected()" class="search-ok-btn" href="javascript:void(0)">OK</a>
          <a @click="publisherSearchModalClose()" class="search-close-btn" href="javascript:void(0)">Close</a>
        </section>
      </div>
    </modal>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  props: {
    'selectedPublisher' : {
      type: Object,
      default: () => ({})
    }
  },
  data: function() {
    return {
      publishers: [],
      checkedPublisher: {},
      modalSelectPublisher: {},
    }
  },
  methods: {
    publisherSearchShow() {
      this.$modal.show('modal-publisher-search')
      axios
        .get('/manager/publishers.json')
        .then(res => ( this.publishers = res.data ));

      this.modalSelectPublisher = this.selectedPublisher;
    },
    defSelected(id) {
      return this.modalSelectPublisher["id"] == id;
    },
    selectPublisher(e) {
      this.modalSelectPublisher = {
        id: e.target.value,
        name: e.target.dataset.name,
      };
    },
    publisherSearchModalClose() {
      this.$modal.hide('modal-publisher-search');
    },
    publisherSelected() {
      this.checkedPublisher = this.modalSelectPublisher;
      this.publisherSearchModalClose();
    }
  }
}
</script>
