package socket;

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
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;

    
public class send {
    
    //public double sendToServer(String unm, String lat, String lg);
      public static void main(String[] args)
     {
         String unm="an";
          String lat="an";
           String lg="an";
           send sn=new send();
         sn.sendToServer(unm,lat,lg);
    }
    private Socket socket;
    private String data;
    
    public double sendToServer(String unm, String lat, String lg)
    {
    try
		{
			String host = "localhost";
			int port = 2500;
			InetAddress address = InetAddress.getByName(host);
			socket = new Socket(address, port);
			OutputStream os = socket.getOutputStream();
			OutputStreamWriter osw = new OutputStreamWriter(os);
			BufferedWriter bw = new BufferedWriter(osw);
                       // lat ="abc";
                       // lg ="abc";
			String sendMessage = "\n username="+ unm + "\n latitude="+lat + "\n longi="+ lg +"\n";
			bw.write(sendMessage);
			bw.flush();
                        System.out.println("this is client");
			
			System.out.println("Message sent to the server : "+sendMessage);
			InputStream is = socket.getInputStream();
                        
			InputStreamReader isr = new InputStreamReader(is);
			System.out.println("Message sent to the server 2");
			
                        BufferedReader br = new BufferedReader(isr);
			System.out.println("Message sent to the server 3");
			
                        String message = br.readLine();
                        System.out.println("Message sent to the server 4");
			
			System.out.println("Message received from the server : " +message);
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
		finally
		{
			try
			{
				socket.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
    return 0;
    }
    
}
