
<template>
  <section id="cart_items">
    <div class="container">
      <div class="shopper-informations">
        <div class="row">
          <div class="col-sm-5">
            <div class="shopper-info">
              <p>Personal info</p>
              <div v-if="this.msg">
                <div class="alert alert-success">{{ this.msg }}</div>
              </div>
              <!-- form for account -->
              <form @submit.prevent="update()">
                 <label>Email</label>
                <input
                  type="text"
                  placeholder="Email"
                  v-model="user.email"
                  readonly
                  name="last_name"
                />
                 <label>First Name</label>
                <input
                  type="text"
                  placeholder="Firstname"
                  v-model="user.first_name"
                  name="first_name"
                  required
                />
                 <label>Last Name</label>
                <input
                  type="text"
                  placeholder="Lastname"
                  v-model="user.last_name"
                  name="last_name"
                  required
                />
                <button class="btn btn-primary" type="submit">Submit</button>
              </form>
            </div>
          </div>
          <div class="col-sm-5 clearfix">
            <div class="bill-to">
              <p>Change Password</p>
              <div class="form-one">
                <form @submit.prevent="change()">
                  <label>Old Password</label>
                  <input
                    type="text"
                    placeholder="Old password"
                    v-model="user1.oldpassword"
                    name="oldpassword"
                  />
                  <label>New Password</label>
                  <input
                    type="text"
                    placeholder="New password"
                    v-model="user1.newpassword"
                    name="newpassword"
                  />
                  <label>Confirm Password</label>
                  <input
                    type="text"
                    placeholder="Confirm password"
                    name="confirmpassword"
                    v-model="user1.confirmpassword"
                  />
                  <button class="btn btn-primary" type="submit">
                    Change password
                  </button>
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
import { userDetails } from "@/common/Service.js";
import { updateUser } from "@/common/Service.js";
import { changePassword } from "@/common/Service.js";
export default {
  name: "Account",
  data() {
    return {
      userid: localStorage.getItem("uid"),
      user: {},
      user1: {
        oldpassword: "",
        newpassword: "",
        confirmpassword: "",
      },
      msg: null,
      submitted: false,
    };
  },

  // get deatails
  methods: {
    getDetails() {
      userDetails(this.userid).then((res) => {
        this.user = res.data.details;
        console.log(this.user);
      });
    },
    //update details
    update() {
      this.submitted = true;
      updateUser(this.userid, this.user)
        .then((res) => {
          console.log(res.data);
          this.msg = res.data.user;
        })
        .catch((err) => {
          console.log(err);
          this.msg = "not updated";
        });
    },
    //change password
    change() {
      let formData = {
        newpassword: this.user1.newpassword,
        oldpassword: this.user1.oldpassword,
        confirmpassword: this.user1.confirmpassword,
      };
      changePassword(this.userid, formData)
        .then((res) => {
          console.log(res.data);
          this.$swal("Password updated successfully", "", "success");
          this.user1=""
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
  created() {
    this.getDetails();
  },
};
</script>

<style>
.clearfix {
  margin-bottom: 50px;
  padding-left: 80px;
}
.row {
  display: flex;
  justify-content: center;
}
</style>
