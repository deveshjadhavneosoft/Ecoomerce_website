<template>
  <div>
    <section id="cart_items">
      <div class="container">
        <div class="breadcrumbs">
          <ol class="breadcrumb">
            <li>
              <router-link to="/">Home</router-link>
            </li>
            <li class="active">Shopping Cart</li>
          </ol>
        </div>
        <div class="table-responsive cart_info">
          <!-- table for cart items -->
          <table class="table table-condensed">
            <thead>
              <tr class="cart_menu">
                <td class="image">Item</td>
                <td class="description"></td>
                <td class="price">Price</td>
                <td class="quantity">Quantity</td>
                <td></td>
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
                <td></td>
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
                    <a class="cart_quantity_down" @click="addQty(cart)">
                      <i
                        class="fa fa-plus btn btn-warning"
                        aria-hidden="true"
                      ></i>
                    </a>
                    <input
                      class="cart_quantity_input"
                      type="text"
                      name="quantity"
                      v-model="cart.quantity"
                      autocomplete="off"
                      size="2"
                    />
                    <a class="cart_quantity_down" @click="subQty(cart)">
                      <i
                        class="fa fa-minus btn btn-warning"
                        aria-hidden="true"
                      ></i>
                    </a>
                  </div>
                </td>
                <td class="cart_total">
                  <p class="cart_total_price">
                    {{ cart.price * cart.quantity }}<i class="fa fa-inr" aria-hidden="true"></i>
                  </p>
                </td>
                <td class="cart_delete">
                  <button class="cart_quantity_delete btn btn-danger" @click="delItem(cart)">
                    <i class="fa fa-times"></i>
                  </button>
                </td>
              </tr>
              <tr>
                <td colspan="4">&nbsp;</td>
                <td colspan="2">
                  <table class="table table-condensed total-result">
                    <tr>
                      <td>
                        <input class="form-control" type="text" v-model="value" />
                        <button class="btn btn-warning" type="submit" @click="applyCoupon()">
                          Apply coupon
                        </button>
                      </td>
                    </tr>
                    <tr>
                      <td>Discount</td>
                      <td>{{ this.discount }}<i class="fa fa-inr" aria-hidden="true"></i></td>
                    </tr>
                    <tr class="shipping-cost">
                      <td>Shipping Cost</td>
                      <td>{{ this.shipping }}</td>
                    </tr>
                    <tr>
                      <td>Total</td>
                      <td>
                        <span>{{ this.full() }}<i class="fa fa-inr" aria-hidden="true"></i></span>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="p1">
          <button class="btn btn-warning" @click="payment()">Proceed to checkout</button>
        </div>
      </div>
    </section>
    <!--/#cart_items-->
  </div>
  <!--/#do_action-->
</template>

<script>
import { coupon } from "@/common/Service.js";
export default {
  name: "Cart",
  data() {
    return {
      details: undefined,
      value: undefined,
      coupons: undefined,
      coup: undefined,
      shipping: undefined,
      amount: 0,
      discount: 0,
      total: null,
      server: "http://127.0.0.1:8000/uploads/",
    };
  },
  methods: {
    //add items
    addQty(cart) {
      let item = this.details.indexOf(cart);
      this.details[item].quantity = this.details[item].quantity + 1;
      let arr = JSON.stringify(this.details);
      localStorage.setItem("mycart", arr);
    },
    //subtract items
    subQty(cart) {
      let item = this.details.indexOf(cart);
      this.details[item].quantity = this.details[item].quantity - 1;
      let arr = JSON.stringify(this.details);
      localStorage.setItem("mycart", arr);
    },
    //delitems
    delItem(cart) {
      let item = this.details.indexOf(cart);
      this.details.splice(item, 1);
      let arr = JSON.stringify(this.details);
      localStorage.setItem("mycart", arr);
      this.$store.dispatch("remItem", arr);
    },
    full() {
      const items = JSON.parse(localStorage.getItem("mycart"));
      var sum = 0;
      items.forEach((item) => {
        sum = sum + item.price * item.quantity;
      });
      this.total = sum - this.discount;
       this.total = sum - this.discount;
      if (this.total > 500) {
        this.shipping = "free";
        return this.total;
      } else {
        this.shipping = 50;
        this.total = this.total + this.shipping;
        return this.total;
      }
    },
    //coupon
    applyCoupon() {
      let arr = this.coupons;
      let couponArray;
      let flag = 0;
      for (let i in arr) {
        if (arr[i].code == this.value) {
          flag = 1;
          couponArray = arr[i];
          break;
        }
      }
      if (flag != 0 && parseInt(couponArray.cart_value) <= this.total) {
        if (couponArray.type == "percent") {
          this.discount = this.total * (couponArray.value / 100);
          this.total = this.total - this.discount;
          this.coup = this.value;
        } else {
          this.discount = couponArray.value;
          this.total = this.total - this.discount;
          this.coup = this.value;
        }
      } else {
        this.$swal("Unable to apply the coupon", "", "error");
      }
    },
    payment() {
      this.$store.dispatch("amount", this.total);
      this.$store.dispatch("coupon", this.coup);
      this.$router.push("/checkout");
    },
  },
  mounted: function mounted() {
    this.details = JSON.parse(localStorage.getItem("mycart"));
    console.log(this.details);
    coupon().then((res) => {
      this.coupons = res.data.coupons;
    });
  },
};
</script>
<style>
.p1 {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 50px;
}
</style>