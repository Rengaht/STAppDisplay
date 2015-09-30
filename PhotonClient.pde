
import java.util.Map.Entry;
import java.util.Timer;
import java.util.TimerTask;

final String SERVER_IP="kerkerker.artgital.com:5055";
//final String SERVER_IP="192.168.2.227:5055";
String SERVER_NAME="STPhotonServer";

public class PhotonClient extends LoadBalancingClient implements Runnable{
	
	static final String LOG_TAG="PhotonClient";
	private int m_eventCount;
    boolean is_connected=true;
    boolean isReconnecting=false;


    boolean pause_handle_message=false;

	public PhotonClient(){
		super();
		
	}
	@Override
	public void run(){
		if(this.connect()){
			printlnA("[Photon] Start Running!",true);
			while(true){
				try{
	               this.loadBalancingPeer.service();
	            }catch(Exception e){
                    printlnA("[Photon] Service error: "+e.getMessage(),true);
                }
				try{
					Thread.sleep(60);
				}catch(InterruptedException e){
					e.printStackTrace();
				}	

                // reconnect when disconnected!
                if(!OFFLINE && !is_connected && !isReconnecting){
                    Timer timer=new Timer();
                    TimerTask task=new TimerTask(){
                        @Override
                        public void run(){
                            connect();
                        }
                    };
                    timer.schedule(task, 3000);
                    printlnA("[Photon] Reconnect in 3 sec...",true);
                    isReconnecting=true;
                }
			}
		}else{
			printlnA("[Photon] Connection Fail!",true);
		}
		
	}
	public boolean connect(){
		this.loadBalancingPeer=new LoadBalancingPeer(this,ConnectionProtocol.Udp);
		if(this.loadBalancingPeer.connect(SERVER_IP, SERVER_NAME)){
			return true;
		}
		return false;
	}
	/**
     * Sends event 1 for testing purposes. Your game would send more useful events.
     */
    public void sendIsLedEvent(){
        HashMap<Object, Object> eventContent = new HashMap<Object, Object>();

        this.loadBalancingPeer.opRaiseEvent((byte)GameEventCode.LJoin.getValue(), eventContent, false, (byte)0);       // this is received by OnEvent()
    }
    public void sendScoreEvent(int score1,int score2){


        printlnA("--------- Send Score : "+score1+" / "+score2+" ----------");
        HashMap<Object, Object> eventContent = new HashMap<Object, Object>();
        eventContent.put((byte)1, score1);              
        eventContent.put((byte)2, score2);              

        this.loadBalancingPeer.opRaiseEvent((byte)GameEventCode.LScore.getValue(), eventContent, false, (byte)0);       // this is received by OnEvent()
    }
    public void sendScoreEvent(int score1,int score2,int icar1,int icar2){


        printlnA("--------- Send Score : "+score1+" / "+score2+" ----------");
        HashMap<Object, Object> eventContent = new HashMap<Object, Object>();
        eventContent.put((byte)1, score1);              
        eventContent.put((byte)2, score2);              
        eventContent.put((byte)3, icar1);
        eventContent.put((byte)4, icar2);

        this.loadBalancingPeer.opRaiseEvent((byte)GameEventCode.LScore.getValue(), eventContent, false, (byte)0);       // this is received by OnEvent()
    }
    public void sendStartRunEvent(){


        printlnA("--------- Send Start Run -----------",true);
        HashMap<Object, Object> eventContent = new HashMap<Object, Object>();
        
        this.loadBalancingPeer.opRaiseEvent((byte)GameEventCode.LStartRun.getValue(), eventContent, false, (byte)0);       // this is received by OnEvent()
    }
    public void sendEatIconEvent(int side,int type){
        HashMap<Object, Object> eventContent = new HashMap<Object, Object>();        
        eventContent.put((byte)1,type);
        eventContent.put((byte)101,side);
        this.loadBalancingPeer.opRaiseEvent((byte)GameEventCode.LEatIcon.getValue(), eventContent, false, (byte)0);       // this is received by OnEvent()   
    }
    public void sendSwitchGameEvent(int game_to_switch){
        HashMap<Object, Object> eventContent = new HashMap<Object, Object>();        
        eventContent.put((byte)1,game_to_switch);
        this.loadBalancingPeer.opRaiseEvent((byte)GameEventCode.LSwitchGame.getValue(), eventContent, false, (byte)0);       // this is received by OnEvent()      
    }
    
