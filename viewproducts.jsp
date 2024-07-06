<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Users Record</h2>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Availability</th>
                        <th>Quantity</th>
                        <th>Specification</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadb_168", "javadb_168", "Sp3cJa5A2k24");
                        stmt = conn.createStatement();
                        String sql = "SELECT id, name, price, availability, quantity, specification FROM products";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            double price = rs.getDouble("price");
                            int availability = rs.getInt("availability");
                            int quantity = rs.getInt("quantity");
                            String specification = rs.getString("specification");
                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=name%></td>
                        <td><%=price%></td>
                        <td><%=availability%></td>
                        <td><%=quantity%></td>
                        <td><%=specification%></td>
                        <td>
                            <a href="editProduct.jsp?id=<%=id%>" class="btn btn-primary btn-sm">Edit</a>
                            <a href="deleteProduct.jsp?id=<%=id%>" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null)
                            try {
                                rs.close();
                            } catch (SQLException ignore) {
                            }
                        if (stmt != null)
                            try {
                                stmt.close();
                            } catch (SQLException ignore) {
                            }
                        if (conn != null)
                            try {
                                conn.close();
                            } catch (SQLException ignore) {
                            }
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
