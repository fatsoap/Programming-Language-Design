# Programming Language Design Assignment #1

> 107502570 陳錕詮
> 

## **Dynamic and Lexical Binding (40pt)**

a.

```lisp
(let ((adder (lambda (x) (lambda (y) (+ x y)))))
    (let ((add10 (funcall adder 10)))
        (let ((x 30))
            (funcall add10 x))))
```

b.

```lisp
(let ((x 1) (y 2) (z 3))
  (let ((y 10) (z 20) (foo (lambda (y) (+ x y z))))
    (let ((x 100) (y 200) (z 300))
      (funcall foo x))))
```

1. Explain what are Dynamic Binding and Lexical Binding ?
    
    Dynamic Binding and Lexical Binding 是一種宣告&查詢變數名稱的方式
    
    1. Lexical Binding 的變數會以scope的形式宣告，在尋找變數時會一層一層向上找。
    2. Dynamic Binding 則是以全域的方式宣告，相同名字的變數將會共用。

2. Show the result of above code evaluated in both **lexical-binding and dynamic-binding** lisp interpreters.

1. **lexical-binding:** 60, **dynamic-binding:** 60
2. **lexical-binding:** 104, **dynamic-binding:** 500

## **Eager vs Lazy (30pt)**

```
def infinity():
    return infinity()

def first(x, y):
    return x

print(first(100, infinity()))
```

Explain what will happens when the **pseudo code** above being executed by both **eager and lazy** evaluation?

1. eager evaluation:
    
    進入無窮迴圈,
    
    → 在 print 時， first 會被呼叫，這時二個參數都會 evaluate ，所以 infinity 函式會馬上被呼叫，進入無窮迴圈。
    
2. lazy evaluation:
    
    印出 100,
    
    → 在 print 時， first 會被呼叫，由於第二個參數還沒有被使用，所以不會 evaluate ，一直到 return x 後 print 印出 100 ，infinity 函式始終沒有被呼叫所以不會進入無窮迴圈。
    

## **Parameter-Passing Variation (30pt)**

```
global x,y;
procedure Main:
    begin
        x=5;
        y=2;
        a(x,x-y);
        print(x);
      end;

procedure a(i,j):
    begin
        i=i+1;
        print(x);
　　 　　i=i+j;
　　 　　print(i);
　　 end;
```

```
Output:
a. 6,10,10
b. 5,9,5
c. 6,9,9
```

a. b. c. are three kinds of outputs using **different parameter-passing method**.What kind of method do each output use?

1. call-by-name
2. call-by-value
3. call-by-reference
