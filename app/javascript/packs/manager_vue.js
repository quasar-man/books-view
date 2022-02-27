import Vue from 'vue'
import ManagerAuthorSelect from '../manager_author_select.vue'
import VModal from 'vue-js-modal'

Vue.use(VModal);

document.addEventListener('DOMContentLoaded', () => {
  const selectedAuthors = document.getElementById('bookAuthors').value;
  const props = { selectedAuthors: JSON.parse(selectedAuthors)};

  const managerAuthorSelect = new Vue({
    render: h => h(ManagerAuthorSelect),
  }).$mount();
  document.getElementById('cellAuthorSelect').appendChild(managerAuthorSelect.$el);
})