<template>
  <div>
    <a id="btnAuthorSearch" href='javascript:void(0);' v-on:click="authorSearchShow" class="search-btn">Author Search</a>
    <ul id="authorNameList">
      <li v-for="author in checkedAuthors" :key="author.id">
          {{ author.name }}
        <input type="hidden" name="author[][id]" v-bind:value="author.id" />
        <input type="hidden" name="author[][name]" v-bind:value="author.name" />
      </li>
    </ul>
    <modal name="modal-authors-search" :height="480" :draggable="true" :resizeable="true">
      <div class="modal-inner-area">
        <h2 class="search-modal-h2">著者検索</h2>
        <section class="search-data-area">
          <ul class="search-item-ul">
            <li v-for="author in authors" class="search-item-li">
              <label v-bind:for="author.id" class="search-item-label">
                 <input type="checkbox" v-bind:id="author.id" name="author" v-bind:value="author.id" v-bind:checked="defChecked(author.id)" @change="selectAuthor($event)" :data-name="author.name" />
                 {{ author.name }}
              </label>
            </li>
          </ul>
        </section>
        <section class="search-btn-area">
          <button @click="authorSelected()" class="search-ok-btn">OK</button>
          <button @click="authorSearchModalClose()" class="search-close-btn">Close</button>
        </section>
      </div>
    </modal>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  props: {
    'selectedAuthors' : {
      type: Array,
      default: [],
      required: true
    }
  },
  data: function() {
    return {
      authors: [],
      checkedAuthors: [],
      modalSelectAuthors: {},
    }
  },
  methods: {
    authorSearchShow() {
      this.$modal.show('modal-authors-search')
      axios
        .get('/manager/authors.json')
        .then(res => ( this.authors = res.data ));

      if(this.selectedAuthors.length > 0) {
        this.selectAuthors.forEach(author => {
          this.modalSelectAuthors[author.id] = {
            id: author.id,
            name: author.name,
          };
        });
      }
    },
    defChecked(id) {
      return this.modalSelectAuthors[id] != null;
    },
    selectAuthor(e) {
      if(e.target.checked) {
        this.modalSelectAuthors[e.target.value] = {
          id: e.target.value,
          name: e.target.dataset.name,
        };
      } else {
        delete this.modalSelectAuthors[e.target.value];
      }
    },
    authorSearchModalClose() {
      this.$modal.hide('modal-authors-search');
    },
    authorSelected() {
      this.checkedAuthors = Object.values(this.modalSelectAuthors);
      this.authorSearchModalClose();
    }
  }
}
</script>
<style>
#authorNameList {
  list-style: none;
}
</style>
