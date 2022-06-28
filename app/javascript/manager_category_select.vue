<template>
  <div>
    <a id="btnCategorySearch" href='javascript:void(0);' v-on:click="categorySearchShow" class="search-btn">Category Search</a>
    <ul id="categoryNameList">
      <li v-for="category in checkedCategories" :key="category.id">
          {{ category.name }}
        <input type="hidden" name="category[][id]" v-bind:value="category.id" />
        <input type="hidden" name="category[][name]" v-bind:value="category.name" />
      </li>
    </ul>
    <modal name="modal-categories-search" :height="480" :draggable="true" :resizeable="true">
      <div class="modal-inner-area">
        <h2 class="search-modal-h2">カテゴリー検索</h2>
        <section class="search-data-area">
          <ul class="search-item-ul">
            <li v-for="category in categories" class="search-item-li">
              <label v-bind:for="category.id" class="search-item-label">
                 <input type="checkbox" v-bind:id="category.id" name="category" v-bind:value="category.id" v-bind:checked="defChecked(category.id)" @change="selectCategory($event)" :data-name="category.name" />
                 {{ category.name }}
              </label>
            </li>
          </ul>
        </section>
        <section class="search-btn-area">
          <a @click="categorySelected()" class="search-ok-btn" href="javascript:void(0)">OK</a>
          <a @click="categorySearchModalClose()" class="search-close-btn" href="javascript:void(0)">Close</a>
        </section>
      </div>
    </modal>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  props: {
    'selectedCategories' : {
      type: Array,
      default: () => ([])
    }
  },
  data: function() {
    return {
      categories: [],
      checkedCategories: [],
      modalSelectCategories: {},
    }
  },
  methods: {
    categorySearchShow() {
      this.$modal.show('modal-categories-search')
      axios
        .get('/manager/categories.json')
        .then(res => ( this.categories = res.data ));

      if(this.selectedCategories.length > 0) {
        this.selectedCategories.forEach(category => {
          this.modalSelectCategories[category.id] = {
            id: category.id,
            name: category.name,
          };
        });
      }
    },
    defChecked(id) {
      return this.modalSelectCategories[id] != null;
    },
    selectCategory(e) {
      if(e.target.checked) {
        this.modalSelectCategories[e.target.value] = {
          id: e.target.value,
          name: e.target.dataset.name,
        };
      } else {
        delete this.modalSelectCategories[e.target.value];
      }
    },
    categorySearchModalClose() {
      this.$modal.hide('modal-categories-search');
    },
    categorySelected() {
      this.checkedCategories = Object.values(this.modalSelectCategories);
      this.categorySearchModalClose();
    }
  }
}
</script>
<style>
#categoryNameList {
  list-style: none;
}
</style>
