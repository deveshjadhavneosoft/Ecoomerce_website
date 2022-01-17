<template>
  <section id="form">
    <!--form-->
    <div class="container">
      <div class="row">
        <div class="col-sm-4 col-sm-offset-1">
          <div class="login-form">
            <!--login form-->
            <div class="alert alert-danger" v-if="submitted1 == 'err'">
              <p>Error!</p>
            </div>
            <h2>Login to your account</h2>
            <form @submit.prevent="postLogin()">
              <input
                type="email"
                v-model="login.email"
                id="email1"
                name="email"
                placeholder="Email address"
                class="form-control"
                :class="{ 'is-invalid': submitted1 && $v.login.email.$error }"
              />
              <div
                v-if="submitted1 && $v.login.email.$error"
                class="invalid-feedback"
              >
                <span v-if="!$v.login.email.required">Email is required</span>
                <span v-if="!$v.login.email.email">Email is invalid</span>
              </div>

              <input
                type="password"
                v-model="login.password"
                id="password1"
                name="password"
                placeholder="Password"
                class="form-control"
                :class="{
                  'is-invalid': submitted1 && $v.login.password.$error,
                }"
              />
              <div
                v-if="submitted1 && $v.login.password.$error"
                class="invalid-feedback"
              >
                <span v-if="!$v.login.password.required"
                  >*Password is required</span
                >
                <span v-if="!$v.login.password.minLength"
                  >*Password must be at least 6 characters</span
                >
              </div>
              <button class="btn btn-primary" type="submit">Login</button>
            </form>
          </div>
          <!--/login form-->
        </div>
        <div class="col-sm-1">
          <h2 class="or">OR</h2>
        </div>
        <div class="col-sm-4">
          <div class="signup-form">
            <!--sign up form-->
            <div class="alert alert-success" v-if="submitted == 'done'">
              <p>Success</p>
            </div>
            <div class="alert alert-danger" v-if="submitted == 'err'">
              <p>Error</p>
            </div>
            <h2>New User Signup!</h2>
            <form @submit.prevent="postRegister()">
              <input
                type="text"
                v-model="user.firstName"
                placeholder="First name"
                id="firstName"
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
                <span class="text-danger">*First Name is required</span>
              </div>
              <input
                type="text"
                v-model="user.lastName"
                placeholder="Last name"
                id="lastName"
                name="lastName"
                class="form-control"
                :class="{
                  'is-invalid': submitted && $v.user.lastName.$error,
                }"
              />
              <div
                v-if="submitted && !$v.user.lastName.required"
                class="invalid-feedback"
              >
                <span class="text-danger">*Last Name is required</span>
              </div>
              <input
                type="email"
                v-model="user.email"
                placeholder="Email address"
                id="email"
                name="email"
                class="form-control"
                :class="{ 'is-invalid': submitted && $v.user.email.$error }"
              />
              <div
                v-if="submitted && $v.user.email.$error"
                class="invalid-feedback"
              >
                <span v-if="!$v.user.email.required" class="text-danger"
                  >*Email is required</span
                >
                <span v-if="!$v.user.email.email" class="text-danger"
                  >*Email is invalid</span
                >
              </div>
              <input
                type="password"
                v-model="user.password"
                id="password"
                placeholder="Password"
                name="password"
                class="form-control"
                :class="{
                  'is-invalid': submitted && $v.user.password.$error,
                }"
              />
              <div
                v-if="submitted && $v.user.password.$error"
                class="invalid-feedback"
              >
                <span v-if="!$v.user.password.required" class="text-danger"
                  >*Password is required</span
                >
                <span v-if="!$v.user.password.minLength"
                  >Password must be at least 6 characters</span
                >
              </div>
              <input
                type="password"
                v-model="user.confirmPassword"
                id="confirmPassword"
                placeholder="Confirm Password"
                name="confirmPassword"
                class="form-control"
                :class="{
                  'is-invalid': submitted && $v.user.confirmPassword.$error,
                }"
              />
              <div
                v-if="submitted && $v.user.confirmPassword.$error"
                class="invalid-feedback"
              >
                <span
                  v-if="!$v.user.confirmPassword.required"
                  class="text-danger"
                  >*Confirm Password is required</span
                >
                <span
                  v-else-if="!$v.user.confirmPassword.sameAsPassword"
                  class="text-danger"
                  >*Passwords must match</span
                >
              </div>
              <button type="submit" class="btn btn-default">Signup</button>
            </form>
          </div>
          <!--/sign up form-->
        </div>
      </div>
    </div>
  </section>
  <!--/form-->
</template>

<script>
import { required, email, minLength, sameAs } from "vuelidate/lib/validators";
import { userLogin } from "@/common/Service";
import { userRegister } from "@/common/Service";
import { saveToken } from "@/common/Jwttoken";
import store from "../store/store";
import { mapState } from "vuex";
import * as type from "../store/type";
export default {
  name: "login",

  data() {
    return {
      user: {
        firstName: null,
        lastName: null,
        email: null,
        password: null,
        confirmPassword: null,
      },
      login: {
        email: null,
        password: null,
      },
      submitted1: false,
      submitted: false,
    };
  },
  validations: {
    user: {
      firstName: { required },
      lastName: { required },
      email: { required, email },
      password: { required, minLength: minLength(6) },
      confirmPassword: { required, sameAsPassword: sameAs("password") },
    },
    login: {
      email: { required, email },
      password: { required, minLength: minLength(6) },
    },
  },
  computed: mapState({
    msg: (state) => state.islogin,
    userid: (state) => state.emailId,
  }),
  methods: {
    postRegister() {
      this.submitted = true;

      // stop here if form is invalid
      this.$v.user.$touch();
      if (this.$v.user.$invalid) {
        return;
      }
      let formData = {
        first_name: this.user.firstName,
        last_name: this.user.lastName,
        email: this.user.email,
        password: this.user.password,
      };
      userRegister(formData)
        .then((res) => {
          if (res.data.email == "The email has already been taken.") {
            this.submitted = "err";
          } else {
            this.submitted = "done";
            // this.$router.push("/login");
          }
        })
        .catch((err) => {
          console.log("Something Wrong " + err);
          this.submitted = "err";
        });
    },
    postLogin() {
      this.submitted1 = true;
      this.$v.login.$touch();
      if (this.$v.login.$invalid) {
        return;
      }
      let formData = { email: this.login.email, password: this.login.password };
      userLogin(formData)
        .then((res) => {
          if (res) {
            saveToken(res.data.access_token);
            localStorage.setItem("uid", res.data.email);
            this.submitted1 = "done";
            console.log(res.data);
            store.dispatch({
              type: type.Islogin,
              id: res.data.access_token,
              userId: res.data.email,
            });

            this.$router.push("/");
          }
        })
        .catch((err) => {
          console.log("SOmething Wrong " + err);
          this.submitted1 = "err";
        });
    },
  },
};
</script>
<style>
.row {
  display: flex;
  justify-content: center;
}
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
</style>