    @Override
    public void onStatusChanged(StatusCode statusCode){
        super.onStatusChanged(statusCode);
        
        printlnA("[Photon] OnStatusChanged: "+statusCode.name(),true);
        
        switch(statusCode){
            case Connect:
                //printlnA("Connect!");
                is_connected=true;
                isReconnecting=false;
                break;
            case Disconnect:
                //printlnA("Disconnect!");
                is_connected=false;
                isReconnecting=false;
                break;
            default:
            	break;
        }
    }
    /**
     * Uses the photonEvent's provided by the server to advance the internal state and call ops as needed.
     * In this demo client, we check for a particular event (1) and count these. After that, we update the view / gui
     * @param eventData
     */
    @Override
    public void onEvent(EventData eventData){

        
        // if(pause_handle_message) return;

        GameEventCode rcv_event=GameEventCode.fromInt(eventData.Code.intValue());
        printlnA("--------------------\nEvent: "+rcv_event.toString()+"  "+millis());


        TypedHashMap<Byte,Object> params=eventData.Parameters;

         // if(params!=null){
         //     for(Entry<Byte,Object> entry:params.entrySet()){
         //         println(entry.getKey()+" -> "+entry.getValue());
         //     }
         // }else println("No Parmeters!");
        //  printlnA("--------------------\n");
        
        try{
            switch(rcv_event){
                case Server_LRequest_Score:
                    int[] scores=agame_scene[igame_scene].GetScores();
                    this.sendScoreEvent(scores[0],scores[1]);
                    agame_scene[igame_scene].EndGame();
                    break;
                case Server_Game_Info:
                    setGame((Integer)params.get((byte)1));
                    break;

                default :
                    agame_scene[igame_scene].HandleEvent(rcv_event,params);
                    break;    

            }
            
            // println("--------------------\nEvent: "+(int)eventData.Code+"  "+millis());
            // for(Entry<Byte,Object> entry:params.entrySet()){
            //     println(entry.getKey()+" -> "+entry.getValue());
            // }
              
                
        }catch(Exception e){
            printlnA("[ERR][Photon] "+e.getMessage(),true);

        }
       // 
    }


    /**
     * Uses the operationResponse's provided by the server to advance the internal state and call ops as needed.
     * In this client, we also update the form, cause new data might be available to display.
     * @param operationResponse
     */
    @Override
    public void onOperationResponse(OperationResponse operationResponse){
        
        super.onOperationResponse(operationResponse);
        TypedHashMap<Byte,Object> params=operationResponse.Parameters;
        
        GameEventCode rcv_event=GameEventCode.fromInt((int)operationResponse.OperationCode);

        printlnA("--------------------\nOpResponse: "+rcv_event.toString()+"  "+millis());

        switch(rcv_event){
            case Server_Login_Success:
                sendIsLedEvent();
                break;
            case Server_Game_Info:
                setGame((Integer)params.get((byte)1));
                break;
            case Server_LConnected:
                //setGame((Integer)params.get((byte)1));
                printlnA("[Photon] Connected as LED",true);
                break;
            case Server_Score_Success:
                //println("Set Score Success");
                agame_scene[igame_scene].HandleEvent(rcv_event,params);
                break;
            default :
                printlnA("--------------------\nUnhandled Operation: "+rcv_event.toString()+"  "+millis());
                for(Entry<Byte,Object> entry:params.entrySet()){
                    printlnA(entry.getKey()+" -> "+entry.getValue());
                }
                break;    
        }
        
    }

}
