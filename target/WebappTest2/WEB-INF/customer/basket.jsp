<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags START -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Required meta tags END -->

    <!-- Bootstrap CSS START -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- Required meta tags END -->

    <title>Home</title>
</head>
<body>


<!-- Billed og hovedmenu START -->
<div class="row" style="background-color: rgba(29,29,29,0.91);">
    <div class =col-md-1>
        <p></p>
    </div>
    <div class =col-md-6>
        <h1><a class="one" href="FrontController?target=redirect&destination=customerpage">TobyCars</a></h1>
    </div>
    <div class =col-md-5>
        <p></p>
        <div class="btn-group" role="group" aria-label="Main menu" style="top:6px;">
            <a class="two" href="FrontController?target=redirect&destination=customerpage">
                <button type="submit" class="btn btn-secondary">Home</button></a>
        </div>

        <div class="btn-group" role="group" aria-label="FAQ" style="top:6px;">
            <a class="two" target="_blank" href="FrontController?target=redirect&destination=FAQ">
                <button type="submit" style="left:20px" class="btn btn-secondary">FAQ</button></a>
        </div>

        <div class="btn-group" role="group" aria-label="FAQ" style="top:6px;">
            <form action="FrontController" method="post">
                <input type="hidden" name="target" value="getallcars">
                <button type="submit" class="btn btn-secondary">Cars</button>
            </form>
        </div>

        <c:forEach var="adminrole" items="${sessionScope.adminrole}">
            <div class="btn-group" role="group" aria-label="adminpage" style="top:6px; left:20px">
                <a class="two" href="FrontController?target=redirect&destination=adminpage">
                    <button type="submit" class="btn btn-secondary">Admin Page</button></a>
            </div>
        </c:forEach>

        <div class="btn-group" role="group" aria-label="First group" style="top:6px; left:20px">
            <form action="FrontController" method="post">
                <input type="hidden" name="target" value="getbasket">
                <input type="hidden" name="userid" value="${sessionScope.user.id}">
                <button type="submit" class="btn btn-secondary">Basket</button>
            </form>
        </div>

        <div class="btn-group" role="group" aria-label="login" style="top:6px; left:20px">
            <button id="myBtn" class="btn btn-secondary">Logout</button>

            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <h4 class="form-text" style="text-align: center">Would you like to save your current order?</h4>
                    <form action="FrontController" method="post">
                        <input type="hidden" name="target" value="logoutuser">
                        <input type="hidden" name="userid" value="${sessionScope.user.id}">
                        <br>
                        <br>
                        <div style="text-align: center">
                            <button style="margin:5px;" name="logoutans" value="Yes" type="submit" class="btn btn-secondary">Yes</button>
                            <button style="margin:5px;" name="logoutans" value="No" type="submit" class="btn btn-secondary">No</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- Billed og hovedmenu END -->

<!-- Title START -->
<div class="row">
    <div class="col-md-12" style="top:-21px;">
        <h1 class="hovedtitle">Bucket</h1>
    </div>
</div>
<!-- Title END -->

<!-- Information START -->
<div class="row" style="top:-25px">
    <div class="col-md-2">

    </div>
    <div class="col-md-8">
        <table class="comonfield1" colspan="3%" align="center" width="1000">
            <tr style="font-weight:bold">
                <td><c:out value="Brand"/></td>
                <td><c:out value="Model"/></td>
                <td><c:out value="Category"/></td>
                <td><c:out value="Build Year"/></td>
                <td><c:out value="Price"/></td>
                <td><c:out value="Remove Item"/></td>
            </tr>
        <c:forEach var="bucket" items="${requestScope.allpreorders}">
            <form action="FrontController" method="post">
                <input type="hidden" name="target" value="removecarid">
                <input type="hidden" name="preordercarid" value="${requestScope.preorder.carID}">
                <input type="hidden" name="preorderuserid" value="${requestScope.preorder.userID}">
                <input type="hidden" name="carid" value="${bucket.id}">
                <div style="text-align: justify">
                    <tr style="background-color: #999999; border:1px solid black">
                        <td><c:out value="${bucket.brand}"/></td>
                        <td><c:out value="${bucket.model}"/></td>
                        <td><c:out value="${bucket.category}"/></td>
                        <td><c:out value="${bucket.buildyear}"/></td>
                        <td><c:out value="${bucket.price}$"/></td>
                        <td><button type="submit" class="btn btn-secondary btn-sm">Remove Item</button></td>
                    </tr>
                </div>
            </form>
            <br>
        </c:forEach>
        </table>

        <form action="FrontController" method="post">
            <input type="hidden" name="target" value="payorder">
            <input type="hidden" name="orderprice" value="${requestScope.orderprice}">
            <input type="hidden" name="order" value="${requestScope.preorder}">
            <br>
            <h4 style="text-align: right">Price: ${requestScope.orderprice}$ - <button type="submit" class="btn btn-secondary">Purchase Order</button></h4>
            <br>
        </form>
    </div>
    <div class="col-md-2">

    </div>
</div>
<!-- Information END -->

<div class ="row" style="background-color: rgba(29,29,29,0.91);">
    <div class="col-md-6" style="left:15px">
        <h3 class="form-text">Contact Support</h3>
        <form action="FrontController" method="post">
            <input type="hidden" name="target" value="contactmessage">
            <input type="hidden" name="name" id="name" value="${sessionScope.username}">
            <input type="hidden" name="email" id="email" value="${sessionScope.email}">
            <div class="form-group">
                <label class="form-text" for="InputTopic">Topic</label>
                <input type="text" name="topic" class="form-control" id="InputTopic" placeholder="Topic">
            </div>
            <div class="form-group">
                <label class="form-text" for="exampleTextarea">Enter message</label>
                <textarea class="form-control" name="message" id="exampleTextarea" rows="3"></textarea>
            </div>
            <div class="form-group">
                <label class="form-text"for="exampleInputFile">File input</label>
                <input type="file" class="form-text" id="exampleInputFile" aria-describedby="fileHelp">
            </div>
            <button type="submit" class="btn btn-secondary">Submit</button>
        </form>
    </div>
    <div class="col-md-6">

    </div>
</div>

<footer class="page-footer font-small blue" style="background-color: rgba(29,29,29,0.91);">

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3"><text style="color: #ececec">© 2020 Copyright:</text>
        <a class="one" href="cars.html">Tobias og Co |</a>
        <a class="one" href="locations.html"> EliteinsaneCars |</a>
        <a class="one" href="offers.html"> Even more elite cars </a>
    </div>
    <!-- Copyright -->

</footer>

<script type="text/javascript" src='<c:url value="/scripts/logout.js"/>'></script>
<!-- jQuery first, then Tether, then Bootstrap JS. -->
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</body>
</html>