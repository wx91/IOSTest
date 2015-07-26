package com.wxiang1991.afnetworking;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;

public class JSONProvideAction extends ActionSupport {

	public String execute() throws Exception {
		return super.execute();
	}

	public String provide() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<String> list = new ArrayList<String>();
		// JSONModel Automatic name based mapping{"id": "123","name": "Product
		// name","price": 12.95}
		list.add("{\"id\": \"123\",\"name\": \"Product name\",\"price\": 12.95}");
		// Model cascading {\"order_id\":104, \"total_price\":13.45,
		// \"product\":{\"id\":\"123\", \"name\":\"Productname\",
		// \"price\":12.95 } }
		list.add(
				"{\"order_id\":104, \"total_price\":13.45, \"product\":{\"id\":\"123\", \"name\":\"Productname\", \"price\":12.95 } }");
		// Model collections {\"order_id\":104, \"total_price\":103.45,
		// \"products\":[{\"id\":\"123\", \"name\":\"Product#1\",
		// \"price\":12.95 }, {\"id\":\"137\", \"name\":\"Product#2\",
		// \"price\":82.95 } ] }
		list.add(
				"{\"order_id\":104, \"total_price\":103.45, \"products\":[{\"id\":\"123\", \"name\":\"Product#1\", \"price\":12.95 }, {\"id\":\"137\", \"name\":\"Product#2\", \"price\":82.95 } ] }");
		//Key mapping {\"order_id\":104, \"order_details\":[{\"name\":\"Product#1\", \"price\":{\"usd\":12.95 } } ] }
		list.add("{\"order_id\":104, \"order_details\":[{\"name\":\"Product#1\", \"price\":{\"usd\":12.95 } } ] }");
		//Map automatically under_score case to camelCase {\"order_id\":104, \"order_product\":@\"Product#1\", \"order_price\":12.95 }
		list.add("{\"order_id\":104, \"order_product\":\"Product#1\", \"order_price\":12.95 }");
		//Optional properties{\"id\":\"123\",\"name\":null,\"price\":12.95}
		list.add("{\"id\":\"123\",\"name\":null,\"price\":12.95}");
		//Ignored properties {\"id\":\"123\",\"name\":null}
		list.add("{\"id\":\"123\",\"customProperty\":\"abc\"}");
		JSONArray json = new JSONArray();
		json.add(list);
		out.println(json.toString());
		out.flush();
		out.close();
		return null;
	}

}
