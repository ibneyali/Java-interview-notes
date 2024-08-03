import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Collectors;

public class SecondNonRepeatedChar {

//	Find the second non repeatitive character in a given string using java 8 stream.
//	Agxfdrrrgggughghgffidsassdfg

	public static void main(String[] args) {

		String str = "agbxfdrrrgggughghgffidsassdfg";

		Map<Character, Long> charFrequency = str.chars().mapToObj(c -> (char) c)
				.collect(Collectors.groupingBy(c -> c, LinkedHashMap::new, Collectors.counting()));

		Character c1 = charFrequency.entrySet().stream().filter(e -> e.getValue() == 1L).map(Map.Entry::getKey).skip(1)
				.findFirst().orElse(null);

		System.out.println(c1);
	}

}
