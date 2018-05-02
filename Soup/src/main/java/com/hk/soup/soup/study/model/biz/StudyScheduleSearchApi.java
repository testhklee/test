package com.hk.soup.soup.study.model.biz;

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

import com.hk.soup.soup.study.dto.StudyScheduleSearchApiDto;

@Service
public class StudyScheduleSearchApi {

	private static String clientID = "sU8srVy9hr9YiIPKZ4Hx";
	private static String clientSecret = "zFAI1bDlxQ";
	
	public List<StudyScheduleSearchApiDto> searchResult(String keyword, int display, int start) throws UnsupportedEncodingException {
		
		List<StudyScheduleSearchApiDto> list = null;

		try {
			URL url;

			url = new URL("https://openapi.naver.com/v1/search/local.xml?query=" + URLEncoder.encode(keyword, "UTF-8")
					+ (display != 0 ? "&display=" + display : "") + (start != 0 ? "&start=" + start : ""));

			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();

			parser.setInput(new InputStreamReader(urlConn.getInputStream(), "UTF-8"));

			int eventType = parser.getEventType();

			StudyScheduleSearchApiDto b = null;

			while (eventType != XmlPullParser.END_DOCUMENT) {
				
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT:
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<StudyScheduleSearchApiDto>();
					break;
				case XmlPullParser.END_TAG: {
					
					String tag = parser.getName();
					
					if (tag.equals("item")) {
						
						list.add(b);
						b = null;
					}
				}

				case XmlPullParser.START_TAG: {
					
					String tag = parser.getName();
					
					switch (tag) {
					case "item":
						b = new StudyScheduleSearchApiDto();
						break;
					case "title":
						if (b != null)
							b.setTitle(parser.nextText());
						break;
					case "address":
						if (b != null)
							b.setAddress(parser.nextText());
						break;
					}
				}
				}
				eventType = parser.next();
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			e.printStackTrace();
		}

		return list;
	}
	
}
