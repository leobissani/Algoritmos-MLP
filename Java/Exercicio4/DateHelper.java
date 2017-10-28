import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class DateHelper {

	public static Date getDate(String data) {
    	try {
    		SimpleDateFormat auxiliarData = new SimpleDateFormat("dd/MM/yyyy");
    		return auxiliarData.parse(data);
    	}
    	catch (ParseException e) {
    		return new Date();
    	}
	}
	
}
