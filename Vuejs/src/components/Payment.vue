<template>
  <div>
    <section id="cart_items">
      <div class="container">
        <div class="table-responsive cart_info">
          <table class="table table-condensed">
            <thead>
              <tr class="cart_menu">
                <td class="image">Item</td>
                <td class="description"></td>
                <td class="price">Price</td>
                <td class="quantity">Quantity</td>
                <td class="total">Total</td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <tr class="cart-menu" v-for="cart in details" :key="cart.id">
                <td class="cart_product">
                  <img
                    :src="server + cart.image_path"
                    alt=""
                    width="100px"
                    height="100px"
                  />
                </td>
                <td class="cart_description">
                  <h4>
                    <a href="">{{ cart.name }}</a>
                  </h4>
                  <p>Web ID: {{ cart.product_id }}</p>
                </td>
                <td class="cart_price">
                  <p>{{ cart.price }}</p>
                </td>
                <td class="cart_quantity">
                  <div class="cart_quantity_button">
                    <input
                      class="cart_quantity_input"
                      type="text"
                      name="quantity"
                      v-model="cart.quantity"
                      autocomplete="off"
                      size="2"
                    />
                  </div>
                </td>
                <td class="cart_total">
                  <p class="cart_total_price">
                    {{ cart.price * cart.quantity }}
                  </p>
                </td>
              </tr>
              <tr>
                <td colspan="4">&nbsp;</td>
                <td colspan="2">
                  <table class="table table-condensed total-result">
                    <tr>
                      <td>Total</td>
                      <td>
                        <span>{{ paymentt }}</span>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="p1">
          <router-link to="/checkout" class="btn btn-warning"
            >payment</router-link
          >
        </div>
      </div>
    </section>
    <!--/#cart_items-->
  </div>
</template>

<script>
export default {
  name: "Checkout",
  data() {
    return {
      details: undefined,
      server: "http://127.0.0.1:8000/uploads/",
    };
  },
  mounted() {
    this.details = JSON.parse(localStorage.getItem("mycart"));
    console.log(this.details);
  },
};
</script>

<style>
</style>