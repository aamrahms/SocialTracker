package socket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.net.ServerSocket;
import java.net.Socket;
import java.lang.*;
import java.net.*;
public class chatserver2
{

	private static Socket socket;
    private static String returnMessage;
    private static String data;
    private static String NULL;
    private static Writer osw;

	public void server() throws Exception
	{
		try
		{
			String responseLine;
			int port = 2500;
			ServerSocket serverSocket = new ServerSocket(port);
			System.out.println("Server Started and listening to the port 25000");
                        /*  while(true)
			{       String responseLine;
				socket = serverSocket.accept();
				InputStream is = socket.getInputStream();
				OutputStream os=socket.getOutputStream();
                                OutputStreamWriter osw = new OutputStreamWriter(os);
				BufferedWriter bw = new BufferedWriter(osw);

                               
                                InputStreamReader isr = new InputStreamReader(is);
                                
				BufferedReader br = new BufferedReader(isr);
					//int returnValue = numberInIntFormat*2;
					returnMessage = "..........................\n";
				bw.write(returnMessage);
				System.out.println("Message sent to the client is "+returnMessage);
                                  bw.flush();
                                while ((responseLine = br.readLine()) != null) 
                                {
                                  System.out.println(responseLine);
                                  
                                  if(responseLine==NULL)
                                  System.out.println("run sucessful...1 ");
                                } 
				  System.out.println("run sucessful...3 ");
                //                   out.print(data);                           
				
                             //    out.close();
                              // skt.close();
                             //serverSocket.close();*/
			
              recieve();
            
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				//socket.close();
			}
			catch(Exception e){}
		}
	}

	public void recieve()
	{
		String responseLine;
		InputStream is = socket.getInputStream();
		InputStreamReader isr = new InputStreamReader(is);
		System.out.println("run sucessful...1 ");
        
		BufferedReader br = new BufferedReader(isr);
		while ((responseLine = br.readLine()) == "login") 
        {
          System.out.println("run sucessful...1 ");
        }
	}
}