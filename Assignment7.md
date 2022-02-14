# Programming Language Design Assignment #7

> 資工系 4B 陳錕詮 107502570
>

## **Delegation**

1. What is the difference between `delegation` and `inheritance`?
- Inheritence

```java
可以繼承 class 的屬性，並且修改。
```

- Delegation

```java
只能使用相關函數，沒辦法改變它的運行方式。
```

1. Please use `Delegation` to **rewrite** the following `java` code.

```java
class exercise {
    void print(String name){
        System.out.println("I go to gym to " + name);
    }
}
class workout {
		exercise ex = new exercise();
    String name = "work out";
    void print(){
        ex.print(this.name);
    }
}
public class delegation {
     public static void main(String []args){
        workout w = new workout();
        w.print();
     }
}
```

---

## P**olymorphism and Types**

1. When creating function `add` accepts numbers, strings, lists (both arguments have the same type).

```java
Ad-hoc polymorphism
```

1. When creating a function takes a list and counts how many elements in the list.

```java
Parametric polymorphism
```

1. When creating a binary function `mul` accepts combinations of numbers, vectors, matrices.

```java
Subtyping polymorphism
```

1. When creating a function like the following “static typed” pseudo code, which typing will allow `distance_from_origin` to accepts both type of `rect` and `circle` as its arguments?

```java
Structural typing
```

---

## **Short Description Questions**

Please answer the following questions:

1. Following the previous question, if we want to do the same thing but not using the typing mechanism used in 4.Which typing can be used? What modifications should be done?

```java
Subtyping ，讓 rect & circle 這兩個 type 都繼承有 x , y 的 super type
```

1. Suppose `Pineapple` is the subtype of `Topping`, and `Hawaiian` is the subtype of `Pizza`. Given a function type named `T: Pineapple ⟶ Pizza`. Is the function type `Topping ⟶ Hawaiian` a subtype of `T`? Explain why?

```java
Yes，因為 input type Topping是Pineapple 的supertype
且 output type Hawaiian 是Pizza的 subtype
```

---

## **Implement Code**

1. Please implement the `java` code according to the following statement.

It is know that `cat`, `dog` and `fox` are `animal`. The `cat` talks by `meow meow meow` and the `dog` does that by `woof woof woof`. But we don’t know what does the `fox` say. Now, as a human, we all like to talk to the animals. Please implement a function that can talk to the `animal`.
