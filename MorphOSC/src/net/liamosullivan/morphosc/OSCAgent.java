package net.liamosullivan.morphosc;
import oscP5.OscMessage;
import oscP5.OscP5;
import netP5.NetAddress;

public class OSCAgent {
	//Open Sound Control variables//////////////////////////
	OscP5 myOscP5;
	NetAddress localAddress, remoteAddress;
	int listenPort, sendPort;
	String localAddrString, remoteAddrString, debugString;

	OSCAgent(){
		//Initalise OSC with default values
		listenPort = 8001;
		sendPort = 9000;
		//localAddrString = getLocalAddress(); //returns loopback address
		localAddrString = "192.168.1.11";
		//remoteAddrString = "127.0.0.1";
		remoteAddrString = "192.168.42.175"; //laptop using ethernet tether
		debugString = "OSC ok!";
		portInit();
		addrInit();

	}
	//Open Sound Control//////////////////////////////////////////////////////////////
	//Methods to change OSC addresses and port based on OSCSettings menu fields
	int getOSCListenPort(){

		return listenPort;
	}
	void setOSCListenPort(int listenPort_) {
		listenPort = listenPort_;
		//println("Changing OSC listening port to "+listenPort);
		portInit();
	}
	int getOSCSendPort(){

		return sendPort;
	}
	
	void setOscSendPort(int sendPort_) {
		sendPort = sendPort_;
		//println("Changing OSC sending port to "+sendPort);
		addrInit();
	}
	
	String getOSCLocalAddr(){
		return localAddrString;
		
	}
	
	void setOSCLocalAddr(String localAddrString_) {
		localAddrString =localAddrString_;
		//println("Changing OSC local address to "+localAddrString);
		// No need to re-initalise OSC as listen port is not being changed.
	}
	
	String getOSCRemoteAddr(){
		return localAddrString;
		
	}
	
	void setOSCRemoteAddr(String remoteAddrString_) {
		remoteAddrString =remoteAddrString_;
		//println("Changing OSC remote address to "+remoteAddrString);
		addrInit();
	}

	void portInit() {
		/* This must be called at setup and whenever a port number is changed.*/
		myOscP5 = new OscP5(this, listenPort);
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
	
	
	/*Receive input from MorphOSC*/
	
	void relay(int layerID_, int paramID_, String paramName_, float paramVal_){
		int layerID = layerID_; 
		int paramID = paramID_; 
		String paramName =paramName_; 
		float paramVal = paramVal_;
		
	}
	
	/*Parse input received over OSC. Example below can parse TouchOSC data*/
	
	void oscEvent(OscMessage theOscMessage)
	{
		if (theOscMessage.checkTypetag("if"))
		{
			int controllerInt = theOscMessage.get(0).intValue();
			float dataFloat = theOscMessage.get(1).floatValue();
			
			
		}
		else if (theOscMessage.checkTypetag("ii"))
		{
			int controllerInt = theOscMessage.get(0).intValue();
			int dataInt = theOscMessage.get(1).intValue();
			float  dataFloat = (float)dataInt;
			
		}

		// This case parses messages from touch OSC...
		else if (theOscMessage.checkTypetag("f")) //Touch OSC slider uses TT 'f'
			// and addrpatt '/1/fader1'
		{
			float dataFloat = theOscMessage.get(0).floatValue();
			String pattString = theOscMessage.addrPattern();
			byte [] pattBytes = theOscMessage.getAddrPatternAsBytes(); 
			byte controller = pattBytes[pattBytes.length-4]; //seems to be the byte with controller no.
			controller -= 49; 
			debugString = "Typetag received: "+theOscMessage.typetag()
					+"\n with addrpattern: " + pattString
					+"\n controller: "+controller
					+"\n and data: "+dataFloat; 
			
		}
		else {
			debugString = "Unknown typetag received: "+theOscMessage.typetag()+ 
					"\n with addrpattern: " + theOscMessage.addrPattern();
		}
	}

	/*Send out OSC messages to remote address and port*/
	void send(int nodeID_, float output_) {
		//Gets messages from Output Nodes and formats as OSC before sending out
		int nodeID =nodeID_;
		float output =output_;
		OscMessage myMessage = new OscMessage("/morphOSC");
		myMessage.add(nodeID); /* add an int to the osc message */
		//myMessage.add("/");
		myMessage.add(output); /* add a float to the osc message */
		/* send the message */
		myOscP5.send(myMessage, remoteAddress);
	}
}