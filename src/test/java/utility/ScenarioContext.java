package utility;

import java.util.HashMap;

public class ScenarioContext {

    private static ScenarioContext myself = new ScenarioContext();

    private static HashMap<String,Object> sharedData = new HashMap<String, Object>();

    private ScenarioContext(){ }

    /**
     * Shared storage is setup as threadsafe by following the singleton pattern.
     * @return : The only instantiatable instance of SharedStorage.
     */
    public static ScenarioContext getInstance(){
        if(myself == null){
            myself = new ScenarioContext();
        }

        return myself;
    }

    public void clearSharedStorage(){
        myself = new ScenarioContext();
    }

    public Object getData(String key){
        return sharedData.get(key);
    }

    public void addData(String key, Object value){
        sharedData.put(key,value);
    }
}
