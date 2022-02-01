
<%@ page import="java.io.*, java.net.*,socket.*,java.util.*" %>
<HTML>
    <HEAD>
        <TITLE>Creating Client/Server Applications</TITLE>
    </HEAD>
        <BODY>
        <H1>Creating Client/Server Applications</H1>
        <% 
        try{
            int character;
            Socket socket = new Socket("192.168.43.96", 8765);
            InputStream inSocket = socket.getInputStream();
            OutputStream outSocket = socket.getOutputStream();
            String str = "Hello!\n";
           Enumeration e =NetworkInterface.getNetworkInterfaces();
           	while(e.hasMoreElements())
           	{
           		NetworkInterface n = (NetworkInterface)e.nextElement();
           		Enumeration ee = n.getInetAddresses();
           		while (ee.hasMoreElements())
           		{
           			InetAddress i = (InetAddress)ee.nextElement();
           			System.out.println(i.getHostName() + i.getHostAddress()); 
               		
           		}
           			
           	}
           	out.println(InetAddress.getLocalHost().getHostAddress());
           	
            byte buffer[] = str.getBytes();
            outSocket.write(buffer);
            while ((character = inSocket.read()) != -1) {
                out.print((char) character);
            }
        
            socket.close();
        
}
        catch(java.net.ConnectException e){
        %>
            You must first start the server application 
            (YourServer.java) at the command prompt.
        <%
        }
        %>
    </BODY>
</HTML>

