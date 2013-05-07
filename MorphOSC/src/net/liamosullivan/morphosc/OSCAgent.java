package net.liamosullivan.morphosc;
//import oscP5.OscMessage;
//import oscP5.OscPacket;
import oscP5.*;
import oscP5.OscP5;
import netP5.*;

public class OSCAgent {
	//Open Sound Control variables//////////////////////////
	MorphOSC parent;
	OscP5 op5;
	OscMessage omsg;
	NetAddress localAddress, remoteAddress;
	int listenPort, sendPort;
	String localAddrString, remoteAddrString, debugString;
	//
	OSCAgent(MorphOSC parent_){
		//Initalise OSC with default values
		parent=parent_;
		listenPort = 8000;
		sendPort = 8001;
		localAddrString = getLocalAddress(); //returns loopback address
		remoteAddrString = "127.0.0.1";
		//remoteAddrString = "192.168.42.29"; //laptop using ethernet tether
		debugString = "OSC ok!";
		portInit();
		addrInit();

	}
	//Open Sound Control//////////////////////////////////////////////////////////////
	//Methods to change OSC addresses and port based on OSCSettings menu fields
		
	
	void portInit() {
		/* This must be called at setup and whenever a port number is changed.*/
		op5 = new OscP5(this, listenPort);
	}
	void addrInit() {
		/* This must be called at setup and whenever a NetAddress is changed.*/
		//localAddress = new NetAddress(localAddrString, listenPort); // not required
		remoteAddress = new NetAddress(remoteAddrString, sendPort);
	}

	String getLocalAddress() {
		try
		{
			java.net.InetAddress localMachine =
					java.net.InetAddress.getLocalHost();	
			//System.out.println ("Hostname of local machine: " +
			//localMachine.getHostName());
			//System.out.println ("Address of local machine: " +
			//localMachine.getHostAddress());
			return localMachine.getHostAddress();
		}
		catch(java.net.UnknownHostException uhe)
		{
			//TODO:handle exception
			return "Local IP n/a";
		}
	}
	//	
	//	
	//	/*Receive input from MorphOSC*/
	//	
		void setMessage(OscMessage omsg_){
		omsg=omsg_;
						
		}
		/*Send out OSC messages to remote address and port*/
		void send() {
			op5.send(omsg, remoteAddress);
		}
	//	
	//	/*Parse input received over OSC. Example below can parse TouchOSC data*/
	//	
	//	void oscEvent(OscMessage theOscMessage)
	//	{
	//		if (theOscMessage.checkTypetag("if"))
	//		{
	//			int controllerInt = theOscMessage.get(0).intValue();
	//			float dataFloat = theOscMessage.get(1).floatValue();
	//			
	//			
	//		}
	//		else if (theOscMessage.checkTypetag("ii"))
	//		{
	//			int controllerInt = theOscMessage.get(0).intValue();
	//			int dataInt = theOscMessage.get(1).intValue();
	//			float  dataFloat = (float)dataInt;
	//			
	//		}
	//
	//		// This case parses messages from touch OSC...
	//		else if (theOscMessage.checkTypetag("f")) //Touch OSC slider uses TT 'f'
	//			// and addrpatt '/1/fader1'
	//		{
	//			float dataFloat = theOscMessage.get(0).floatValue();
	//			String pattString = theOscMessage.addrPattern();
	//			byte [] pattBytes = theOscMessage.getAddrPatternAsBytes(); 
	//			byte controller = pattBytes[pattBytes.length-4]; //seems to be the byte with controller no.
	//			controller -= 49; 
	//			debugString = "Typetag received: "+theOscMessage.typetag()
	//					+"\n with addrpattern: " + pattString
	//					+"\n controller: "+controller
	//					+"\n and data: "+dataFloat; 
	//			
	//		}
	//		else {
	//			debugString = "Unknown typetag received: "+theOscMessage.typetag()+ 
	//					"\n with addrpattern: " + theOscMessage.addrPattern();
	//		}
	//	}


}