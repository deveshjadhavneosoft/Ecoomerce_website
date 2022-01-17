<template>
  <section class="about-company-section">
    <div class="container p-1 p-sm-3">
      <div class="row">
        <div class="col-12 text-center">
          <hr />
        </div>

        <div class="col-md-4">
          <img
            class="img-fluid m-5"
            :src="server + details.image_path"
            width="250px"
            height="300px"
            alt=""
          />
        </div>

        <div class="col-md-9">
          <h1 class="text-center text-warning">{{ details.title }}</h1>
          <p>{{ details.description }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { cmsById } from "@/common/Service.js";
export default {
  name: "Explore",
  data() {
    return {
      details: undefined,
      paramm: undefined,
      server: "http://127.0.0.1:8000/uploads/",
    };
  },
  mounted() {
    cmsById(this.paramm).then((res) => {
      this.details = res.data.cms;
      console.log(res.data);
    });
  },
  watch: {
    $route(to) {
      this.paramm = to.params.id;
      cmsById(this.paramm).then((res) => {
        this.details = res.data.cms;
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