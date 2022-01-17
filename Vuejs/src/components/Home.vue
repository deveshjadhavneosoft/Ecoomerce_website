<template>
  <div>
    <section>
      <div class="container">
        <div class="row">
          <Sidebar />
          <div class="col-sm-9 padding-right">
            <div class="features_items">
              <!--features_items-->
              <h2 class="title text-center">Features Items</h2>
              <div
                class="col-sm-4"
                v-for="(pro, index) in category"
                :key="index"
              >
                <div class="product-image-wrapper">
                  <div class="single-products">
                    <div class="productinfo text-center">
                      <router-link :to="`/productdetails/${pro.id}`">
                        <img height="300px" width="250px" :src="pro.images[0].image" alt="" />
                        <h2>{{ pro.price }}</h2>
                        <p>{{ pro.name }}</p>
                        <a href="#" class="btn btn-default add-to-cart"
                          ><i class="fa fa-shopping-cart"></i>Add to cart</a
                        >
                      </router-link>
                    </div>
                  </div>
                  <div class="choose">
                    <ul class="nav nav-pills nav-justified">
                      <li></li>
                      <li>
                        <button
                          class="btn btn-warning wish"
                          @click="addToWishlist(pro)"
                        >
                          <i class="fa fa-plus-square"></i>Add to wishlist
                        </button>
                      </li>
                      <li>
                        <a href="#"
                          ><i class="fa fa-plus-square"></i>Add to compare</a
                        >
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <!--features_items-->

           

            
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import Sidebar from "./includes/Sidebar.vue";
import { categoryProduct } from "@/common/Service";
import { wishlist } from "@/common/Service";
export default {
  name: "Home",
  data() {
    return {
      category: undefined,
      paramm: undefined,
      user_mail: localStorage.getItem("uid"),
      server: "http://127.0.0.1:8000/uploads/",
    };
  },
  components: {
    Sidebar,
  },
  methods: {
    addToWishlist(product) {
      console.log(product);
      let obj = {
        email: this.user_mail,
        pro_id: product.id,
        product_id: product.product_id,
        product_name: product.name,
        product_price: product.price,
        image_path: product.images[0].image,
      };
      wishlist(obj).then((res) => {
        if (res.data.message == "already added") {
          this.$swal("already added", "", "error");
        } else {
          this.$swal("added to wishlist", "", "success");
        }
        console.log(res.data);
      });
    },
  },
  mounted() {
    categoryProduct(this.paramm).then((res) => {
      this.category = res.data.categories;
      console.log(res.data);
    });
  },
  watch: {
    $route(to) {
      this.paramm = to.params.id;
      categoryProduct(this.paramm).then((res) => {
        this.category = res.data.categories;
        console.log(res.data);
      });
    },
  },
  created() {
    this.paramm = this.$route.params.id;
  },
};
</script>

<style>
</style>