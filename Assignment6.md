# Programming Language Design Assignment #6

> 陳錕詮 107502570
>

## 1. **Multiple Inheritance**

Given the following C++ code, please implement the `iostream` class which provides both the functionalities in istream class and ostream class.

```cpp
class ios {};

class istream : public ios {
  public:
    char read_char() {};

}

class ostream : public ios {
  public:
    void print_ch(char x) {};
};

// create iostream class
class iostream : public istream, public ostream {
	public:
    iostream(int x) : istream(x), ostream(x) {}
};
```

## 2. **Prototype-based OOP**

1. Create an object `Penguin` which inherits from `Bird` and its `fly(where)` method prints “`NAME` can’t fly” where `NAME` is the `name` attribute of the object.
2. Create an object `Duck` which inherits from `Bird`. It have a `quack` method which prints “`NAME`: quack!” where `NAME` is the `name` attribute of the object.

```jsx
var Animal = {name: "Animal"};
Animal.hello = function() {
	console.log(this.name + ": hello");
};

var Bird = Object.create(Animal);
Bird.name = "Bird";
Bird.fly = function(where) {
	console.log(this.name + " fly " + where);
};
Bird.hello() // prints "Bird: hello"

// Penguin
var Penguin = Object.create(Bird);
Penguin.name = "Penguin";
Penguin.fly = function(where) {
	console.log(this.name + " can’t fly");
};

// Duck
var Duck = Object.create(Bird);
Duck.name = "Duck";
Duck.quack = function() {
	console.log(this.name + ": quack!");
};

```

## 3. **Interface**

It is known that `motorcycle` and `car` are types of `vehicle` which can `change gear`, `speed up` and `apply brakes`. But there are many differences between them. For example, a `car` can `set air conditioner` but the `motorcycle` can’t. The gear of `motorcycle` can only be shifted up or down but the car can be set directly.
