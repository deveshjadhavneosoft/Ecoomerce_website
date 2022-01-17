<template>
  <div class="col-sm-3">
    <div class="left-sidebar">
      <h2>Category</h2>
      <div class="panel-group category-products" id="accordian">
        <!--category-productsr-->
        <div v-for="(category, index) in categories" v-bind:key="index">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <router-link :to="`/category/${category.id}`">{{
                  category.name
                }}</router-link>
              </h4>
            </div>
          </div>
        </div>
      </div>
      <!--/category-products-->

      <div class="shipping text-center">
        <!--shipping-->
        <img src="images/home/shipping.jpg" alt="" />
      </div>
      <!--/shipping-->
    </div>
  </div>
</template>

<script>
import { categories } from "@/common/Service";
export default {
  name: "Sidebar",
  data() {
    return {
      categories: null,
    };
  },
  mounted() {
    categories().then((res) => {
      console.log(res.data);
      this.categories = res.data.category;
    });
  },
};
</script>

<style>
</style>