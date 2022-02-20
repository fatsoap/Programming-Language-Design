#include <iostream>
#include <string>
using namespace std;

template <typename T> struct Node {
    Node<T> *next, *pre;
    T value;
};

template<typename T> void add_element(Node<T> *head, T value);
template<typename T> void print_linked_list(Node<T> *head);
template<typename T> void reverse_linked_list(Node<T> *head);

int main() {
    /* Do something here */
    Node<string> *list;
    add_element(list, string("dog"));
    print_linked_list(list);
    add_element(list, string("cat"));
    print_linked_list(list);
    reverse_linked_list(list);
    print_linked_list(list);
    add_element(list, string("bird"));
    print_linked_list(list);
    reverse_linked_list(list);
    print_linked_list(list);
    add_element(list, string("bird"));
    print_linked_list(list);
    
    /* ----------------- */

    return 0;
}

template<typename T> void add_element(Node<T> *head, T value) {
    // init new node
    Node<T> *new_node = new Node<T>, *now = head;
    new_node->value = value;
    // get last node
    while(now->next) {
        now = now->next;
    }
    // append new node
    now->next = new_node;
    new_node->pre = now, new_node->next = NULL;
}

template<typename T> void print_linked_list(Node<T> *head) {
    struct Node<T> *now = head->next;
    while(now) {
        std::cout << now->value;
        if(now->next) std::cout << " -> ";
        else std::cout<< "\n";
        now = now->next;
    }
}

template<typename T> void reverse_linked_list(Node<T> *head) {
    struct Node<T> *tail = head, *tmp;
    // get last node;
    while(tail->next) {
        tail = tail->next;
    }
    // reverse
    head->next->pre = NULL;
    head->next = tail;
    tail->next = head;
    while(tail) {
        // swap
        //swap(tail->pre, tail->next);
        tmp = tail->pre;
        tail->pre = tail->next;
        tail->next = tmp;
        tail = tail->next;
    }
}
