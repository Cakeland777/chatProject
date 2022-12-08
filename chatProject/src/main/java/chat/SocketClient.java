package chat;

	import java.io.BufferedInputStream;
	import java.io.BufferedOutputStream;
	import java.io.DataInputStream;
	import java.io.DataOutputStream;
	import java.io.File;
	import java.io.FileInputStream;
	import java.io.FileOutputStream;
	import java.io.IOException;
	import java.net.InetSocketAddress;
	import java.net.Socket;
	import java.net.UnknownHostException;
	import java.sql.SQLException;
	import java.util.Base64;
	import java.util.List;

	import org.json.JSONObject;

	import member.Member;
	import member.Member.ExistMember;


	public class SocketClient {
		//필드
		chat.chatServer chatServer;
		Socket socket;
		DataInputStream dis;
		DataOutputStream dos;
		String clientIp;	
	    String uid;
	    private String roomName;
		
		//생성자
		public SocketClient(chatServer chatServer, Socket socket) {
			try {
				this.chatServer = chatServer;
				this.socket = socket;
				this.dis = new DataInputStream(socket.getInputStream());
				this.dos = new DataOutputStream(socket.getOutputStream());
				InetSocketAddress isa = (InetSocketAddress) socket.getRemoteSocketAddress();
				this.clientIp = isa.getHostName();			
				receive();
			} catch(IOException e) {
			}
		}
		
		public String getKey() {
		    return uid + "@" + clientIp;	    
		}

		private String clientDataRead() throws IOException {
	        int length = dis.readInt();
	        int pos = 0; 
	        byte [] data = new byte[length];
	        do {
	            int len = dis.read(data, pos, length - pos);
	            pos += len;
	        } while(length != pos);
	        
	        return new String(data, "UTF8");
		}
		
		//메소드: JSON 받기
		public void receive() {
			chatServer.threadPool.execute(() -> {
				try {
					boolean stop = false;
					while(true != stop) {
						String receiveJson = clientDataRead();		
						
						JSONObject jsonObject = new JSONObject(receiveJson);
						String command = jsonObject.getString("command");

						switch(command) {

	                        case "createChatRoom":
	                            this.roomName = jsonObject.getString("roomName");
	                            createChatRoom(jsonObject);
	                            stop = true;
	                            break;
	                            
	                        case "chatRoomListRequest":
	                            chatRoomListRequest(jsonObject);
	                            stop = true;
	                            break;
	                            
							case "incoming":
	                            this.uid = jsonObject.getString("uid");
	                            this.roomName = jsonObject.getString("roomName");
	                            try {
	                                chatServer.sendToAll(this, "들어오셨습니다.");
	                                chatServer.addSocketClient(this);
	                            } catch (Exception e) {
	                                e.printStackTrace();
	                            }
								break;
								
	                
	      
							case "message":
	                            try {
	                                chatServer.sendToAll(this, jsonObject.getString("data"));
	                            } catch (Exception e) {
	                                e.printStackTrace();
	                            }
								break;
						}
					}
				} catch(IOException e) {
					e.printStackTrace();
					try {
	                    chatServer.sendToAll(this, "나가셨습니다.");
	                    chatServer.removeSocketClient(this);
	                    close();
	                } catch (Exception e1) {
	                    e1.printStackTrace();
	                } 
				}
			});
		}
		
	
	        

		private void enterRoomRequest(JSONObject jsonObject) {
	        List<String> chatRoomList = chatServer.getChatRoomList(); 

	        JSONObject jsonResult = new JSONObject();
	        
	        jsonResult.put("statusCode", "0");
	        jsonResult.put("message", "채팅방 목록 조회");
	        jsonResult.put("chatRooms", chatRoomList);

	        send(jsonResult.toString());
	        
	    }
		
	    private void chatRoomListRequest(JSONObject jsonObject) {
		    List<String> chatRoomList = chatServer.getChatRoomList(); 

	        JSONObject jsonResult = new JSONObject();
	        
	        jsonResult.put("statusCode", "0");
	        jsonResult.put("message", "채팅방 목록 조회");
	        jsonResult.put("chatRooms", chatRoomList);

	        send(jsonResult.toString());
	        
	        close();        
	    }
	    private void createChatRoom(JSONObject jsonObject) {
	        JSONObject jsonResult = new JSONObject();
	        
	        try {
	            chatServer.addChatRoom(this);
	            jsonResult.put("statusCode", "0");
	            jsonResult.put("message", "[" + roomName + "] 채팅방이 생성되었습니다");
	        } catch (Exception e) {
	            e.printStackTrace();
	            jsonResult.put("statusCode", "-1");
	            jsonResult.put("message", "[" + roomName + "] 채팅방은 이미 존재합니다");
	        }

	        send(jsonResult.toString());
	        
	        System.out.println(jsonResult);
	    }
		

		

		public void send(String json) {
			try {
		        byte [] data = json.getBytes("UTF8");
		        
		        dos.writeInt(data.length);//문자열의 길이(4byte)
		        dos.write(data);//내용 
		        dos.flush();
			} catch(IOException e) {
			}
		}	
		//메소드: 연결 종료
		public void close() {
			try { 
				socket.close();
			} catch(Exception e) {}
		}
		
		public String getRoomName() {
		    return roomName; 
		}

	    public void filelist() {
	        
	    }
	}
