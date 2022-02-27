import Vue from 'vue'
import App from '../manager_author_select.vue'
import VModal from 'vue-js-modal'

Vue.use(VModal);

document.addEventListener('DOMContentLoaded', () => {
  const selectedAuthors = document.getElementById('bookAuthors').value;
  const props = { selectedAuthors: JSON.parse(selectedAuthors)};

  const app = new Vue({
    render: h => h(App, { props }),
  }).$mount();
  document.getElementById('cellAuthorSelect').appendChild(app.$el);
})