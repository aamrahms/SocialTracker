package socket;
import java.net.*;
import java.io.*;

public class YourServer
{    
    public static void main(String[] args ) 
    {
        try {    
        	DatagramSocket ds = new DatagramSocket(3000);  
            String str = "Welcome java";  
            InetAddress ip = InetAddress.getByName("192.168.43.20");  
             
            DatagramPacket dp = new DatagramPacket(str.getBytes(), str.length(), ip, 3000);  
            ds.send(dp);  
            ServerSocket socket = new ServerSocket(8765);

            Socket insocket = socket.accept( );

            BufferedReader in = new BufferedReader (new 
                InputStreamReader(insocket.getInputStream()));
            PrintWriter out = new PrintWriter (insocket.getOutputStream(), 
                true);

            String instring = in.readLine();
            out.println("The server got this: " + instring);
            insocket.close();
        }
        catch (Exception e) {} 
     } 
}