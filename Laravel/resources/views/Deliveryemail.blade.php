<!DOCTYPE html>
<html>

<head>
    @include('admin.includes.head')
</head>

<body>
    <div class="container text-center">

        <h2>Shopper</h2>
        <h3> your order is {{ $status }}.</h3>
        <h4>Order Details</h4>
        <table border="1">
            <tbody>
                <tr>
                    <th>Email</th>
                    <th>Product name</th>
                    <th>Product price</th>
                    <th>Quantity</th>
                    <th>Amount</th>
                    <th>Total Amount</th>
                </tr>
                <tr>
                    <td>{{$email}}</td>
                    <td>{{$product_name}}</td>
                    <td>{{$price}}</td>
                    <td>{{$quantity}}</td>
                    <td>{{$amount}}</td>
                    <td>{{$paidAmount}}</td>
                </tr>
            </tbody>
        </table>
        <p>Thankyou once again!</p>
    </div>
    @include('admin.includes.foot')
</body>

</html>