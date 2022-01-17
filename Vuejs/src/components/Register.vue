<template>
  <div class="" id="app">
    <div class="container">
      <div class="row">
        <div class="col-sm-4 offset-sm-2">
          <div>
            <h2>Registration</h2>
            <form @submit.prevent="postRegister()">
              <div class="form-group">
                <label for="firstName">First Name</label>
                <input
                  type="text"
                  v-model="user.firstName"
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
              </div>
              <div class="form-group">
                <label for="lastName">Last Name</label>
                <input
                  type="text"
                  v-model="user.lastName"
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
              </div>
              <div class="form-group">
                <label for="email">Email</label>
                <input
                  type="email"
                  v-model="user.email"
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
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input
                  type="password"
                  v-model="user.password"
                  id="password"
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
              </div>
              <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input
                  type="password"
                  v-model="user.confirmPassword"
                  id="confirmPassword"
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
              </div>
              <div class="form-group">
                <button class="btn btn-primary" type="submit">Register</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { required, email, minLength, sameAs } from "vuelidate/lib/validators";
import { userRegister } from "@/common/Service";

export default {
  name: "Register",

  data() {
    return {
      user: {
        firstName: "",
        lastName: "",
        email: "",
        password: "",
        confirmPassword: "",
      },
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
  },
  methods: {
    postRegister() {
      this.submitted = true;
      // console.log("hii");
      // stop here if form is invalid
      this.$v.$touch();
      if (this.$v.$invalid) {
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
            alert(res.data.email);
          } else {
            alert("successfully done");
          }
        })
        .catch((err) => {
          console.log("SOmething Wrong " + err);
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
</style>
