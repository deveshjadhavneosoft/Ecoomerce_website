<template>
  <div id="contact-page" class="container">
    <div class="row">
      <div class="col-sm-8">
        <div class="contact-form">
          <h2 class="title text-center">Get In Touch</h2>
          <div class="status alert alert-success" style="display: none"></div>
          <form @submit.prevent="postContact()">
            <div class="form-group">
              <input
                type="text"
                v-model="user.name"
                id="name"
                name="name"
                placeholder="Name"
                class="form-control"
                :class="{
                  'is-invalid': submitted && $v.user.name.$error,
                }"
              />
              <div
                v-if="submitted && $v.user.name.$error"
                class="invalid-feedback"
              >
                <span v-if="!$v.user.name.required"> Name is required</span>
                <span v-if="!$v.user.name.alpha">
                  Name should contain only letters</span
                >
                <span v-if="!$v.user.name.minLength">
                  length should be atleast 2</span
                >
                <span v-if="!$v.user.name.maxLength">
                  length cannot be more than 10
                </span>
              </div>
            </div>

            <div class="form-group">
              <!-- <label for="email">Email</label> -->
              <input
                type="email"
                v-model="user.email"
                id="email"
                name="email"
                placeholder="Enter email"
                class="form-control"
                :class="{ 'is-invalid': submitted && $v.user.email.$error }"
              />
              <div
                v-if="submitted && $v.user.email.$error"
                class="invalid-feedback"
              >
                <span v-if="!$v.user.email.required">Email is required</span>
                <span v-if="!$v.user.email.email">Email is invalid</span>
              </div>
            </div>
            <div class="form-group">
              <!-- <label for="contact"> Contact number</label> -->
              <input
                type="text"
                class="form-control"
                v-model="user.contact"
                placeholder="Your contact number"
                id="contact"
                name="contact"
                :class="{
                  'is-invalid': submitted && $v.user.contact.$error,
                }"
              />
              <div
                v-if="submitted && $v.user.contact.$error"
                class="invalid-feedback"
              >
                <span v-if="!$v.user.contact.required">
                  contact number is required</span
                >
                <span v-if="!$v.user.contact.numeric">
                  contact number should contain only digits</span
                >
                <span v-if="!$v.user.contact.maxLength">
                  contact number cannot be more than 10 digit</span
                >
              </div>
            </div>
            <div class="form-group">
              <!-- <label for="message"> Message</label> -->
              <textarea
                v-model="user.message"
                name="message"
                id="message"
                rows="8"
                class="form-control"
                placeholder="Your Message Here"
                :class="{
                  'is-invalid': submitted && $v.user.message.$error,
                }"
              ></textarea>
              <div
                v-if="submitted && $v.user.message.$error"
                class="invalid-feedback"
              >
                <span v-if="!$v.user.message.required"
                  >message is required</span
                >
                <span v-if="!$v.user.message.minLength"
                  >message length should be atleast 10
                </span>
                <span v-if="!$v.user.message.maxLength"
                  >message length should not be greater than 255
                </span>
              </div>
            </div>
            <div class="form-group">
              <button class="btn btn-primary">Contact Us</button>
            </div>
          </form>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="contact-info">
          <h2 class="title text-center">Contact Info</h2>
          <address>
            <p>E-Shopper Inc.</p>
            <p>935 W. Webster Ave New Streets Chicago, IL 60614, NY</p>
            <p>Newyork USA</p>
            <p>Mobile: +2346 17 38 93</p>
            <p>Fax: 1-714-252-0026</p>
            <p>Email: info@e-shopper.com</p>
          </address>
          <div class="social-networks">
            <h2 class="title text-center">Social Networking</h2>
            <ul>
              <li>
                <a href="#"><i class="fa fa-facebook"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-twitter"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-google-plus"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa fa-youtube"></i></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {
  required,
  email,
  alpha,
  minLength,
  maxLength,
  numeric,
} from "vuelidate/lib/validators";
import { contact } from "@/common/Service";
export default {
  name: "Contact",

  data() {
    return {
      user: {
        name: "",
        contact: "",
        email: "",
        message: "",
      },
      submitted: false,
    };
  },
  validations: {
    user: {
      name: {
        required,
        alpha,
        minLength: minLength(2),
        maxLength: maxLength(10),
      },
      contact: { required, maxLength: maxLength(10), numeric },
      email: { required, email },
      message: {
        required,
        minLength: minLength(10),
        maxLength: maxLength(255),
      },
    },
  },
  methods: {
    postContact() {
      this.submitted = true;

      // stop here if form is invalid
      this.$v.$touch();
      if (this.$v.$invalid) {
        return;
      }
      let formData = {
        name: this.user.name,
        email: this.user.email,
        phone: this.user.contact,
        message: this.user.message,
      };
      contact(formData)
        .then((res) => {
          if (res) {
            alert("donee");
            console.log(res.data);
            window.location.reload();
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style>
span {
  color: red;
}
.form-group input {
  background: #f0f0e9;
  border: medium none;
  color: #696763;
  display: block;
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  font-weight: 300;
  height: 40px;
  margin-bottom: 10px;
  outline: medium none;
  padding-left: 10px;
  width: 100%;
}
.container h2 {
  color: #696763;
  font-family: "Roboto", sans-serif;
  font-size: 20px;
  font-weight: 300;
  margin-bottom: 30px;
}
.contact-form .title {
  color: orange;
  font-weight: bolder;
}
</style>