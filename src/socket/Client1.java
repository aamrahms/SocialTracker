package socket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;

public class Client1
{

	private static Socket socket;
	double retMsg;
	public double clientCoord(String msg)//lat,String lng)
	{
		
		try
		{
			String host = "2405:204:e58b:daa0:e089:6e06:c495:465e";//"192.168.43.96";
			int port = 45000;
			InetAddress address = InetAddress.getByName(host);
			socket = new Socket(address, port);

			//Send the message to the server
			OutputStream os = socket.getOutputStream();
			OutputStreamWriter osw = new OutputStreamWriter(os);
			BufferedWriter bw = new BufferedWriter(osw);

			String number = "2";

			//String sendMessage = number + "\n";
                       String sendMessage = msg;
			bw.write(sendMessage);
			bw.flush();
			System.out.println("Message sent to the server : "+sendMessage);
                       

			//Get the return message from the server
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String message = br.readLine();
			System.out.println("Message received from the server : " +message);
			retMsg=Double.parseDouble(message);
			
		}
		catch (Exception exception)
		{
			exception.printStackTrace();
		}
		finally
		{
			//Closing the socket
			try
			{
				socket.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return retMsg;
	}
}