
import java.util.Map.Entry;
import java.util.Timer;
import java.util.TimerTask;

final String SERVER_IP="kerkerker.artgital.com:5055";
//final String SERVER_IP="192.168.2.227:5055";
final String SERVER_NAME="STPhotonServer";

public class PhotonClient extends LoadBalancingClient implements Runnable{
	
	static final String LOG_TAG="PhotonClient";
	private int m_eventCount;
    boolean is_connected=true;
    boolean isReconnecting=false;

	public PhotonClient(){
		super();
		
	}
	@Override
	public void run(){
		if(this.connect()){
			printlnA("Start Running!");
			while(true){
				try{
	               this.loadBalancingPeer.service();
	            }catch(Exception e){
                    printlnA("service error: "+e);
                }
				try{
					Thread.sleep(40);
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
                    printlnA(">>> Reconnect in 3 sec");
                    isReconnecting=true;
                }
			}
		}else{
			printlnA("Connection Fail!");
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


        printlnA("--------- Send Start Run -----------");
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
        
        printlnA("OnStatusChanged: "+statusCode.name());
        
        switch(statusCode){
            case Connect:
                printlnA("Connect!");
                is_connected=true;
                break;
            case Disconnect:
                printlnA("Disconnect!");
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
        // super.onEvent(eventData);
        // println("got event!");
        // println(eventData.Code);
        GameEventCode rcv_event=GameEventCode.fromInt(eventData.Code.intValue());
        printlnA("--------------------\nEvent: "+rcv_event.toString()+"  "+millis());


        TypedHashMap<Byte,Object> params=eventData.Parameters;

        // if(params!=null){
        //     for(Entry<Byte,Object> entry:params.entrySet()){
        //         printlnA(entry.getKey()+" -> "+entry.getValue());
        //     }
        // }else printlnA("No Parmeters!");
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
            printlnA(e.toString());

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
                setGame((Integer)params.get((byte)1));
                printlnA("Connected as LED");
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