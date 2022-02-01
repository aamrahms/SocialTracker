package socket;

import java.io.IOException;
import java.net.*;
import java.io.DataInputStream;
import java.io.PrintStream;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
public class Singleton {
     private Socket socket;
     private String data;
     int num;
     int r;
    public int createConn()throws IOException
    {
    	
        try
		{
			String host = "192.168.43.2";
			int port = 2500;
			InetAddress address = InetAddress.getByName(host);
			socket = new Socket(address, port);
			num=3;
			sendIp();
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
		
      return num;
    }
    
    public void send(String a) throws IOException
            
    {
    	
    	OutputStream os = socket.getOutputStream();
		OutputStreamWriter osw = new OutputStreamWriter(os);
		BufferedWriter bw = new BufferedWriter(osw);
                   // lat ="abc";
                   // lg ="abc";
		//String sendMessage = "\n username="+ unm + "\n latitude="+lat + "\n longi="+ lg +"\n";
		bw.write(a);
		bw.flush();
		//bw.write("&&");
		//bw.flush();
		//bw.write("hiiiiii");
		//bw.flush();
                    System.out.println("this is client");
		
		System.out.println("Message sent to the server : "+a);
		receive();
    }
    
     
    public void receive() throws IOException
            
    {
    	InputStream is = socket.getInputStream();
        InputStreamReader isr = new InputStreamReader(is);
		System.out.println("Message sent to the server 2");
		BufferedReader br = new BufferedReader(isr);
		System.out.println("Message sent to the server 3");
		
        String message = br.readLine();
        System.out.println(message);
		
    }
    
     
    public int closeConn() throws IOException
            
    {
    	
    	try
		{
			socket.close();
			r=4;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    	return r;
    }
    


	void sendIp() throws Exception
	{
		DatagramSocket ds = new DatagramSocket(3000);    
	    InetAddress ip = InetAddress.getByName("192.168.43.96");  
	     
	    DatagramPacket dp = new DatagramPacket(null, num);  
	    ds.send(dp);  
	    ds.close(); 
	}	
}