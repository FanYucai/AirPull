package com.a1rdr0p.SEproject.action;
  
import com.opensymphony.xwork2.ActionContext;  
import com.opensymphony.xwork2.ActionInvocation;  
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;  
  
/** 
 * @author ThinkPad 
 * 
 */  
public class LoginInterceptor extends MethodFilterInterceptor{  
  
    /** 
     *  
     */  
    private static final long serialVersionUID = -4409507846064552966L;  
  
  
    /* (non-Javadoc) 
     * @see com.opensymphony.xwork2.interceptor.MethodFilterInterceptor#doIntercept(com.opensymphony.xwork2.ActionInvocation) 
     */  
    @Override  
    protected String doIntercept(ActionInvocation invoker) throws Exception {  
        // TODO Auto-generated method stub  
  
        Object loginUserName = ActionContext.getContext().getSession().get("USERNAME");  
        if(null == loginUserName){  
            return "404";  // 这里返回用户登录页面视图  
        }  
        return invoker.invoke();  
    }  
  
} 