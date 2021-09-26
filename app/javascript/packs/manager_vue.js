import Vue from 'vue'
import App from '../manager.vue'
import VModal from 'vue-js-modal'

Vue.use(VModal);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App),
  }).$mount();
  document.body.appendChild(app.$el);

  const btnPublisherSearch = document.getElementById('btnPublisherSearch');
  const btnAuthorSearch = document.getElementById('btnAuthorSearch');
  btnPublisherSearch.addEventListener('click', () => {
    btnPublisherSearchModal.click();
  })
  btnAuthorSearch.addEventListener('click', () => {
    btnAuthorSearchModal.click();
  })
})