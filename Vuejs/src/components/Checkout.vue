<template>
  <section id="cart_items">
    <div class="container">
      <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="#">Home</a></li>
          <li class="active">Check out</li>
        </ol>
      </div>

      <div class="review-payment">
        <h2>Review & Payment</h2>
      </div>
      <!-- checkout -->
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
                  {{ cart.price * cart.quantity
                  }}<i class="fa fa-inr" aria-hidden="true"></i>
                </p>
              </td>
            </tr>
            <tr>
              <td colspan="4">&nbsp;</td>
              <td colspan="2">
                <table class="table table-condensed total-result">
                  <tr>
                    <td>Total payment</td>
                    <td>
                      <span
                        >{{ this.$store.getters.amount
                        }}<i class="fa fa-inr" aria-hidden="true"></i
                      ></span>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="shopper-informations">
        <div class="row">
          <div class="col-sm-8 clearfix">
            <div class="bill-to">
              <p>Bill To</p>
              <div class="form-one">
                <!-- form for user address -->
                <form @submit.prevent="payment()">
                  <input
                    type="email"
                    v-model="user.email"
                    id="email"
                    placeholder="Enter email"
                    name="email"
                    class="form-control"
                    :class="{ 'is-invalid': submitted && $v.user.email.$error }"
                  />
                  <div
                    v-if="submitted && $v.user.email.$error"
                    class="invalid-feedback"
                  >
                    <span v-if="!$v.user.email.required"
                      >*Email is required</span
                    >
                    <span v-if="!$v.user.email.email">*Email is invalid</span>
                  </div>
                  <input
                    type="text"
                    v-model="user.firstName"
                    id="firstName"
                    placeholder="Enter firstname"
                    name="firstName"
                    class="form-control"
                    :class="{
                      'is-invalid': submitted && $v.user.firstName.$error,
                    }"
                  />
                  <div
                    v-if="submitted && !$v.user.firstName.required"
                    class="invalid-feedback"
                  >
                    <span class="">*Firstname is required </span>
                  </div>

                  <input
                    type="text"
                    v-model="user.lastName"
                    id="lastName"
                    placeholder="Enter lastname"
                    name="lastName"
                    class="form-control"
                    :class="{
                      'is-invalid': submitted && $v.user.lastName.$error,
                    }"
                  />
                  <div
                    v-if="submitted && !$v.user.firstName.required"
                    class="invalid-feedback"
                  >
                    <span class="">*lastname is required </span>
                  </div>
                  <input
                    v-model="user.address"
                    name="address"
                    id=""
                    placeholder="enter address"
                    rows="4"
                    class="form-control"
                    :class="{
                      'is-invalid': submitted && $v.user.address.$error,
                    }"
                  />
                  <div
                    v-if="submitted && !$v.user.address.required"
                    class="invalid-feedback"
                  >
                    <span class="">*Address is required </span>
                  </div>

                  <input
                    type="text"
                    v-model="user.postalcode"
                    id="address"
                    placeholder="Zip / Postal Code *"
                    name="postalcode"
                    class="form-control"
                    :class="{
                      'is-invalid': submitted && $v.user.postalcode.$error,
                    }"
                  />
                  <div
                    v-if="submitted && !$v.user.postalcode.required"
                    class="invalid-feedback"
                  >
                    <span class="">*postalcode is required </span>
                  </div>

                  <input
                    type="number"
                    v-model="user.phone"
                    id="phone"
                    placeholder="Phone no is required *"
                    name="phone"
                    class="form-control"
                    :class="{ 'is-invalid': submitted && $v.user.phone.$error }"
                  />
                  <div
                    v-if="submitted && !$v.user.phone.required"
                    class="invalid-feedback"
                  >
                    <span class="">*Mobile number is required </span>
                  </div>
                  <br />
                  <div class="payment-options">
                    <span>
                      <label
                        ><input type="radio" v-model="pay" value="COD" /> Cash
                        on delivery</label
                      >
                    </span>
                    <span>
                      <label
                        ><input type="radio" v-model="pay" value="online" />
                        Paypal</label
                      >
                    </span>
                    <div v-show="pay == 'online'">
                      <Paypal />
                    </div>
                    <br />
                    <button class="btn btn-primary">Submit</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { required, email } from "vuelidate/lib/validators";
import { userOrder } from "@/common/Service.js";
import { userAddress } from "@/common/Service.js";
import Paypal from "../components/Paypal.vue";
export default {
  name: "Checkout",
  components: { Paypal },
  data() {
    return {
      details: undefined,
      code: null,
      email_id: localStorage.getItem("uid"),
      server: "http://127.0.0.1:8000/uploads/",
      pay: "COD",
      pp: false,
      user: {
        firstName: "",
        lastName: "",
        email: "",
        address: "",
        postalcode: "",
        phone: "",
      },
      submitted: false,
    };
  },
  //validations
  validations: {
    user: {
      firstName: { required },
      lastName: { required },
      email: { required, email },
      address: { required },
      postalcode: { required },
      phone: { required },
    },
  },
  methods: {
    //payments
    payment() {
      this.submitted = true;
      this.$v.$touch();
      if (this.$v.$invalid) {
        return;
      } else {
        let array = this.details;
        array.forEach((item) => {
          let obj = {
            email: this.email_id,
            product_name: item.name,
            product_image: item.image_path,
            product_quantity: item.quantity,
            product_price: item.price,
            amount: item.price * item.quantity,
            coupon_code: this.$store.getters.coupon,
            payment_mode: this.pay,
          };
          userOrder(obj).then((res) => {
            console.log(res.data);
            this.$swal("Order Placed", "", "success");
          });
        });
        let formData = {
          user_email: this.user.email,
          name: this.user.firstName,
          address: this.user.address,
          postal: this.user.postalcode,
          phone: this.user.phone,
        };
        userAddress(formData).then((res) => {
          localStorage.removeItem("mycart");
          this.$router.push("/myorders");
          console.log(res.data);
          window.location.reload();
        });
      }
    },
  },
  mounted() {
    this.details = JSON.parse(localStorage.getItem("mycart"));
    console.log(this.details);
  },
  computed: {
    total() {
      return this.$store.getters.amount;
    },
    coupon() {
      return this.$store.getters.coupon;
    },
  },
};
</script>

<style>
</style>