<template>
  <div id="app">
    <button id="btnPublisherSearchModal" v-on:click="publisherSearchShow" class="hidden-btn"></button>
    <modal name="modal-publisher-search" :draggable="true" :resizeable="true">
      <h1>Modal Test</h1>
    </modal>
  </div>
</template>

<script>
export default {
  methods: {
    publisherSearchShow() {
      this.$modal.show('modal-publisher-search')
    }
  }
}
</script>

<style scoped>
.hidden-btn {
  display: none;
}
</style>
