package com.hk.soup.studyRoom.model.biz;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.hk.soup.studyRoom.dto.StudyRoomAPIDto;

@Service
public class StudyRoomAPIBiz {
	
	private static String clientID="S0j7ooueBYEZHXiNgy0A";
	private static String clientSecret="wnakPiWnEg";
	
	public List<StudyRoomAPIDto> searchLocal(String keyword, int display, int start) throws UnsupportedEncodingException{
		List<StudyRoomAPIDto> list = null;
		
		
		try {
			URL url;
			url = new URL("https://openapi.naver.com/v1/search/local.xml?query="+URLEncoder.encode(keyword, "UTF-8")+(display !=0 ? "&display="+display : "")+(start !=0 ? "&start="+start :""));
			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
//			System.out.println(keyword);
			
			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
			
			
			parser.setInput(new InputStreamReader(urlConn.getInputStream(),"UTF-8"));
			
			int eventType = parser.getEventType();
			StudyRoomAPIDto b = null;
			while(eventType != XmlPullParser.END_DOCUMENT) {
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<StudyRoomAPIDto>();
					break;
				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if(tag.equals("item")) {
						list.add(b);
						
						b=null;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					switch (tag) {
					case "item":
						b= new StudyRoomAPIDto();
						break;
					case "title":
                        if(b != null)
                            b.setTitle(parser.nextText());
                        break;
                    case "link":
                        if(b != null)
                            b.setLink(parser.nextText());
                        break;
                    case "category":
                    	if(b!=null)
                    		b.setCategory(parser.nextText());
                    	break;
                    case "description":
                    	if(b!=null)
                    		b.setDescription(parser.nextText());
                    	break;
                    case "telephone" :
                    	if(b!=null)
                    		b.setTelephone(parser.nextText());
                    	break;
                    case "address" :
                    	if(b!=null)
                    		b.setAddress(parser.nextText());
                    	break;
                    case "roadAddress" :
                    	if(b!=null)
                    		b.setRoadAddress(parser.nextText());
                    	break;
                    case "mapx" :
                    	if(b!=null)
                    		b.setMapx(parser.nextText());
                    	break;
                    case "mapy" :
                    	if(b!=null)
                    		b.setMapy(parser.nextText());
                    	break;
					}
				}
				}
				eventType = parser.next();
			}
			
		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println(list.toString());
//		System.out.println(keyword);
		return list;
	}
	
}