import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class CustomHashSet {
	private int numBuckets = 10;
	List<Integer>[] buckets;

	private int index(int key) {
		return key % numBuckets;
	}

	public CustomHashSet() {
		buckets = new LinkedList[numBuckets];
	}

	public void add(int key) {
		int i = index(key);
		if (buckets[i] == null) {
			buckets[i] = new LinkedList<>();
		}
		if (buckets[i].indexOf(key) == -1) {
			buckets[i].add(key);
		}
	}

	public void remove(int key) {
		int i = index(key);
		if (buckets[i] == null)
			return;
		if (buckets[i].indexOf(key) != -1)
			buckets[i].remove(buckets[i].indexOf(key));
	}

	public boolean contains(int key) {
		int i = index(key);
		if (buckets[i] == null || buckets[i].indexOf(key) == -1) {
			return false;
		}
		return true;
	}

	public void displaySet() {
		List<Integer> l = new ArrayList<>();
		for (int i = 0; i < buckets.length; i++) {
			if (buckets[i] != null) {
				List<Integer> list = buckets[i];
				for (int j = 0; j < list.size(); j++) {
					l.add(list.get(j));
				}
			}
		}
		System.out.println(l);
	}
}
