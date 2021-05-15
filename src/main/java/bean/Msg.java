package bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 返回的类
 */
public class Msg {
    public Msg() {
    }

    private int code;

    private String msg;

    private Map<String,Object> extend = new HashMap<>();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }
    public Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }
    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public Msg(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static Msg success(){
        return new Msg(100,"处理成功");
    }
    public static Msg fail(){
        return new Msg(200,"处理失败");
    }
}
