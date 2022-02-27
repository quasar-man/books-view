import Vue from 'vue'
import ManagerAuthorSelect from '../manager_author_select.vue'
import ManagerPublisherSelect from '../manager_publisher_select.vue'
import VModal from 'vue-js-modal'

Vue.use(VModal);

document.addEventListener('DOMContentLoaded', () => {
  const selectedAuthors = document.getElementById('bookAuthors').value;
  const authorSearchProps = { selectedAuthors: JSON.parse(selectedAuthors)};

  const managerAuthorSelect = new Vue({
    render: h => h(ManagerAuthorSelect, { authorSearchProps }),
  }).$mount();
  document.getElementById('cellAuthorSelect').appendChild(managerAuthorSelect.$el);


  const selectedPublisher = document.getElementById('bookPublisher').value;
  const publisherSearchProps = { selectedPublisher: JSON.parse(selectedPublisher)};

  const managerPublisherSelect = new Vue({
    render: h => h(ManagerPublisherSelect, { publisherSearchProps }),
  }).$mount();
  document.getElementById('cellPublisherSelect').appendChild(managerPublisherSelect.$el);
})