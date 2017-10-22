import java.util.List;

import org.apache.hadoop.hive.ql.exec.UDF;

/**
 * 
 * @author arvind
 * Implementing a Hive UDF to convert an array into a string. 
 * The array elements will be sepearated by a separator
 */
// This class extends the UDF class because we will be defining our UDF here
public class ConcatWS extends UDF{
	/**
	 * 
	 * @param sep :separator string which will 
	 * separate elements of the array in the final string
	 * @param array: the array to be converted to string 
	 * @return: a string representation of the array where the array elements 
	 * are separated by the specified separator string
	 */
	public String evaluate(String sep, List<String> array) {
		// check first if the array is null or empty
		if(array!=null && array.size()>0) {
			// use a StringBuilder because it is immutable and we will be 
			// doing many concatenations
			StringBuilder arrayToString = new StringBuilder(array.get(0));
			// iterate through the elements of the array and before each element 
			// append the separator
			for(int i = 1;i < array.size();i++) {
				arrayToString.append(sep).append(array.get(i));
			}
			// convert stringbuilder to string and return
			return arrayToString.toString();
		}
		return null;
	}

}
