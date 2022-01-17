
import Vue from 'vue'
import Vuex from 'vuex';
Vue.use(Vuex);
export default new Vuex.Store({
    state: {
        islogin: "",
        emailId: "",
        amount: 0,
        coupon: "",
        inCart: JSON.parse(localStorage.getItem('mycart')) ? JSON.parse(localStorage.getItem('mycart')) : []
    },
    getters: {
        inCart: state => state.inCart,
        amount: state => state.amount,
        coupon: state => state.coupon
    },
    mutations: {
        mylogin(state, payload) {
            return state.islogin = payload.id,
                state.emailId = payload.userId

        },
        ADD_TO_CART(state, id) { state.inCart.push(id) },
        DEL_ITEM(state, id) { state.inCart.splice(id, 1) },
        Amount(state, pay) { state.amount = pay },
        Coupon(state, pay) { state.coupon = pay },
    },
    actions: {
        islogin(context, payload) {
            context.commit('mylogin', payload)
        },
        addToCart(context, id) { context.commit('ADD_TO_CART', id) },
        remItem(context, id) { context.commit('DEL_ITEM', id) },
        amount(context, id) { context.commit('Amount', id) },
        coupon(context, id) { context.commit('Coupon', id) },
    }
})