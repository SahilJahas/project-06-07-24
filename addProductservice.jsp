<%@ page
	import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adding Vegetable</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
	double price = Double.parseDouble(request.getParameter("price"));
	int availability = Integer.parseInt(request.getParameter("availability"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	String specification = request.getParameter("specification");
	out.print(name+" "+price);
	   Connection conn = null;
       String url = "jdbc:mysql://192.168.18.245:3306/javadb_168"; // Replace with your MySQL database URL
       String username = "javadb_168"; // Replace with your MySQL username
       String password = "Sp3cJa5A2k24"; // Replace with your MySQL password
       
	
  try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // Inserting data into database
            String sql = "INSERT INTO products (name, price, availability, quantity, specification) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setDouble(2, price);
            statement.setInt(3, availability);
            statement.setInt(4, quantity);
            statement.setString(5, specification);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h3>Vegetable added successfully.</h3>");
            } else {
                out.println("<h3>Failed to add vegetable.</h3>");
            }
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (conn!= null) {
                    conn.close();
                }
            } catch (SQLException e) {
                out.println("<h3>Error closing the database connection: " + e.getMessage() + "</h3>");
            }
        }
    %>
</body>
</html>