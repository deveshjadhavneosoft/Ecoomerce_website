import Vue from 'vue';
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
Vue.use(VueSweetalert2);
import Router from 'vue-router';
Vue.use(Router);
import Main from '../components/Main.vue'
import Contact from '../components/Contact.vue';
import Login from '../components/Login.vue';
import Cart from '../components/Cart.vue';
import Productdetails from '../components/Productdetails.vue'
import Checkout from '../components/Checkout.vue'
import Home from '../components/Home.vue'
import Account from '../components/Account.vue'
import Wishlist from '../components/Wishlist.vue'
import Myorders from '../components/Myorders.vue'
import Explore from '../components/Explore.vue'
function myGuard(to, from, next) {
    let isAuthenticated = false;
    if (localStorage.getItem('uid') != undefined) {
        isAuthenticated = true;
    }
    else {
        isAuthenticated = false;
    }
    if (isAuthenticated) {
        next(); //allow to enter route
    }
    else {
        alert("pls login")
        next("/login");
    }
}
export default new Router({
    // mode: "history",
    routes: [
        {
            path: '/',
            name: 'Main',
            component: Main
        },
        {
            path: '/category/:id',
            name: 'Home',
            component: Home
        },
        {
            path: '/contact',
            name: 'Contact',
            component: Contact
        },
        {
            path: '/login',
            name: 'Login',
            component: Login
        },
        {
            path: '/explore/:id',
            name: 'Explore',
            component: Explore
        },
       
        {
            path: '/cart',
            name: 'Cart',
            component: Cart
        },
      
        {
            path: '/productdetails/:id',
            name: 'Productdetails',
            component: Productdetails
        },
        {
            path: '/checkout',
            name: 'Checkout',
            beforeEnter: myGuard,
            component: Checkout
        },

        {
            path: '/account/:id',
            name: 'Account',
            beforeEnter: myGuard,
            component: Account
        },
        {
            path: '/wishlist',
            name: 'Wishlist',
            beforeEnter: myGuard,
            component: Wishlist
        },
        {
            path: '/myorders',
            name: 'Myorders',
            beforeEnter: myGuard,
            component: Myorders
        },
    ]
})