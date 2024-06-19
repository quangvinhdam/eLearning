<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main nav_active="login">
    <jsp:attribute name="head">
        <style>
            input[type=text], input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            /* Add a background color when the inputs get focus */
            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <div class="container-xxl d-block">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
                    <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                        <div class="card-body p-5 text-center">
                            <h1>Log in</h1>
                            <p>Please fill in this form to log in</p>
                            
                            <form action="${pageContext.request.contextPath}/login" method="post">
                                <input type="text" placeholder="Enter Email" name="email" required>
                                <input type="password" placeholder="Enter Password" name="password" required>
                                <div style="display: flex;justify-content: space-between;align-items: center;margin: 5px 0 22px 0;">
                                    <label><input type="checkbox" name="remember_me" value="true" style="margin-bottom:15px"> Remember me</label>
                                    <a href="${pageContext.request.contextPath}/login?action=forgot_pw" class="btn btn-link">Forgot password</a>
                                </div>
                                <button type="submit" name="action" value="login" class="btn btn-primary mb-3">Log in</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
