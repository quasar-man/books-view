import Vue from 'vue'
import App from '../manager.vue'
import VModal from 'vue-js-modal'

Vue.use(VModal);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  const btnPublisherSearch = document.getElementById('btnPublisherSearch');
  btnPublisherSearch.addEventListener('click', () => {
    btnPublisherSearchModal.click()
  })
})