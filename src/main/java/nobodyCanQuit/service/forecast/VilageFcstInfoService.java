package nobodyCanQuit.service.forecast;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import nobodyCanQuit.web.model.address.FxxxKMAcoord;

@Component
public class VilageFcstInfoService {

	@Value("${serviceKey.forecast}")
	private String serviceKey;

	public URL getApiUrl(FxxxKMAcoord fxxxKMAcoord) throws IOException {

		String api = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"
				+ "?serviceKey=" + serviceKey
				+ "&dataType=json&numOfRows=999&pageNo=1" + "&base_date=" + getDate() + "&base_time=" + getTime()
				+ "&nx=" + fxxxKMAcoord.getX() + "&ny=" + fxxxKMAcoord.getY();
		return new URL(api);
	}
	
	public String getDate() {
		return LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
	}

	private String getTime() {

		String timeStr = LocalTime.now().format(DateTimeFormatter.ofPattern("HH"));
		int time = Integer.parseInt(timeStr);

		if (time >= 2 && time < 5) {
			return "0200";
		} else if (time >= 5 && time < 8) {
			return "0500";
		} else if (time >= 8 && time < 11) {
			return "0800";
		} else if (time >= 11 && time < 14) {
			return "1100";
		} else if (time >= 14 && time < 17) {
			return "1400";
		} else if (time >= 17 && time < 20) {
			return "1700";
		} else if (time >= 20 && time < 23) {
			return "2000";
		} else {
			return "2300";
		}
	}

	
}
