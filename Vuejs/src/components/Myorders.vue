
<template>
  <div class="container">
    <div class="table-wrapper">
      <div class="row">
        <div class="col-sm-4">

          <!-- my orders -->
          <h2>Order <b>Details</b></h2>
        </div>
        <div class="col-sm-8"></div>
      </div>
    </div>

    <table class="table table-striped table-hover">
      <thead class="">
        <tr>
          <th>Product image</th>
          <th>Email</th>
          <th>Product name</th>
          <th>Status</th>
          <th>Product quantity</th>
          <th>Product price</th>
          <th>Applied coupan</th>
          <th>Amount</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="order in details" :key="order.id">
          <td>
            <img
              :src="server + order.product_image"
              height="80px"
              width="100px"
              alt="Avatar"
            />
          </td>
          <td>{{ order.email }}</td>
          <td>{{ order.product_name }}</td>
          <td>
            <span class="status text-success">&bull;</span> {{ order.status }}
          </td>
          <td>{{ order.product_quantity }}</td>
          <td>{{ order.product_price }}</td>
          <td>{{ order.coupon_code }}</td>
          <td>{{ order.amount }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { myOrder } from "@/common/Service.js";
export default {
  name: "Myorders",
  data() {
    return {
      server: "http://127.0.0.1:8000/uploads/",
      details: "",
      email: localStorage.getItem("uid"),
    };
  },
  mounted() {
    myOrder(this.email).then((res) => {
      this.details = res.data.orders;
      console.log(this.details);
    });
  },
};
</script>

<style>
.table-wrapper {
  background: #fff;
  padding: 20px 25px;
  margin: 30px auto;
  border-radius: 3px;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
}
.table-wrapper .btn {
  float: right;
  color: #333;
  background-color: #fff;
  border-radius: 3px;
  border: none;
  outline: none !important;
  margin-left: 10px;
}
.table-wrapper .btn:hover {
  color: #333;
  background: #f2f2f2;
}
.table-wrapper .btn.btn-primary {
  color: #fff;
  background: #03a9f4;
}
.table-wrapper .btn.btn-primary:hover {
  background: #03a3e7;
}
.table-title .btn {
  font-size: 13px;
  border: none;
}
.table-title .btn i {
  float: left;
  font-size: 21px;
  margin-right: 5px;
}
.table-title .btn span {
  float: left;
  margin-top: 2px;
}
.table-title {
  color: #fff;
  background: #4b5366;
  padding: 16px 25px;
  margin: -20px -25px 10px;
  border-radius: 3px 3px 0 0;
}
.table-title h2 {
  margin: 5px 0 0;
  font-size: 24px;
}
table.table tr th,
table.table tr td {
  border-color: #e9e9e9;
  padding: 12px 15px;
  vertical-align: middle;
}
table.table tr th:first-child {
  width: 60px;
}
table.table tr th:last-child {
  width: 80px;
}
table thead {
  background: orange;
  color: white;
}
table.table-striped tbody tr:nth-of-type(odd) {
  background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
  background: #f5f5f5;
}
table.table th i {
  font-size: 13px;
  margin: 0 5px;
  cursor: pointer;
}
table.table td a {
  font-weight: bold;
  color: #566787;
  display: inline-block;
  text-decoration: none;
}
table.table td a:hover {
  color: #2196f3;
}
table.table td a.view {
  width: 30px;
  height: 30px;
  color: #2196f3;
  border: 2px solid;
  border-radius: 30px;
  text-align: center;
}
table.table td a.view i {
  font-size: 22px;
  margin: 2px 0 0 1px;
}
table.table .avatar {
  border-radius: 50%;
  vertical-align: middle;
  margin-right: 10px;
}
.status {
  font-size: 30px;
  margin: 2px 2px 0 0;
  display: inline-block;
  vertical-align: middle;
  line-height: 10px;
}
.text-success {
  color: #10c469;
}
.text-info {
  color: #62c9e8;
}
.text-warning {
  color: #ffc107;
}
.text-danger {
  color: #ff5b5b;
}
</style>
