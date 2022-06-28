<template>
  <div>
    <a id="btnTagSearch" href='javascript:void(0);' v-on:click="tagSearchShow" class="search-btn">Tag Search</a>
    <ul id="tagNameList">
      <li v-for="tag in checkedTags" :key="tag.id">
          {{ tag.name }}
        <input type="hidden" name="tag[][id]" v-bind:value="tag.id" />
        <input type="hidden" name="tag[][name]" v-bind:value="tag.name" />
      </li>
    </ul>
    <modal name="modal-tags-search" :height="480" :draggable="true" :resizeable="true">
      <div class="modal-inner-area">
        <h2 class="search-modal-h2">タグ検索</h2>
        <section class="search-data-area">
          <ul class="search-item-ul">
            <li v-for="tag in tags" class="search-item-li">
              <label v-bind:for="tag.id" class="search-item-label">
                 <input type="checkbox" v-bind:id="tag.id" name="tag" v-bind:value="tag.id" v-bind:checked="defChecked(tag.id)" @change="selectTag($event)" :data-name="tag.name" />
                 {{ tag.name }}
              </label>
            </li>
          </ul>
        </section>
        <section class="search-btn-area">
          <a @click="tagSelected()" class="search-ok-btn" href="javascript:void(0)">OK</a>
          <a @click="tagSearchModalClose()" class="search-close-btn" href="javascript:void(0)">Close</a>
        </section>
      </div>
    </modal>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  props: {
    'selectedTags' : {
      type: Array,
      default: () => ([])
    }
  },
  data: function() {
    return {
      tags: [],
      checkedTags: [],
      modalSelectTags: {},
    }
  },
  methods: {
    tagSearchShow() {
      this.$modal.show('modal-tags-search')
      axios
        .get('/manager/tags.json')
        .then(res => ( this.tags = res.data ));

      if(this.selectedTags.length > 0) {
        this.selectedTags.forEach(tag => {
          this.modalSelectTags[tag.id] = {
            id: tag.id,
            name: tag.name,
          };
        });
      }
    },
    defChecked(id) {
      return this.modalSelectTags[id] != null;
    },
    selectTag(e) {
      if(e.target.checked) {
        this.modalSelectTags[e.target.value] = {
          id: e.target.value,
          name: e.target.dataset.name,
        };
      } else {
        delete this.modalSelectTags[e.target.value];
      }
    },
    tagSearchModalClose() {
      this.$modal.hide('modal-tags-search');
    },
    tagSelected() {
      this.checkedTags = Object.values(this.modalSelectTags);
      this.tagSearchModalClose();
    }
  }
}
</script>
<style>
#tagNameList {
  list-style: none;
}
</style>
