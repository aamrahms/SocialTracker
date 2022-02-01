<%
session.invalidate();
Cookie cookie = new Cookie("user", null);
cookie.setMaxAge(0);
cookie.setValue(null);
cookie.setPath("/");
response.addCookie(cookie);
response.sendRedirect("try.jsp");

%>