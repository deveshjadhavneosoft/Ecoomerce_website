<template>
  <header id="header">
    <!--header-->
    <div class="header_top">
      <!--header_top-->
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <div class="contactinfo">
              <ul class="nav nav-pills">
                <li>
                  <a href="#"
                    ><i class="fa fa-phone"></i>+91 {{ contact.phone_no }}</a
                  >
                </li>
                <li>
                  <a href="#"
                    ><i class="fa fa-envelope"></i> {{ contact.admin_email }}</a
                  >
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="social-icons pull-right">
              <ul class="nav navbar-nav">
                <li>
                  <a href="#"><i class="fa fa-facebook"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-twitter"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-linkedin"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-dribbble"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-google-plus"></i></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/header_top-->

    <div class="header-middle">
      <!--header-middle-->
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="logo pull-left">
              <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
            </div>
            <div class="btn-group pull-right">
              <div class="btn-group">
                <button
                  type="button"
                  class="btn btn-default dropdown-toggle usa"
                  data-toggle="dropdown"
                >
                  USA
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="#">Canada</a></li>
                  <li><a href="#">UK</a></li>
                </ul>
              </div>

              <div class="btn-group">
                <button
                  type="button"
                  class="btn btn-default dropdown-toggle usa"
                  data-toggle="dropdown"
                >
                  DOLLAR
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li><a href="#">Canadian Dollar</a></li>
                  <li><a href="#">Pound</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-8">
            <div class="shop-menu pull-right">
              <ul class="nav navbar-nav">
                <li>
                  <router-link :to="`/account/${user}`" v-if="user"
                    ><i class="fa fa-user"></i> Account</router-link
                  >
                </li>
                <li>
                  <router-link to="/wishlist" v-if="user"
                    ><i class="fa fa-star"></i> Wishlist</router-link
                  >
                </li>
                <li>
                  <router-link to="/checkout">Checkout</router-link>
                </li>
                <li>
                  <router-link to="/cart"
                    ><i class="fa fa-shopping-cart"></i> Cart [{{
                      numInCart
                    }}]</router-link
                  >
                </li>
                <li>
                  <router-link to="#" v-if="user"
                    ><b>Welcome {{ user }}</b>
                  </router-link>
                </li>

                <li>
                  <!-- <button v-if="loginn" @click="logout()">Logout</button> -->
                  <router-link to="/" v-if="loginn" @click.native="logout()"
                    ><button class="btn btn-warning">
                      Logout
                    </button></router-link
                  >
                  <router-link to="/login" v-if="!loginn">Login</router-link>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/header-middle-->

    <div class="header-bottom">
      <!--header-bottom-->
      <div class="container">
        <div class="row">
          <div class="col-sm-9">
            <div class="navbar-header">
              <button
                type="button"
                class="navbar-toggle"
                data-toggle="collapse"
                data-target=".navbar-collapse"
              >
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div class="mainmenu pull-left">
              <ul class="nav navbar-nav collapse navbar-collapse">
                <li><router-link to="/">Home </router-link></li>
                <li class="dropdown">
                  <a href="#">Categories<i class="fa fa-angle-down"></i></a>
                  <ul role="menu" class="sub-menu">
                    <li v-for="(category, index) in categories" :key="index">
                      <router-link :to="`/category/${category.id}`">{{
                        category.name
                      }}</router-link>
                    </li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a href="#">Explore<i class="fa fa-angle-down"></i></a>
                  <ul role="menu" class="sub-menu">
                    <li v-for="(explore, index) in cms" :key="index">
                      <router-link :to="`/explore/${explore.id}`">{{
                        explore.title
                      }}</router-link>
                    </li>
                  </ul>
                </li>
                <li><router-link to="/myorders">My orders</router-link></li>
                <li>
                  <router-link to="/contact">contact us </router-link>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="search_box pull-right">
              <input type="text" placeholder="Search" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/header-bottom-->
  </header>
</template>

<script>
import { CMS } from "@/common/Service.js";
import { configuration } from "@/common/Service.js";
import { categories } from "@/common/Service";
import { mapState } from "vuex";
import store from "../store/store";
import * as type from "../store/type";
import { getToken } from "@/common/Jwttoken";
import axios from "axios";
export default {
  data() {
    return {
      useremail: localStorage.getItem("uid"),
      cms: undefined,
      contact: undefined,
      a: "",
      categories: undefined,
    };
  },
  name: "Header",
  computed: mapState({
    loginn: (state) => state.islogin,
    user: (state) => state.emailId,
    inCart() {
      return this.$store.getters.inCart;
    },
    numInCart() {
      return this.inCart.length;
    },
  }),
  methods: {
    logout() {
      const token = getToken();
      const url = "http://127.0.0.1:8000/api/logout/";
      const config = {
        headers: { Authorization: `Bearer ${token}` },
      };
      const data = token;
      axios.post(url, data, config).then((res) => {
        this.$router.push("/login");
        localStorage.removeItem("uid");
        localStorage.removeItem("id_token");
        store.dispatch({
          type: type.Islogin,
          id: null,
          userId: null,
        });
        this.$swal("user logout successfully", "", "success");
        console.log(res.data.message);
      });
    },
    show() {
      if ("id_token" in localStorage) {
        store.dispatch({
          type: type.Islogin,
          id: getToken(),
          userId: localStorage.getItem("uid"),
        });
      }
    },
  },
  created() {
    configuration().then((res) => {
      this.contact = res.data.details[0];
    });
  },
  mounted: function mounted() {
    this.show();
    CMS().then((res) => {
      this.cms = res.data.cms;
    });
    categories().then((res) => {
      console.log(res.data);
      this.categories = res.data.category;
    });
  },
};
</script>

<style>
</style>