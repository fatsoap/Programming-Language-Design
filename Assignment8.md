# Programming Language Design Assignment #8

陳錕詮 107502570

## **Aspect-Oriented Programming**

### **Logging**

Suppose that the following code is the only aspect in a AspectJ program. Will it cause stack overflow? Why?

```
public aspect Logging {
    pointcut logPrintln():
        call(* *.println(..)) && !within(Logging);
    after(): logPrintln() {
        System.out.println("println is called!");
    }
}
```

No, 因為  `&& !within(Logging)`會將在 class “Logging” 內的 pointcut 排除，所以不會因為不斷的重複呼叫而 stack overflow。

### **Memorization**

The following is a Java program calculating binomial coefficients using a recursive algorithm.Assume `n, k <= 32`, please implement a aspect to memorize/cache the binomial for speeding it up.

```jsx
class Bin {
    int binomial(int n, int k) {
      if (k == 0) return 1;
      if (n == k) return 1;
      return binomial(n - 1, k - 1) + binomial(n - 1, k);
    }

    public static void main(String[] args) {
      Bin b = new Bin();
      System.out.println(b.binomial(32, 16));
    }
}

public class Cache {
	statis private int CACHE_SIZE = 33;
	private int[][] cache = new int[CACHE_SIZE][CACHE_SIZE];
	pointcut binomial_call(int n, int k):
		call(int Bin.binomial(int, int)) && args(n, k);
	int around(int n, int k): binomial_call(n, k) {
		int value = cache[n][k];
		if (value > 0) {
			return value;
		}
		value = proceed(n, k);
		cache[n][k] = value;
		return value;
	}
}
```

---
