# Programming Language Design Assignment #10

> 107502570 陳錕詮

## Compile

```
g++ -g ./main.cpp -o ./main && ./main
```

## Usage

更改 main 函數裡面的程式，先宣告一個 Node 變數作為 Linklist 的 head，接著用 add_element & print_linked_list & reverse_linked_list 做操作。

1. int linklist

```
// main function
Node<int> *list;
add_element(list, 123);
add_element(list, 54);
add_element(list, 9);
print_linked_list(list);
reverse_linked_list(list);
print_linked_list(list);
add_element(list, 9);
print_linked_list(list);

// output
123 -> 54 -> 9
9 -> 54 -> 123
9 -> 54 -> 123 -> 9
```

2. float linklist ，避免與 double 衝突，必須括號起來特別指名為 float

```
// main function
Node<float> *list;
add_element(list, float(11.11));
add_element(list, float(5.34));
add_element(list, float(96.424));
print_linked_list(list);
reverse_linked_list(list);
print_linked_list(list);
add_element(list, float(9.0));
print_linked_list(list);

// output
11.11 -> 5.34 -> 96.424
96.424 -> 5.34 -> 11.11
96.424 -> 5.34 -> 11.11 -> 9
```

3. char linklist

```
// main function
Node<char> *list;
add_element(list, 'd');
add_element(list, 'o');
add_element(list, 'g');
print_linked_list(list);
reverse_linked_list(list);
print_linked_list(list);
add_element(list, 'A');
print_linked_list(list);

// output
d -> o -> g
g -> o -> d
g -> o -> d -> A
```

4. string linklist，避免與 char\* 衝突，必須括號起來特別指名為 string

```
// main function
Node<string> *list;
add_element(list, string("dog"));
add_element(list, string("cat"));
add_element(list, string("cow"));
print_linked_list(list);
reverse_linked_list(list);
print_linked_list(list);
add_element(list, string("bird"));
print_linked_list(list);

// output
dog -> cat -> cow
cow -> cat -> dog
cow -> cat -> dog -> bird
```
