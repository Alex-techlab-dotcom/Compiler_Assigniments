class NoMatchingMethod {

    public static void main(String[] args){
        A a;
        B b;
        a = new A ();
        b = new B ();
        a = a.foo(b);
    }

}


class A {


    public A foo(int x){
        return a;
    }

}

class B {


}
