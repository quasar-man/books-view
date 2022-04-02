import Vue from 'vue'
import ManagerAuthorSelect from '../manager_author_select.vue'
import ManagerPublisherSelect from '../manager_publisher_select.vue'
import ManagerTagSelect from '../manager_tag_select.vue'
import ManagerCategorySelect from '../manager_category_select.vue'
import VModal from 'vue-js-modal'

Vue.use(VModal);

document.addEventListener('DOMContentLoaded', () => {
  const selectedPublisher = document.getElementById('bookPublisher').value;
  const publisherSearchProps = { selectedPublisher: JSON.parse(selectedPublisher)};

  const managerPublisherSelect = new Vue({
    render: h => h(ManagerPublisherSelect, { publisherSearchProps }),
  }).$mount();
  document.getElementById('cellPublisherSelect').appendChild(managerPublisherSelect.$el);


  const selectedAuthors = document.getElementById('bookAuthors').value;
  const authorSearchProps = { selectedAuthors: JSON.parse(selectedAuthors)};

  const managerAuthorSelect = new Vue({
    render: h => h(ManagerAuthorSelect, { authorSearchProps }),
  }).$mount();
  document.getElementById('cellAuthorSelect').appendChild(managerAuthorSelect.$el);


  const selectedTags = document.getElementById('bookTags').value;
  const tagSearchProps = { selectedTags: JSON.parse(selectedTags)};

  const managerTagSelect = new Vue({
    render: h => h(ManagerTagSelect, { tagSearchProps }),
  }).$mount();
  document.getElementById('cellTagSelect').appendChild(managerTagSelect.$el);


  const selectedCategories = document.getElementById('bookCategories').value;
  const categorySearchProps = { selectedCategories: JSON.parse(selectedCategories)};

  const managerCategorySelect = new Vue({
    render: h => h(ManagerCategorySelect, { categorySearchProps }),
  }).$mount();
  document.getElementById('cellCategorySelect').appendChild(managerCategorySelect.$el);
})